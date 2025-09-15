import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:dev_note/core/gen/locale_keys.g.dart';
import 'package:dev_note/core/router/app_router.gr.dart';
import 'package:dev_note/core/theme/app_sizes.dart';
import 'package:dev_note/pages/auth/view/widget/shared/glass_container.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:image_picker/image_picker.dart';
import 'package:p_utils/p_utils.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:reactive_forms/reactive_forms.dart';

@RoutePage(name: 'register')
class RegisterPage extends HookWidget {
  RegisterPage({super.key}) : _picker = ImagePicker();

  final ImagePicker _picker;

  Future<void> _pickImage(
    BuildContext context,
    ValueNotifier<File?> selectedImage,
  ) async {
    try {
      final image = await _picker.pickImage(
        source: ImageSource.gallery,
        maxWidth: 300,
        maxHeight: 300,
        imageQuality: 80,
      );

      if (image != null) {
        selectedImage.value = File(image.path);
      }
    } catch (e, s) {
      Logger.error(e.toString(), stackTrace: s);
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('${LocaleKeys.errors_imagePickError.tr()}: $e'),
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final selectedImage = useState<File?>(null);
    final email = useTextEditingController();
    final password = useTextEditingController();
    final confirmPassword = useTextEditingController();
    final name = useTextEditingController();
    final showPassword = useState(false);

    final form = useMemoized(
      () => FormGroup(
        {
          'email': FormControl<String>(
            validators: [Validators.required, Validators.email],
          ),
          'password': FormControl<String>(
            validators: [
              Validators.required,
              Validators.minLength(8),
              Validators.pattern(
                r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&#])[A-Za-z\d@$!%*?&#]+$',
              ),
            ],
          ),
          'confirmPassword': FormControl<String>(
            validators: [
              Validators.required,
              Validators.minLength(8),
            ],
          ),
          'name': FormControl<String>(
            validators: [
              Validators.required,
              Validators.minLength(3),
            ],
          ),
        },
        validators: [
          Validators.mustMatch('password', 'confirmPassword'),
        ],
      ),
      [],
    );

    return Center(
      child: GlassContainer(
        child: Padding(
          padding: const EdgeInsets.all(Sizes.p16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _avatarPicker(context, selectedImage),
              gapH12,
              ReactiveForm(
                formGroup: form,
                child: Column(
                  children: [
                    _emailForm(email, form),
                    gapH12,
                    _passwordForm(password, form, showPassword),
                    gapH12,
                    _confirmPasswordForm(confirmPassword, form, showPassword),
                    gapH12,
                    _nameForm(name, form),
                  ],
                ),
              ),

              gapH20,
              ElevatedButton.icon(
                onPressed: () {
                  form.markAllAsTouched();
                  if (form.valid) {
                    // Przykład nawigacji po udanej rejestracji
                    // context.router.navigate(Login());
                  }
                },
                label: Text(LocaleKeys.auth_register.tr()),
                icon: Icon(
                  PhosphorIcons.arrowRight(PhosphorIconsStyle.thin),
                ),
              ),
              gapH20,
              TextButton(
                onPressed: () async {
                  await context.router.navigate(Login());
                },
                child: Text(
                  LocaleKeys.auth_alreadyHaveAccount.tr(),
                  style: const TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  ReactiveTextField<String> _nameForm(
    TextEditingController name,
    FormGroup form,
  ) {
    return ReactiveTextField<String>(
      textInputAction: TextInputAction.done,
      controller: name,
      onSubmitted: (_) {
        form.markAllAsTouched();
        if (form.valid) {}
      },
      validationMessages: {
        ValidationMessage.required: (_) =>
            LocaleKeys.validation_nameRequired.tr(),
      },
      formControlName: 'name',
      decoration: InputDecoration(
        errorMaxLines: 2,
        label: Text(LocaleKeys.auth_name.tr()),
        focusedBorder: const OutlineInputBorder(),
        icon: Icon(
          PhosphorIcons.user(
            PhosphorIconsStyle.thin,
          ),
          color: Colors.white,
        ),
      ),
    );
  }

  ReactiveTextField<String> _confirmPasswordForm(
    TextEditingController confirmPassword,
    FormGroup form,
    ValueNotifier<bool> showPassword,
  ) {
    return ReactiveTextField<String>(
      textInputAction: TextInputAction.next,
      controller: confirmPassword,
      onSubmitted: (_) {
        form.focus('name');
      },
      validationMessages: {
        ValidationMessage.required: (_) =>
            LocaleKeys.validation_confirmPasswordRequired.tr(),
        ValidationMessage.minLength: (_) =>
            LocaleKeys.validation_passwordMinLength.tr(),
        'mustMatch': (_) => LocaleKeys.validation_passwordsMustMatch.tr(),
      },
      formControlName: 'confirmPassword',
      keyboardType: TextInputType.visiblePassword,
      obscureText: !showPassword.value,

      decoration: InputDecoration(
        suffixIcon: GestureDetector(
          onTap: () {
            showPassword.value = !showPassword.value;
          },
          child: Icon(
            showPassword.value
                ? PhosphorIcons.eye(PhosphorIconsStyle.thin)
                : PhosphorIcons.eyeSlash(PhosphorIconsStyle.thin),
          ),
        ),

        errorMaxLines: 2,
        label: Text(LocaleKeys.auth_confirmPassword.tr()),
        focusedBorder: const OutlineInputBorder(),
        icon: Icon(
          PhosphorIcons.lock(PhosphorIconsStyle.thin),
          color: Colors.white,
        ),
      ),
    );
  }

  ReactiveTextField<String> _passwordForm(
    TextEditingController password,
    FormGroup form,
    ValueNotifier<bool> showPassword,
  ) {
    return ReactiveTextField<String>(
      textInputAction: TextInputAction.next,
      controller: password,
      onSubmitted: (_) {
        form.focus('confirmPassword');
      },
      validationMessages: {
        ValidationMessage.required: (_) =>
            LocaleKeys.validation_passwordRequired.tr(),
        ValidationMessage.minLength: (_) =>
            LocaleKeys.validation_passwordMinLength.tr(),
        ValidationMessage.pattern: (_) =>
            LocaleKeys.validation_passwordPattern.tr(),
      },
      formControlName: 'password',
      keyboardType: TextInputType.visiblePassword,
      obscureText: !showPassword.value,
      decoration: InputDecoration(
        suffixIcon: GestureDetector(
          onTap: () {
            showPassword.value = !showPassword.value;
          },
          child: Icon(
            showPassword.value
                ? PhosphorIcons.eye(PhosphorIconsStyle.thin)
                : PhosphorIcons.eyeSlash(PhosphorIconsStyle.thin),
          ),
        ),

        errorMaxLines: 2,
        label: Text(LocaleKeys.auth_password.tr()),
        focusedBorder: const OutlineInputBorder(),
        icon: Icon(
          PhosphorIcons.lock(PhosphorIconsStyle.thin),
          color: Colors.white,
        ),
      ),
    );
  }

  ReactiveTextField<String> _emailForm(
    TextEditingController email,
    FormGroup form,
  ) {
    return ReactiveTextField<String>(
      textInputAction: TextInputAction.next,
      controller: email,
      onSubmitted: (_) {
        form.focus('password');
      },
      validationMessages: {
        ValidationMessage.required: (_) =>
            LocaleKeys.validation_emailRequired.tr(),
        ValidationMessage.email: (_) => LocaleKeys.validation_emailInvalid.tr(),
      },
      formControlName: 'email',
      decoration: InputDecoration(
        errorMaxLines: 2,
        label: Text(LocaleKeys.auth_email.tr()),
        icon: Icon(
          PhosphorIcons.user(PhosphorIconsStyle.thin),
          color: Colors.white,
        ),
      ),
    );
  }

  InkWell _avatarPicker(
    BuildContext context,
    ValueNotifier<File?> selectedImage,
  ) {
    return InkWell(
      onTap: () => _pickImage(context, selectedImage),
      child: CircleAvatar(
        radius: 70,
        backgroundColor: Colors.white,
        backgroundImage: selectedImage.value != null
            ? FileImage(selectedImage.value!)
            : null,
        child: selectedImage.value == null
            ? Icon(
                PhosphorIcons.userPlus(
                  PhosphorIconsStyle.thin,
                ),
                size: 100,
                color: Colors.blueGrey,
              )
            : null,
      ),
    );
  }
}
