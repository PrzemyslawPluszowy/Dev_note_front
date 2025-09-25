import 'package:auto_route/auto_route.dart';
import 'package:dev_note/core/gen/locale_keys.g.dart';
import 'package:dev_note/core/router/app_router.gr.dart';
import 'package:dev_note/core/utils/di.dart';
import 'package:dev_note/pages/auth/view/cubit/resend_activation_link_cubit.dart';
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

@RoutePage(name: 'resendActivationLinkRoute')
class ResendActivationLink extends HookWidget {
  ResendActivationLink({super.key});
  final form = FormGroup({
    'email': FormControl<String>(
      validators: [Validators.required, Validators.email],
    ),
  });
  @override
  Widget build(BuildContext context) {
    final resendActivationLinkCubit = useBloc(
      () => ResendActivationLinkCubit(authRepository: getIt<AuthRepository>()),
    );
    return Center(
      child: GlassContainer(
        child: BlocBuilder<ResendActivationLinkCubit, ResendActivationLinkState>(
          bloc: resendActivationLinkCubit,
          builder: (context, state) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  PhosphorIcons.envelopeSimple(
                    PhosphorIconsStyle.thin,
                  ),
                  size: 100,
                  color: Colors.white,
                ),
                gapH12,
                ReactiveForm(
                  formGroup: form,
                  child: Column(
                    children: [
                      ReactiveTextField<String>(
                        formControlName: 'email',
                        decoration: InputDecoration(
                          label: Text(LocaleKeys.auth_email.tr()),
                        ),
                      ),
                    ],
                  ),
                ),
                gapH12,
                if (state case ResendActivationLinkFailure(
                  :final error,
                )) ...[
                  CustomLoginError(exception: error),
                  gapH12,
                ],
                if (state case ResendActivationLinkSuccess(
                  :final message,
                )) ...[
                  AuthInfoMessage(message: message),
                  gapH12,
                ],
                if (state is ResendActivationLinkLoading) ...[
                  const CircularProgressIndicator(
                    color: Colors.white,
                  ),
                  gapH12,
                ],
                ElevatedButton.icon(
                  onPressed: state is ResendActivationLinkLoading
                      ? null
                      : () async {
                          if (form.valid) {
                            await resendActivationLinkCubit.resendActivationLink(
                              form.control('email').value as String,
                            );
                          } else {
                            form.markAllAsTouched();
                          }
                        },
                  label: Text(LocaleKeys.auth_requestActivationLink.tr()),
                  icon: Icon(
                    PhosphorIcons.arrowRight(PhosphorIconsStyle.thin),
                  ),
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
              ],
            );
          },
        ),
      ),
    );
  }
}
