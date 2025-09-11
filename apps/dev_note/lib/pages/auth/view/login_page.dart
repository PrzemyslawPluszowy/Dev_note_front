import 'package:auto_route/auto_route.dart';
import 'package:dev_note/core/gen/locale_keys.g.dart';
import 'package:dev_note/core/router/app_router.gr.dart';
import 'package:dev_note/core/theme/app_sizes.dart';
import 'package:dev_note/main.dart';
import 'package:dev_note/pages/auth/view/widget/shared/glass_container.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:reactive_forms/reactive_forms.dart';

@RoutePage(name: 'login')
class LoginPageContent extends StatelessWidget {
  LoginPageContent({
    super.key,
  });

  final form = FormGroup({
    'email': FormControl<String>(
      validators: [Validators.required, Validators.email],
    ),
    'password': FormControl<String>(
      validators: [
        Validators.required,
        Validators.minLength(8),
      ],
    ),
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GlassContainer(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Icon(
              PhosphorIcons.user(
                PhosphorIconsStyle.thin,
              ),
              size: 100,
              color: Colors.white,
            ),
            ReactiveForm(
              formGroup: form,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ReactiveTextField<String>(
                    textInputAction: TextInputAction.next,
                    onSubmitted: (_) {
                      form.focus('password');
                    },
                    validationMessages: {
                      ValidationMessage.required: (_) =>
                          LocaleKeys.validation_emailRequired.tr(),
                      ValidationMessage.email: (_) =>
                          LocaleKeys.validation_emailInvalid.tr(),
                    },
                    formControlName: 'email',
                    decoration: InputDecoration(
                      label: Text(LocaleKeys.auth_email.tr()),
                      icon: Icon(
                        color: Colors.white,
                        PhosphorIcons.user(
                          PhosphorIconsStyle.thin,
                        ),
                      ),
                    ),
                  ),
                  gapH12,
                  ReactiveTextField<String>(
                    textInputAction: TextInputAction.done,
                    onSubmitted: (_) {
                      form.markAllAsTouched();
                      if (form.valid) {
                        logger.info('Logowanie...');
                      }
                    },
                    validationMessages: {
                      ValidationMessage.required: (_) =>
                          LocaleKeys.validation_passwordRequired.tr(),
                      ValidationMessage.minLength: (_) =>
                          LocaleKeys.validation_passwordMinLength.tr(),
                    },
                    formControlName: 'password',
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: true,
                    decoration: InputDecoration(
                      label: Text(LocaleKeys.auth_password.tr()),
                      focusedBorder: const OutlineInputBorder(),
                      icon: Icon(
                        color: Colors.white,
                        PhosphorIcons.lock(
                          PhosphorIconsStyle.thin,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            gapH12,
            Center(
              child: ElevatedButton.icon(
                onPressed: () {},
                label: Text(LocaleKeys.auth_login.tr()),
                icon: Icon(
                  PhosphorIcons.arrowRight(PhosphorIconsStyle.thin),
                ),
              ),
            ),
            gapH12,
            Center(
              child: TextButton(
                onPressed: () {
                  context.router.navigate(Register());
                },
                child: Text(
                  LocaleKeys.auth_register.tr(),
                  style: const TextStyle(color: Colors.white),
                ),
              ),
            ),
            Center(
              child: TextButton(
                onPressed: () {
                  context.router.navigate(ForgotPassword());
                },
                child: Text(
                  LocaleKeys.auth_forgotPassword.tr(),
                  style: const TextStyle(color: Colors.white),
                ),
              ),
            ),
            Center(
              child: TextButton(
                onPressed: () {
                  context.router.navigate(ResendActivationLinkRoute());
                },
                child: Text(
                  LocaleKeys.auth_lostActivationLink.tr(),
                  style: const TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
