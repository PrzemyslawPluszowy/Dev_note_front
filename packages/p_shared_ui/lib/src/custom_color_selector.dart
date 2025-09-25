import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:p_models/models.dart';

/// Widżet pozwalający użytkownikowi wybrać kolor z predefiniowanych schematów.
///
/// Wyświetla siatkę okrągłych przycisków odpowiadających wartościom enum
/// `ApiColorScheme`. Po stuknięciu w przycisk aktualizowany jest wewnętrzny
/// stan (podświetlenie) oraz wywoływany jest przekazany callback
/// [onColorSelected] z wybranym schematem kolorów.
///
/// Parametry konstruktora:
/// - [onColorSelected] (wymagane): callback wywoływany po wyborze koloru.
/// - [crossAxisCount]: liczba kolumn w siatce (domyślnie 11).
/// - [crossAxisSpacing]: odstęp pomiędzy kolumnami (domyślnie 4).
/// - [mainAxisSpacing]: odstęp pomiędzy wierszami (domyślnie 4).
class CustomColorSelector extends HookWidget {
  /// Tworzy instancję [CustomColorSelector].
  const CustomColorSelector({
    required this.onColorSelected,
    super.key,
    this.crossAxisCount = 11,
    this.crossAxisSpacing = 4,
    this.mainAxisSpacing = 4,
  });

  /// Odstęp poziomy między elementami siatki.
  final double? crossAxisSpacing;

  /// Odstęp pionowy między elementami siatki.
  final double? mainAxisSpacing;

  /// Liczba kolumn w siatce.
  final int? crossAxisCount;

  /// Callback wywoływany po wyborze koloru. Otrzymuje wybrany [ApiColorScheme].
  final void Function(ApiColorScheme) onColorSelected;

  @override
  Widget build(BuildContext context) {
    final selectedColor = useState<ApiColorScheme?>(null);
    return GridView.builder(
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount!,
        crossAxisSpacing: crossAxisSpacing!,
        mainAxisSpacing: mainAxisSpacing!,
      ),
      itemCount: ApiColorScheme.values.length,
      itemBuilder: (context, index) {
        final color = ApiColorScheme.values[index];
        return GestureDetector(
          onTap: () {
            // Zaktualizuj lokalny stan i powiadom parenta o wybranym kolorze.
            selectedColor.value = color;
            onColorSelected(color);
          },
          child: Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: color.toFlutterColor(),
              border: Border.all(color: Colors.black12),
            ),
            child: AnimatedScale(
              duration: const Duration(milliseconds: 200),
              scale: selectedColor.value == color ? 1.0 : 0.0,
              curve: Curves.easeInOut,
              child: selectedColor.value == color
                  ? Icon(
                      Icons.check,
                      color: selectedColor.value == ApiColorScheme.white
                          ? Colors.black
                          : Colors.white,
                    )
                  : null,
            ),
          ),
        );
      },
    );
  }
}
