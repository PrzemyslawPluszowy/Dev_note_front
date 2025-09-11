import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// The [AppTheme] defines light and dark themes for the app.
///
/// Theme setup for FlexColorScheme package v8.
/// Use same major flex_color_scheme package version. If you use a
/// lower minor version, some properties may not be supported.
/// In that case, remove them after copying this theme to your
/// app or upgrade the package to version 8.3.0.
///
/// Use it in a [MaterialApp] like this:
///
/// MaterialApp(
///   theme: AppTheme.light,
///   darkTheme: AppTheme.dark,
/// );
abstract final class AppTheme {
  /// The FlexColorScheme defined light mode ThemeData.
  static ThemeData light = FlexThemeData.light(
    // Using FlexColorScheme built-in FlexScheme enum based colors
    scheme: FlexScheme.ebonyClay,
    // Component theme configurations for light mode.
    subThemesData: const FlexSubThemesData(
      interactionEffects: true,
      tintedDisabledControls: true,
      useM2StyleDividerInM3: true,
      thinBorderWidth: 2,
      adaptiveSplash: FlexAdaptive.iOSAndDesktop(),
      splashType: FlexSplashType.inkSparkle,
      splashTypeAdaptive: FlexSplashType.inkSplash,
      adaptiveElevationShadowsBack: FlexAdaptive.desktop(),
      adaptiveRadius: FlexAdaptive.all(),
      defaultRadiusAdaptive: 4,
      inputDecoratorIsFilled: true,
      inputDecoratorBorderType: FlexInputBorderType.outline,
      inputDecoratorBackgroundAlpha: 200,
      inputDecoratorBorderWidth: 0.5,
      inputDecoratorFillColor: Colors.white,
      inputDecoratorIsDense: true,
      inputDecoratorSuffixIconSchemeColor: SchemeColor.primary,
      inputDecoratorPrefixIconSchemeColor: SchemeColor.primary,

      inputDecoratorRadius: 4,
      inputCursorSchemeColor: SchemeColor.primary,
      inputDecoratorBorderSchemeColor: SchemeColor.outline,
      inputDecoratorUnfocusedBorderIsColored: false,
      alignedDropdown: true,
      navigationRailUseIndicator: true,
    ),
    // Direct ThemeData properties.
    visualDensity: VisualDensity.compact,
    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
    cupertinoOverrideTheme: const CupertinoThemeData(applyThemeToAll: true),
    textTheme: AppTextTheme.textTheme,

    // form field
  );

  /// The FlexColorScheme defined dark mode ThemeData.
  static ThemeData dark = FlexThemeData.dark(
    // Using FlexColorScheme built-in FlexScheme enum based colors.
    scheme: FlexScheme.ebonyClay,
    // Component theme configurations for dark mode.
    subThemesData: const FlexSubThemesData(
      interactionEffects: true,
      tintedDisabledControls: true,
      blendOnColors: true,
      useM2StyleDividerInM3: true,
      adaptiveSplash: FlexAdaptive.iOSAndDesktop(),
      splashType: FlexSplashType.inkSparkle,
      splashTypeAdaptive: FlexSplashType.inkSplash,
      adaptiveRadius: FlexAdaptive.all(),
      defaultRadiusAdaptive: 4,
      thinBorderWidth: 2,
      inputDecoratorIsFilled: true,
      inputDecoratorBorderType: FlexInputBorderType.outline,
      inputDecoratorBackgroundAlpha: 200,
      inputDecoratorBorderWidth: 0.5,
      inputDecoratorFillColor: Colors.black,
      inputDecoratorIsDense: true,
      inputDecoratorRadius: 4,
      inputCursorSchemeColor: SchemeColor.primary,
      inputDecoratorSuffixIconSchemeColor: SchemeColor.primary,
      inputDecoratorPrefixIconSchemeColor: SchemeColor.primary,
      inputDecoratorBorderSchemeColor: SchemeColor.outline,
      inputDecoratorUnfocusedBorderIsColored: false,
      alignedDropdown: true,
      navigationRailUseIndicator: true,
    ),
    // Direct ThemeData properties.
    visualDensity: VisualDensity.compact,
    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
    cupertinoOverrideTheme: const CupertinoThemeData(applyThemeToAll: true),
    textTheme: AppTextTheme.textTheme,
  );
}

/// Tekstowy styl aplikacji

abstract final class AppTextTheme {
  // Bazowa czcionka Poppins - cienka, nowoczesna i idealna dla web
  static final TextStyle _baseFont = GoogleFonts.poppins();

  /// Wspólny tekstowy styl aplikacji
  static TextTheme get textTheme => TextTheme(
    // Display styles - największe nagłówki
    displayLarge: _baseFont.copyWith(
      fontSize: 29,
      fontWeight: FontWeight.w300,
      letterSpacing: -0.25,
      height: 1.2,
    ),
    displayMedium: _baseFont.copyWith(
      fontSize: 25,
      fontWeight: FontWeight.w300,
      letterSpacing: 0,
      height: 1.2,
    ),
    displaySmall: _baseFont.copyWith(
      fontSize: 21,
      fontWeight: FontWeight.w300,
      letterSpacing: 0,
      height: 1.3,
    ),

    // Headline styles - nagłówki sekcji
    headlineLarge: _baseFont.copyWith(
      fontSize: 19,
      fontWeight: FontWeight.w400,
      letterSpacing: 0,
      height: 1.3,
    ),
    headlineMedium: _baseFont.copyWith(
      fontSize: 17,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.15,
      height: 1.3,
    ),
    headlineSmall: _baseFont.copyWith(
      fontSize: 15,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.15,
      height: 1.3,
    ),

    // Title styles - tytuły komponentów
    titleLarge: _baseFont.copyWith(
      fontSize: 13,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.15,
      height: 1.4,
    ),
    titleMedium: _baseFont.copyWith(
      fontSize: 11,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.1,
      height: 1.4,
    ),
    titleSmall: _baseFont.copyWith(
      fontSize: 10,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.1,
      height: 1.4,
    ),

    // Body styles - główny tekst
    bodyLarge: _baseFont.copyWith(
      fontSize: 13,
      fontWeight: FontWeight.w300,
      letterSpacing: 0.5,
      height: 1.5,
    ),
    bodyMedium: _baseFont.copyWith(
      fontSize: 11,
      fontWeight: FontWeight.w300,
      letterSpacing: 0.25,
      height: 1.5,
    ),
    bodySmall: _baseFont.copyWith(
      fontSize: 9,
      fontWeight: FontWeight.w300,
      letterSpacing: 0.4,
      height: 1.4,
    ),

    // Label styles - etykiety i małe teksty
    labelLarge: _baseFont.copyWith(
      fontSize: 11,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.1,
      height: 1.4,
    ),
    labelMedium: _baseFont.copyWith(
      fontSize: 9,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.5,
      height: 1.3,
    ),
    labelSmall: _baseFont.copyWith(
      fontSize: 8,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.5,
      height: 1.3,
    ),
  );
}
