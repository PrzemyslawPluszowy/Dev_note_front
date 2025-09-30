import 'package:dev_note/core/extensions/translation_api_exception.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:p_utils/p_utils.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class CustomErrorWidget extends StatelessWidget {
  const CustomErrorWidget({
    required this.exception,
    super.key,
    this.width,
  });

  final Exception exception;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(Sizes.p8),
      child: Container(
        width: width,
        padding: const EdgeInsets.all(Sizes.p8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Sizes.p8),
          gradient: LinearGradient(
            colors: [
              context.colorScheme.error.withValues(alpha: 0.3),
              context.colorScheme.error.withValues(alpha: 0.05),
            ],
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
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
    ).animate().fadeIn(duration: 300.ms);
  }
}
