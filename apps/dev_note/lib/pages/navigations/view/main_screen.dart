import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:p_utils/p_utils.dart';

/// Wraper na strone główną aplikacji
/// [child] - widget do wyświetlenia w środku
/// ustawia tło i ramkę
/// i implementuje AutoRoutePage

@RoutePage(name: 'main')
class MainScreen extends StatelessWidget {
  const MainScreen({
    this.child,
    super.key,
  });
  final Widget? child;
  @override
  Widget build(BuildContext context) {
    // Return a non-flex widget so callers can decide how to flex/expand it.
    return ColoredBox(
      color: context.colorScheme.primary,
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(Sizes.p8),
          bottomRight: Radius.circular(Sizes.p8),
        ),
        child: ColoredBox(
          color: context.colorScheme.primary.withAlpha(190),
          child: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(Sizes.p8),
                bottomRight: Radius.circular(Sizes.p8),
              ),
              color: context.colorScheme.surface,
              boxShadow: [
                BoxShadow(
                  color: context.colorScheme.shadow.withValues(alpha: .3),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: child ?? const AutoRouter(),
          ),
        ),
      ),
    );
  }
}
