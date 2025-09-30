import 'package:dev_note/core/extensions/translation_api_exception.dart';
import 'package:dev_note/core/gen/locale_keys.g.dart';
import 'package:dev_note/core/utils/di.dart';
import 'package:dev_note/pages/home/view/components/rail_menu/cubit/add_project_cubit.dart';
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

class AddProjectDialog extends HookWidget {
  const AddProjectDialog({required this.closePopup, required this.workspaceId, super.key});

  final void Function() closePopup;
  final String workspaceId;

  @override
  Widget build(BuildContext context) {
    final addProjectCubit = useBloc(() => AddProjectCubit(projectsRepository: getIt<ProjectsRepository>()));
    final FormGroup formBuilder = useMemoized(
      () => FormGroup({
        'name': FormControl<String>(
          validators: [
            Validators.required,
            Validators.minLength(3),
          ],
        ),
        'description': FormControl<String>(),
      }),
    );
    final selectedColor = useValueNotifier<ApiColorScheme?>(null);
    final selectedIcon = useValueNotifier<ApiPhosphorIcons?>(null);

    return Container(
      padding: const EdgeInsets.all(Sizes.p16),
      child: ReactiveFormBuilder(
        form: () => formBuilder,
        builder: (_, form, child) {
          return Column(
            children: [
              ReactiveTextField<String>(
                autofocus: true,
                formControlName: 'name',

                onEditingComplete: (control) => form.focus('description'),
                validationMessages: {
                  ValidationMessage.required: (_) => LocaleKeys.validation_projectNameRequired.tr(),
                  ValidationMessage.minLength: (error) => LocaleKeys.validation_minLength.tr(namedArgs: {'min': '3'}),
                },
                decoration: InputDecoration(
                  labelText: LocaleKeys.project_name.tr(),
                  hintText: LocaleKeys.project_name.tr(),
                ),
              ),
              gapH8,
              ReactiveTextField<String>(
                formControlName: 'description',
                maxLines: 3,
                decoration: InputDecoration(
                  labelText: LocaleKeys.project_description.tr(),
                  hintText: '${LocaleKeys.project_description.tr()} ',
                  alignLabelWithHint: true,
                ),
              ),
              gapH16,
              IconSelector(
                onIconSelected: (icon) {
                  selectedIcon.value = icon;
                },
              ),
              gapH16,
              CustomColorSelector(
                onColorSelected: (color) {
                  selectedColor.value = color;
                },
              ),
              gapH32,
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      form.reset();
                      closePopup();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey,
                    ),
                    child: Text(LocaleKeys.common_cancel.tr()),
                  ),
                  gapW8,
                  BlocConsumer<AddProjectCubit, AddProjectState>(
                    bloc: addProjectCubit,
                    listener: (context, state) async {
                      if (state is AddProjectSuccess) {
                        if (context.mounted) {
                          await context.read<WorkspacesMenuCubit>().fetchWorkspaces(showLoading: false);
                        }
                        await Future.microtask(closePopup);
                      } else if (state is AddProjectFailure) {
                        if (context.mounted) {
                          WebToast.showTop(
                            duration: 2000.ms,
                            toast: ToastData(
                              message: state.error.message,
                              type: WebToastType.error,
                            ),
                            context: context,
                          );
                        }
                      }
                    },
                    builder: (_, state) {
                      return LoadingButton(
                        label: LocaleKeys.common_add.tr(),
                        loadingLabel: LocaleKeys.common_loading.tr(),
                        onPressed: () async {
                          if (form.valid) {
                            // Handle form submission
                            final name = form.control('name').value as String;
                            final description = form.control('description').value as String?;
                            await addProjectCubit.addProject(
                              workspaceId: workspaceId,
                              name: name,
                              description: description,
                              primaryColor: selectedColor.value,
                              icon: selectedIcon.value,
                            );

                            await Future.microtask(closePopup);
                          }
                        },
                      );
                    },
                  ),
                ],
              ),
              gapH8,
            ],
          );
        },
      ),
    );
  }
}
