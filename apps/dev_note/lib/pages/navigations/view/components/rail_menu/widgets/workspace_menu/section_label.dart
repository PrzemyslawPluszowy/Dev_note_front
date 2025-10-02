import 'package:flutter/material.dart';
import 'package:p_utils/p_utils.dart';

/// Section label widget for projects/boards headers
class SectionLabel extends StatelessWidget {
  const SectionLabel({required this.label, super.key});

  final String label;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          label,
          style: context.textTheme.labelMedium?.copyWith(
            color: context.colorScheme.outline,
            letterSpacing: 0.5,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
