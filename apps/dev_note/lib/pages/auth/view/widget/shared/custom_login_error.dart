import 'package:dev_note/core/extensions/context_color.dart';
import 'package:dev_note/core/extensions/context_text_theme.dart';
import 'package:dev_note/core/extensions/translation_api_exception.dart';
import 'package:dev_note/core/theme/app_sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class CustomLoginError extends StatelessWidget {
  const CustomLoginError({
    required this.exception,
    super.key,
  });

  final Exception exception;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(Sizes.p8),
        child: Container(
          padding: const EdgeInsets.all(Sizes.p8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(Sizes.p8),
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
