import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:p_models/models.dart';
import 'package:p_shared_ui/p_shared_ui.dart';
import 'package:p_utils/p_utils.dart';
import 'package:reactive_forms/reactive_forms.dart';

class EditWorkspaceWidget extends HookWidget {
  const EditWorkspaceWidget({
    required this.workspace,
    super.key,
  });

  final WorkspacesModel workspace;

  @override
  Widget build(BuildContext context) {
    final FormGroup formBuilder = useMemoized(
      () => FormGroup({
        'name': FormControl<String>(
          value: workspace.name,
          validators: [
            Validators.required,
            Validators.minLength(3),
          ],
        ),
        'description': FormControl<String>(
          value: workspace.description,
        ),
      }),
    );
    final selectedColor = useValueNotifier<ApiColorScheme?>(workspace.primaryColor);
    final selectedIcon = useValueNotifier<ApiPhosphorIcons?>(workspace.icon);

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
            'Edytuj workspace',
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
                      ValidationMessage.required: (_) => "Nazwa workspace'a jest wymagana",
                      ValidationMessage.minLength: (error) => "Nazwa workspace'a musi mieć conajmniej 3 znaki",
                    },
                    decoration: const InputDecoration(
                      labelText: "Nazwa workspace'a",
                      hintText: 'Np. Mój nowy workspace',
                    ),
                  ),
                  gapH8,
                  ReactiveTextField<String>(
                    formControlName: 'description',
                    maxLines: 3,
                    decoration: const InputDecoration(
                      labelText: 'Opis',
                      hintText: 'Opis (opcjonalnie)',
                      alignLabelWithHint: true,
                    ),
                  ),
                  gapH8,
                  CustomColorSelector(
                    initialColor: workspace.primaryColor,
                    onColorSelected: (color) {
                      selectedColor.value = color;
                    },
                  ),
                  gapH16,
                  IconSelector(
                    initialIcon: workspace.icon,
                    onIconSelected: (icon) {
                      selectedIcon.value = icon;
                    },
                  ),
                ],
              );
            },
          ),
          gapH32,
          LoadingButton(
            onPressed: () async {
              if (formBuilder.valid) {
                // TODO(dev-note): Implement workspace editing.
              }
              // TODO(dev-note): Implement workspace editing.
            },
            label: 'Zapisz',
          ),
        ],
      ),
    );
  }
}
