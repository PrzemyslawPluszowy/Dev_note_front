import 'package:flutter/material.dart';

/// Extension to get the text theme from the context
extension TextThemeExt on BuildContext {
  TextTheme get textTheme => Theme.of(this).textTheme;
}
