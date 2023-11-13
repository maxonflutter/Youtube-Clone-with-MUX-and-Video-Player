import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  const AppTheme();

  ThemeData get themeData {
    return ThemeData(
      colorScheme: _colorScheme,
      textTheme: _textTheme,
      appBarTheme: AppBarTheme(
        color: _colorScheme.primary,
        iconTheme: IconThemeData(color: _colorScheme.onPrimary),
      ),
      inputDecorationTheme: _inputDecorationTheme,
      elevatedButtonTheme: _elevatedButtonThemeData(),
      textButtonTheme: _textButtonThemeData(),
    );
  }

  TextTheme get _textTheme {
    const textTheme = TextTheme();
    
    final bodyFont = GoogleFonts.workSansTextTheme(textTheme);
    final headingFont = GoogleFonts.merriweatherTextTheme(textTheme);

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

  ColorScheme get _colorScheme {
    const primaryColor = Color(0xFFEA3323);
    const secondaryColor = Color(0xFF0F0F0F);

    return ColorScheme(
      brightness: Brightness.light,
      primary: primaryColor,
      onPrimary: Colors.white,
      primaryContainer: primaryColor,
      onPrimaryContainer: Colors.white,
      secondary: secondaryColor,
      onSecondary: Colors.white,
      secondaryContainer: secondaryColor,
      onSecondaryContainer: Colors.white,
      error: Colors.red,
      onError: Colors.white,
      background: Colors.white,
      onBackground: Colors.black,
      surface: Colors.white,
      onSurface: Colors.black,
    );
  }

  ElevatedButtonThemeData _elevatedButtonThemeData() {
    return ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        foregroundColor: _colorScheme.onPrimary,
        backgroundColor: _colorScheme.primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
    );
  }

  TextButtonThemeData _textButtonThemeData() {
    return TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: _colorScheme.primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
    );
  }

  InputDecorationTheme get _inputDecorationTheme {
    return InputDecorationTheme(
      labelStyle: GoogleFonts.workSans(),
      floatingLabelStyle: GoogleFonts.workSans(),
      helperStyle: GoogleFonts.workSans(),
      hintStyle: GoogleFonts.workSans(),
      prefixStyle: GoogleFonts.workSans(),
      suffixStyle: GoogleFonts.workSans(),
      filled: true,
      fillColor: _colorScheme.primary.withAlpha(100),
      enabledBorder: _roundedBorder,
      focusedBorder: _roundedBorder.copyWith(
        borderSide: BorderSide(
          color: _colorScheme.secondary,
        ),
      ),
      disabledBorder: _roundedBorder,
    );
  }

  InputBorder get _roundedBorder => OutlineInputBorder(
    borderRadius: BorderRadius.circular(32.0),
    borderSide: BorderSide(
      color: Colors.transparent,
    ),
  );
}
