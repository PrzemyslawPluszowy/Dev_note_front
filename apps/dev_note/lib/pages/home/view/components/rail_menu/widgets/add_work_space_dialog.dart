import 'package:dev_note/core/gen/locale_keys.g.dart';
import 'package:dev_note/core/utils/di.dart';
import 'package:dev_note/pages/home/view/components/rail_menu/cubit/add_workspace_cubit.dart';
import 'package:dev_note/pages/home/view/components/rail_menu/cubit/workspaces_menu_cubit.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:p_repositories/repositories.dart';
import 'package:p_shared_ui/p_shared_ui.dart';
import 'package:p_utils/p_utils.dart';
import 'package:reactive_forms/reactive_forms.dart';

class AddWorkSpaceDialog extends HookWidget {
  const AddWorkSpaceDialog({required this.closePopup, super.key});

  final void Function() closePopup;

  @override
  Widget build(BuildContext context) {
    final createWorkspaceCubit = useBloc(() => AddWorkspaceCubit(workspacesRepository: getIt<WorkspacesRepository>()));
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
                  ValidationMessage.required: (_) => LocaleKeys.validation_workspaceNameRequired.tr(),
                  ValidationMessage.minLength: (error) => LocaleKeys.validation_minLength.tr(namedArgs: {'min': '3'}),
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
                  hintText: '${LocaleKeys.workspace_description.tr()} ',
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
                  BlocBuilder<AddWorkspaceCubit, AddWorkspaceState>(
                    bloc: createWorkspaceCubit,
                    builder: (_, state) {
                      return LoadingButton(
                        label: LocaleKeys.common_add.tr(),
                        loadingLabel: LocaleKeys.common_loading.tr(),
                        onPressed: () async {
                          if (form.valid) {
                            // Handle form submission
                            final name = form.control('name').value as String;
                            final description = form.control('description').value as String?;
                            await createWorkspaceCubit.createWorkspace(
                              name: name,
                              description: description,
                              color: selectedColor.value,
                              icon: selectedIcon.value,
                            );
                            if (context.mounted) {
                              await context.read<WorkspacesMenuCubit>().fetchWorkspaces();
                            }
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
