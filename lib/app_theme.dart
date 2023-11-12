import 'package:flutter/material.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  const AppTheme();

  ThemeData get themeData {
    return ThemeData(
      colorScheme: _colorScheme,
      textTheme: _textTheme(),
      appBarTheme: AppBarTheme(color: _colorScheme.primary),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: _colorScheme.primary.withAlpha(100),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50.0),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50.0),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50.0),
          borderSide: BorderSide(
            color: _colorScheme.secondary,
          ),
        ),
      ),
      elevatedButtonTheme: _elevatedButtonTheme,
      textButtonTheme: _textButtonTheme,
      filledButtonTheme: _filledButtonTheme,
    );
  }

  TextTheme _textTheme() {
    TextTheme textTheme = TextTheme();
  
    final bodyFont = GoogleFonts.workSansTextTheme(textTheme);
    final headingFont = GoogleFonts.merriweatherTextTheme(textTheme);

    return bodyFont.copyWith(
      headline1: headingFont.headline1,
      headline2: headingFont.headline2,
      bodyText1: bodyFont.bodyText1,
      bodyText2: bodyFont.bodyText2,
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

    return FlexThemeData.light(
      useMaterial3: true,
      colors: seeds,
    ).colorScheme;
  }

  ElevatedButtonThemeData get _elevatedButtonTheme {
    return ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        primary: _colorScheme.primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50.0),
        ),
        textStyle: GoogleFonts.workSans(),
      ),
    );
  }

  OutlinedButtonThemeData get _outlinedButtonTheme {
    return OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        primary: _colorScheme.secondary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50.0),
        ),
        textStyle: GoogleFonts.merriweather(),
      ),
    );
  }

  TextButtonThemeData get _textButtonTheme {
    return TextButtonThemeData(
      style: TextButton.styleFrom(
        primary: _colorScheme.primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50.0),
        ),
        textStyle: GoogleFonts.workSans(),
      ),
    );
  }

  FilledButtonThemeData get _filledButtonTheme {
    return FilledButtonThemeData(
      style: FilledButton.styleFrom(
        backgroundColor: _colorScheme.primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50.0),
        ),
        textStyle: GoogleFonts.merriweather(),
      ),
    );
  }
}
