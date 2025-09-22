import 'package:auto_route/auto_route.dart';
import 'package:dev_note/core/gen/locale_keys.g.dart';
import 'package:dev_note/core/theme/app_sizes.dart';
import 'package:dev_note/core/utils/di.dart';
import 'package:dev_note/pages/auth/view/cubit/send_reset_code_cubit.dart';
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

@RoutePage(name: 'requestResetCode')
class RequestResetCode extends HookWidget {
  RequestResetCode({super.key});

  final form = FormGroup({
    'email': FormControl<String>(
      validators: [Validators.required, Validators.email],
    ),
  });

  @override
  Widget build(BuildContext context) {
    final SendResetCodeCubit sendResetCodeCubit = useBloc(
      () => SendResetCodeCubit(authRepository: getIt<AuthRepository>()),
    );
    return Center(
      child: GlassContainer(
        child: BlocBuilder<SendResetCodeCubit, SendResetCodeState>(
          bloc: sendResetCodeCubit,
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
                if (state case SendResetCodeFailure(:final error)) ...[
                  gapH12,
                  CustomLoginError(exception: error),
                ],
                if (state case SendResetCodeSuccess(:final message)) ...[
                  gapH12,
                  AuthInfoMessage(message: message),
                ],

                if (state case SendResetCodeLoading()) ...[
                  gapH12,
                  const Center(
                    child: CircularProgressIndicator(
                      color: Colors.white,
                    ),
                  ),
                ],
                gapH12,
                ElevatedButton.icon(
                  onPressed: state is SendResetCodeLoading
                      ? null
                      : () async {
                          if (form.valid) {
                            await sendResetCodeCubit.sendResetCode(
                              form.control('email').value as String,
                            );
                          } else {
                            form.markAllAsTouched();
                          }
                        },
                  label: Text(LocaleKeys.auth_requestResetCode.tr()),
                  icon: Icon(PhosphorIcons.arrowRight(PhosphorIconsStyle.thin)),
                ),
                gapH12,
                Center(
                  child: TextButton(
                    child: Text(
                      LocaleKeys.auth_backToResetPassword.tr(),
                      style: const TextStyle(color: Colors.white),
                    ),
                    onPressed: () {
                      context.router.pop();
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
