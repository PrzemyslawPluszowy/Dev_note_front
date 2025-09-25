import 'package:flutter/material.dart';

/// Extension to get the color scheme from the context

extension ColorExt on BuildContext {
  ColorScheme get colorScheme => Theme.of(this).colorScheme;
}
