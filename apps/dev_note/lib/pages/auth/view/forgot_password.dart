import 'package:auto_route/auto_route.dart';
import 'package:dev_note/core/gen/locale_keys.g.dart';
import 'package:dev_note/core/router/app_router.gr.dart';
import 'package:dev_note/core/utils/di.dart';
import 'package:dev_note/pages/auth/view/cubit/reset_auth_password_cubit.dart';
import 'package:dev_note/pages/auth/view/widget/shared/auth_info_message.dart';
import 'package:dev_note/pages/auth/view/widget/shared/custom_login_error.dart';
import 'package:dev_note/pages/auth/view/widget/shared/glass_container.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:p_repositories/repositories.dart';
import 'package:p_utils/p_utils.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:reactive_forms/reactive_forms.dart';

@RoutePage(name: 'forgotPassword')
class ForgotPassword extends HookWidget {
  const ForgotPassword({super.key});

  @override
  Widget build(BuildContext context) {
    final resetAuthPasswordCubit = useBloc(
      () => ResetAuthPasswordCubit(authRepository: getIt<AuthRepository>()),
    );

    final form = useMemoized(
      () => FormGroup(
        {
          'resetCode': FormControl<int>(
            validators: [Validators.required, Validators.number()],
          ),
          'newPassword': FormControl<String>(
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
              Validators.pattern(
                r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&#])[A-Za-z\d@$!%*?&#]+$',
              ),
            ],
          ),
        },
        validators: [Validators.mustMatch('newPassword', 'confirmPassword')],
      ),
      [],
    );
    return Center(
      child: GlassContainer(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Icon(
              PhosphorIcons.lock(
                PhosphorIconsStyle.thin,
              ),
              size: 100,
              color: Colors.white,
            ),
            gapH12,
            ReactiveForm(
              formGroup: form,
              child: BlocBuilder<ResetAuthPasswordCubit, ResetAuthPasswordState>(
                bloc: resetAuthPasswordCubit,
                builder: (context, state) {
                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // Formularz 1: Kod resetowania
                      ReactiveTextField<int>(
                        textInputAction: TextInputAction.next,
                        onSubmitted: (_) {
                          form.focus('newPassword');
                        },
                        validationMessages: {
                          ValidationMessage.required: (_) => LocaleKeys.validation_resetCodeRequired.tr(),
                          ValidationMessage.number: (_) => LocaleKeys.validation_resetCodeInvalid.tr(),
                        },
                        formControlName: 'resetCode',
                        decoration: InputDecoration(
                          label: Text(LocaleKeys.auth_resetCode.tr()),
                          icon: Icon(
                            color: Colors.white,
                            PhosphorIcons.key(PhosphorIconsStyle.thin),
                          ),
                        ),
                      ),
                      gapH12,

                      // Formularz 2: Nowe hasło
                      ReactiveTextField<String>(
                        textInputAction: TextInputAction.next,
                        onSubmitted: (_) {
                          form.focus('confirmPassword');
                        },
                        validationMessages: {
                          ValidationMessage.required: (_) => LocaleKeys.validation_passwordRequired.tr(),
                          ValidationMessage.minLength: (_) => LocaleKeys.validation_passwordMinLength.tr(),
                          ValidationMessage.pattern: (_) => LocaleKeys.validation_passwordPattern.tr(),
                        },
                        formControlName: 'newPassword',
                        obscureText: true,
                        decoration: InputDecoration(
                          label: Text(LocaleKeys.auth_newPassword.tr()),
                          icon: Icon(
                            color: Colors.white,
                            PhosphorIcons.lock(PhosphorIconsStyle.thin),
                          ),
                        ),
                      ),
                      gapH12,

                      // Formularz 3: Potwierdzenie hasła
                      ReactiveTextField<String>(
                        textInputAction: TextInputAction.done,
                        validationMessages: {
                          ValidationMessage.required: (_) => LocaleKeys.validation_confirmPasswordRequired.tr(),
                          ValidationMessage.minLength: (_) => LocaleKeys.validation_passwordMinLength.tr(),
                          ValidationMessage.pattern: (_) => LocaleKeys.validation_passwordPattern.tr(),
                          ValidationMessage.mustMatch: (_) => LocaleKeys.validation_passwordsMustMatch.tr(),
                        },
                        formControlName: 'confirmPassword',
                        obscureText: true,
                        decoration: InputDecoration(
                          label: Text(LocaleKeys.auth_confirmPassword.tr()),
                          icon: Icon(
                            color: Colors.white,
                            PhosphorIcons.lock(PhosphorIconsStyle.thin),
                          ),
                        ),
                      ),
                      gapH12,
                      if (state case ResetAuthPasswordFailure(
                        :final error,
                      )) ...[
                        CustomLoginError(exception: error),
                        gapH12,
                      ],
                      if (state case ResetAuthPasswordSuccess(
                        :final message,
                      )) ...[
                        AuthInfoMessage(message: message),
                        gapH12,
                      ],

                      // Przycisk resetowania
                      ElevatedButton(
                        onPressed: (state is ResetAuthPasswordLoading)
                            ? null
                            : () async {
                                if (form.valid) {
                                  await resetAuthPasswordCubit.sendResetPasswordCode(
                                    newPassword: form.control('newPassword').value as String,
                                    confirmPassword:
                                        form
                                                .control(
                                                  'confirmPassword',
                                                )
                                                .value
                                            as String,
                                    resetCode: form.control('resetCode').value as int,
                                  );
                                } else {
                                  form.markAllAsTouched();
                                }
                              },
                        child: Text(LocaleKeys.auth_resetPassword.tr()),
                      ),

                      gapH12,
                      Center(
                        child: TextButton(
                          child: Text(
                            LocaleKeys.auth_backToLogin.tr(),
                            style: const TextStyle(color: Colors.white),
                          ),
                          onPressed: () async {
                            await context.router.navigate(Login());
                          },
                        ),
                      ),
                      Center(
                        child: TextButton(
                          child: Text(
                            LocaleKeys.auth_needResetCode.tr(),
                            style: const TextStyle(color: Colors.white),
                          ),
                          onPressed: () async {
                            await context.router.navigate(
                              RequestResetCode(),
                            );
                          },
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
