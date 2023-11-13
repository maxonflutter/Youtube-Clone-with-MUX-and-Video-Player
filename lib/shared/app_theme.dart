import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';

class AppTheme {
  const AppTheme();

  ThemeData get themeData {
    return ThemeData(
      colorScheme: _colorScheme,
      textTheme: _textTheme,
      appBarTheme: _appBarTheme, // Assuming _appBarTheme exists elsewhere in the code
      inputDecorationTheme: _inputDecorationTheme,
      elevatedButtonTheme: _elevatedButtonTheme,
      textButtonTheme: _textButtonTheme,
      filledButtonTheme: _filledButtonTheme, // Assuming _filledButtonTheme exists elsewhere in the code
    );
  }

  ColorScheme get _colorScheme {
    const primaryColor = Color(0xFFEA3323);
    const secondaryColor = Color(0xFF0F0F0F);

    final seeds = FlexSchemeColor.from(
      primary: primaryColor,
      secondary: secondaryColor,
      brightness: Brightness.light,
    );

    final colors = FlexThemeData.light(
      useMaterial3: true,
      colors: seeds,
    ).colorScheme;

    return ColorScheme(
      brightness: colors.brightness,
      primary: colors.primary,
      onPrimary: colors.onPrimary,
      primaryContainer: colors.primaryContainer,
      onPrimaryContainer: colors.onPrimaryContainer,
      secondary: colors.secondary,
      onSecondary: colors.onSecondary,
      secondaryContainer: colors.secondaryContainer,
      onSecondaryContainer: colors.onSecondaryContainer,
      error: colors.error,
      onError: colors.onError,
      background: colors.background,
      onBackground: colors.onBackground,
      surface: colors.surface,
      onSurface: colors.onSurface,
    );
  }

  TextTheme get _textTheme {
    const baseTextTheme = TextTheme();

    final bodyFont = GoogleFonts.workSansTextTheme(baseTextTheme);
    final headingFont = GoogleFonts.merriweatherTextTheme(baseTextTheme);

    return TextTheme(
      displayLarge: headingFont.displayLarge,
      displayMedium: headingFont.displayMedium,
      displaySmall: headingFont.displaySmall,
      headlineLarge: headingFont.headlineLarge,
      headlineMedium: headingFont.headlineMedium,
      headlineSmall: headingFont.headlineSmall,
      titleLarge: bodyFont.titleLarge,
      titleMedium: bodyFont.titleMedium,
      titleSmall: bodyFont.titleSmall,
      bodyLarge: bodyFont.bodyLarge,
      bodyMedium: bodyFont.bodyMedium,
      bodySmall: bodyFont.bodySmall,
    );
  }

  InputDecorationTheme get _inputDecorationTheme {
    return InputDecorationTheme(
      filled: true,
      fillColor: Colors.white,
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(32.0),
        borderSide: BorderSide.none,
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(32.0),
        borderSide: BorderSide(color: _colorScheme.primary),
      ),
      disabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(32.0),
        borderSide: BorderSide.none,
      ),
    );
  }

  ElevatedButtonThemeData get _elevatedButtonTheme {
    return ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        foregroundColor: _colorScheme.onPrimary,
        backgroundColor: _colorScheme.primary,
        disabledForegroundColor: _colorScheme.onPrimary.withOpacity(0.38),
        disabledBackgroundColor: _colorScheme.primary.withOpacity(0.38),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
    );
  }

  TextButtonThemeData get _textButtonTheme {
    return TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: _colorScheme.primary,
        disabledForegroundColor: _colorScheme.primary.withOpacity(0.38),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
    );
  }

  // Assuming _appBarTheme exists elsewhere in the code
  // Assuming _filledButtonTheme exists elsewhere in the code
}
