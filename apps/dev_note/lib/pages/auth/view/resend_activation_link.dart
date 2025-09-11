import 'package:auto_route/auto_route.dart';
import 'package:dev_note/core/gen/locale_keys.g.dart';
import 'package:dev_note/core/router/app_router.gr.dart';
import 'package:dev_note/core/theme/app_sizes.dart';
import 'package:dev_note/pages/auth/view/widget/shared/glass_container.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:reactive_forms/reactive_forms.dart';

@RoutePage(name: 'resendActivationLinkRoute')
class ResendActivationLink extends StatelessWidget {
  ResendActivationLink({super.key});
  final form = FormGroup({
    'email': FormControl<String>(
      validators: [Validators.required, Validators.email],
    ),
  });
  @override
  Widget build(BuildContext context) {
    return Center(
      child: GlassContainer(
        child: Column(
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
            ElevatedButton.icon(
              onPressed: () {},
              label: Text(LocaleKeys.auth_requestActivationLink.tr()),
              icon: Icon(PhosphorIcons.arrowRight(PhosphorIconsStyle.thin)),
            ),
            gapH12,
            Center(
              child: TextButton(
                child: Text(
                  LocaleKeys.auth_backToLogin.tr(),
                  style: const TextStyle(color: Colors.white),
                ),
                onPressed: () {
                  context.router.navigate(Login());
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
