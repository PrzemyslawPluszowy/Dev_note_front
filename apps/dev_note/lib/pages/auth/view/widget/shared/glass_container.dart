import 'package:dev_note/core/shared/widgets/gradient_box_border.dart';
import 'package:dev_note/core/theme/app_sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class GlassContainer extends StatelessWidget {
  const GlassContainer({required this.child, super.key});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(Sizes.p16),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      width: 500,
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.3),
        borderRadius: BorderRadius.circular(Sizes.p16),
        border: const GradientBoxBorder(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 255, 255, 255),
              Color.fromARGB(94, 255, 255, 255),
            ],
          ),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.2),
            blurRadius: Sizes.p12,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: child,
    ).animate().fadeIn(duration: 200.milliseconds, delay: 200.milliseconds);
  }
}
