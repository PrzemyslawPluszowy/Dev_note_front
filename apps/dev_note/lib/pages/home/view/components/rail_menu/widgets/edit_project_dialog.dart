import 'package:dev_note/core/extensions/translation_api_exception.dart';
import 'package:dev_note/core/gen/locale_keys.g.dart';
import 'package:dev_note/core/shared/widgets/custom_error_widget.dart';
import 'package:dev_note/core/utils/di.dart';
import 'package:dev_note/pages/home/view/components/rail_menu/cubit/edit_project_cubit.dart';
import 'package:dev_note/pages/home/view/components/rail_menu/cubit/workspaces_menu_cubit.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:p_repositories/repositories.dart';
import 'package:p_shared_ui/p_shared_ui.dart';
import 'package:p_utils/p_utils.dart';
import 'package:reactive_forms/reactive_forms.dart';

class EditProjectDialog extends HookWidget {
  const EditProjectDialog({
    required this.projectModel,
    required this.closeCallback,
    required this.workspaceId,
    super.key,
  });

  final ProjectModel projectModel;
  final String workspaceId;
  final void Function() closeCallback;

  @override
  Widget build(BuildContext context) {
    final editProjectCubit = useBloc(() => EditProjectCubit(projectsRepository: getIt<ProjectsRepository>()));
    final FormGroup formBuilder = useMemoized(
      () => FormGroup({
        'name': FormControl<String>(
          value: projectModel.name,
          validators: [
            Validators.required,
            Validators.minLength(3),
          ],
        ),
        'description': FormControl<String>(
          value: projectModel.description,
        ),
      }),
    );
    final selectedColor = useValueNotifier<ApiColorScheme?>(projectModel.primaryColor);
    final selectedIcon = useValueNotifier<ApiPhosphorIcons?>(projectModel.icon);

    return Container(
      margin: const EdgeInsets.only(left: Sizes.p8),
      padding: const EdgeInsets.all(Sizes.p8),
      width: 350,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(Sizes.p2),
      ),
      child: Column(
        children: [
          Text(
            LocaleKeys.workspace_title.tr(),
            style: context.textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.w900,
            ),
          ),
          gapH16,
          ReactiveFormBuilder(
            form: () => formBuilder,
            builder: (_, form, child) {
              return Column(
                children: [
                  ReactiveTextField<String>(
                    autofocus: true,
                    formControlName: 'name',
                    onEditingComplete: (control) => form.focus('description'),
                    validationMessages: {
                      ValidationMessage.required: (_) => LocaleKeys.validation_workspaceNameRequired.tr(),
                      ValidationMessage.minLength: (error) =>
                          LocaleKeys.validation_minLength.tr(namedArgs: {'min': '3'}),
                    },
                    decoration: InputDecoration(
                      labelText: LocaleKeys.workspace_name.tr(),
                      hintText: LocaleKeys.workspace_nameHint.tr(),
                    ),
                  ),
                  gapH8,
                  ReactiveTextField<String>(
                    formControlName: 'description',
                    maxLines: 3,
                    decoration: InputDecoration(
                      labelText: LocaleKeys.workspace_description.tr(),
                      hintText: LocaleKeys.workspace_descriptionHint.tr(),
                      alignLabelWithHint: true,
                    ),
                  ),
                  gapH8,
                  CustomColorSelector(
                    initialColor: projectModel.primaryColor,
                    onColorSelected: (color) {
                      selectedColor.value = color;
                    },
                  ),
                  gapH16,
                  IconSelector(
                    initialIcon: projectModel.icon,
                    onIconSelected: (icon) {
                      selectedIcon.value = icon;
                    },
                  ),
                  gapH8,
                  AnimatedSize(
                    alignment: Alignment.topLeft,
                    duration: 220.ms,
                    curve: Curves.easeInOut,
                    child: BlocConsumer<EditProjectCubit, EditProjectState>(
                      bloc: editProjectCubit,
                      listener: (_, state) async {
                        if (state is EditProjectSuccess) {
                          WebToast.showTop(
                            toast: ToastData(
                              message: LocaleKeys.messages_projectUpdated.tr(namedArgs: {'name': projectModel.name}),
                              type: WebToastType.success,
                            ),
                            context: context,
                          );
                          await context.read<WorkspacesMenuCubit>().fetchWorkspaces(showLoading: false);
                          closeCallback();
                        }
                        if (state is EditProjectFailure) {
                          if (context.mounted) {
                            WebToast.showTop(
                              toast: ToastData(
                                message: state.error.message,
                                type: WebToastType.error,
                              ),
                              context: context,
                            );
                          }
                        }
                      },
                      builder: (context, state) {
                        if (state case EditProjectFailure(:final error)) {
                          return CustomErrorWidget(exception: error, width: double.infinity);
                        }
                        return const SizedBox.shrink();
                      },
                    ),
                  ),
                ],
              );
            },
          ),

          gapH32,
          LoadingButton(
            onPressed: () async {
              if (formBuilder.valid) {
                await editProjectCubit.editProject(
                  projectId: projectModel.id,
                  workspaceId: workspaceId,
                  name: formBuilder.control('name').value as String,
                  description: formBuilder.control('description').value as String?,
                  icon: selectedIcon.value,
                  primaryColor: selectedColor.value,
                );
              }
            },
            label: LocaleKeys.common_save.tr(),
          ),
        ],
      ),
    );
  }
}
