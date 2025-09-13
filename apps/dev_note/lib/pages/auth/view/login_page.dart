import 'package:auto_route/auto_route.dart';
import 'package:dev_note/core/extensions/context_color.dart';
import 'package:dev_note/core/extensions/context_text_theme.dart';
import 'package:dev_note/core/extensions/translation_api_exception.dart';
import 'package:dev_note/core/gen/locale_keys.g.dart';
import 'package:dev_note/core/router/app_router.gr.dart';
import 'package:dev_note/core/theme/app_sizes.dart';
import 'package:dev_note/core/utils/di.dart';
import 'package:dev_note/pages/auth/view/cubit/login_cubit.dart';
import 'package:dev_note/pages/auth/view/widget/shared/glass_container.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:p_repositories/repositories.dart';
import 'package:p_utils/p_utils.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:reactive_forms/reactive_forms.dart';

@RoutePage(name: 'login')
class LoginPageContent extends HookWidget {
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
  String get email => form.control('email').value as String;
  String get password => form.control('password').value as String;

  @override
  Widget build(BuildContext context) {
    final loginBloc = useBloc(
      () => LoginCubit(
        authRepository: getIt<AuthRepository>(),
        userRepository: getIt<UserRepository>(),
      ),
    );
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
                        loginBloc.login(
                          email,
                          password,
                        );
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
            BlocBuilder<LoginCubit, LoginState>(
              bloc: loginBloc,
              builder: (context, state) {
                if (state case LoginFailure(:final exception)) {
                  return CustomLoginError(exception: exception);
                }
                if (state case LoginLoading()) {
                  return const Center(
                    child: CircularProgressIndicator(
                      color: Colors.white,
                    ),
                  );
                }
                return const SizedBox.shrink();
              },
            ),

            gapH12,
            Center(
              child: ElevatedButton.icon(
                onPressed: () {
                  form.markAllAsTouched();
                  if (form.valid) {
                    loginBloc.login(
                      email,
                      password,
                    );
                  }
                },
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

//TODO do refkatoryzacjai na pływający widżet

class CustomLoginError extends StatelessWidget {
  const CustomLoginError({
    required this.exception,
    super.key,
  });

  final ApiException exception;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(Sizes.p8),
        child: Container(
          padding: const EdgeInsets.all(Sizes.p8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            gradient: RadialGradient(
              radius: 15,
              focal: Alignment.bottomCenter,
              focalRadius: 0.1,
              center: Alignment.bottomCenter,
              colors: [
                Colors.white.withValues(alpha: 0.7),
                Colors.white.withValues(alpha: 0),
              ],
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                PhosphorIcons.warningDiamond(
                  PhosphorIconsStyle.thin,
                ),
                color: context.colorScheme.error,
              ),
              gapW8,
              Text(
                exception.message,
                style: context.textTheme.bodyMedium?.copyWith(
                  color: context.colorScheme.error,
                ),
              ),
            ],
          ),
        ),
      ),
    ).animate().fadeIn(duration: 300.ms);
  }
}
