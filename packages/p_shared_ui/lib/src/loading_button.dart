import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:p_utils/p_utils.dart';

/// `LoadingButton` — przycisk z obsługą stanu ładowania.
///
/// Komponent umożliwia wywołanie asynchronicznej funkcji [onPressed] i
/// automatyczne zarządzanie stanem ładowania: podczas oczekiwania na
/// zakończenie przyszłego (`Future`) przycisk pokaże [loadingLabel] oraz
/// spinner, a kolejne kliknięcia będą ignorowane do zakończenia operacji.
///
/// Przykład użycia:
///
/// ```dart
/// LoadingButton(
///   onPressed: () async { await save(); },
///   label: 'Zapisz',
///   loadingLabel: 'Trwa zapisywanie...',
/// )
/// ```
class LoadingButton extends HookWidget {
  /// Tworzy instancję [LoadingButton].
  ///
  /// Parametry:
  /// - [onPressed]: obowiązkowy asynchroniczny callback wykonywany po naciśnięciu.
  /// - [label]: tekst widoczny, gdy przycisk nie jest w stanie ładowania.
  /// - [loadingLabel]: tekst widoczny podczas oczekiwania (stan ładowania).
  /// - [foregroundColor]: (opcjonalnie) kolor tekstu/ikon na przycisku.
  /// - [backgroundColor]: (opcjonalnie) kolor tła przycisku.
  const LoadingButton({
    required this.onPressed,
    this.label = 'Add Workspace',
    this.loadingLabel = 'Adding...',
    super.key,
    this.foregroundColor,
    this.backgroundColor,
  });

  /// Asynchroniczny callback wywoływany po naciśnięciu przycisku.
  ///
  /// Funkcja powinna zwracać `Future<void>` — [LoadingButton] ustawi wewnętrzny
  /// stan ładowania na `true` do momentu zakończenia tego future'a.
  final Future<void> Function() onPressed;

  /// Tekst wyświetlany, gdy przycisk nie jest w trybie ładowania.
  final String label;

  /// Tekst wyświetlany podczas ładowania (gdy `onPressed` jeszcze się wykonuje).
  final String loadingLabel;

  /// Kolor treści przycisku (tekst/ikonki). Domyślnie `Colors.white`.
  final Color? foregroundColor;

  /// Kolor tła przycisku. Domyślnie pobierany z [context.colorScheme.primary].
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    final isLoading = useState<bool>(false);

    return GestureDetector(
      onTap: () async {
        if (isLoading.value) return;
        try {
          isLoading.value = true;
          await onPressed();
        } finally {
          isLoading.value = false;
        }
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        width: isLoading.value ? 180 : 170,

        child: ElevatedButton(
          onPressed: isLoading.value
              ? null
              : () async {
                  // mirror dla zachowania klawiatury w przypadku użycia ElevatedButton
                  try {
                    isLoading.value = true;
                    await onPressed();
                  } finally {
                    isLoading.value = false;
                  }
                },
          style: ElevatedButton.styleFrom(
            foregroundColor: foregroundColor ?? Colors.white,
            backgroundColor: backgroundColor ?? context.colorScheme.primary,
          ),
          child: AnimatedSwitcher(
            duration: const Duration(milliseconds: 250),
            transitionBuilder: (child, animation) => FadeTransition(
              opacity: animation,
              child: ScaleTransition(scale: animation, child: child),
            ),
            child: isLoading.value
                ? Row(
                    key: const ValueKey('loading'),
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(loadingLabel),
                      SizedBox(
                        width: Sizes.p16,
                        height: Sizes.p16,
                        child: CircularProgressIndicator(
                          color: context.colorScheme.primary,
                          strokeWidth: 2,
                        ),
                      ),
                    ],
                  )
                : Text(label, key: const ValueKey('label')),
          ),
        ),
      ),
    );
  }
}
