import 'package:flutter/material.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  const AppTheme();

  ThemeData get themeData {
    return ThemeData(
      useMaterial3: true,
      colorScheme: _colorScheme,
      textTheme: _textTheme,
      appBarTheme: AppBarTheme(color: _colorScheme.primary),
      inputDecorationTheme: _inputDecorationTheme,
      elevatedButtonTheme: _elevatedButtonTheme,
      textButtonTheme: _textButtonTheme,
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
    const textTheme = TextTheme();

    final bodyFont = GoogleFonts.workSansTextTheme(textTheme);
    final headingFont = GoogleFonts.merriweatherTextTheme(textTheme);

    return bodyFont.copyWith(
      headlineLarge: headingFont.headlineLarge,
      headlineMedium: headingFont.headlineMedium,
      headlineSmall: headingFont.headlineSmall,
      bodyLarge: headingFont.bodyLarge,
      bodyMedium: bodyFont.bodyMedium,
      bodySmall: bodyFont.bodySmall,
    );
  }

  ElevatedButtonThemeData get _elevatedButtonTheme {
    return ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: _colorScheme.primary,
        foregroundColor: _colorScheme.onPrimary,
        textStyle: GoogleFonts.workSans(),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
    );
  }

  TextButtonThemeData get _textButtonTheme {
    return TextButtonThemeData(
      style: TextButton.styleFrom(
        backgroundColor: _colorScheme.primary,
        foregroundColor: _colorScheme.onSurface,
        textStyle: GoogleFonts.merriweather(),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
    );
  }

  InputDecorationTheme get _inputDecorationTheme {
    return InputDecorationTheme(
      labelStyle: GoogleFonts.workSans(),
      helperStyle: GoogleFonts.merriweather(),
      hintStyle: GoogleFonts.workSans(),
      contentPadding: const EdgeInsets.all(12.0),
      prefixStyle: GoogleFonts.workSans(),
      suffixStyle: GoogleFonts.workSans(),
      filled: true,
      fillColor: _colorScheme.primary,
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(32.0),
        borderSide: const BorderSide(color: Colors.transparent),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(32.0),
        borderSide: BorderSide(
          color: _colorScheme.secondary,
        ),
      ),
      disabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(32.0),
        borderSide: BorderSide.none,
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.0),
        borderSide: const BorderSide(color: Colors.red),
      ),
      border: InputBorder.none,
    );
  }
}
