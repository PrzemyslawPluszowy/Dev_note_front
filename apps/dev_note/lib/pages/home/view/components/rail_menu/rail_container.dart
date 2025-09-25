import 'package:flutter/material.dart';
import 'package:p_utils/p_utils.dart';

class RailContainer extends StatelessWidget {
  const RailContainer({
    required this.child,
    super.key,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(Sizes.p8),
      width: 300,
      height: double.infinity,

      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          stops: const [0.3, 1],

          colors: [
            context.colorScheme.primary.withAlpha(190),
            context.colorScheme.primary.withAlpha(100),
          ],
        ),
        color: context.colorScheme.surface,

        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(Sizes.p12),
          bottomLeft: Radius.circular(Sizes.p12),
        ),
      ),
      child: child,
    );
  }
}
