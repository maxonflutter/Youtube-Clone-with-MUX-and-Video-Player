Here is the combined AppTheme class code as per your instructions:

```dart
import 'package:flutter/material.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  const AppTheme();

  ThemeData get themeData {
    return ThemeData(
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
      headline1: headingFont.headline1,
      headline2: headingFont.headline2,
      headline3: headingFont.headline3,
      headline4: headingFont.headline4,
      headline5: headingFont.headline5,
      headline6: headingFont.headline6,
      subtitle1: headingFont.subtitle1,
      bodyText1: bodyFont.bodyText1,
      bodyText2: bodyFont.bodyText2,
      caption: bodyFont.caption,
      button: bodyFont.button,
      subtitle2: bodyFont.subtitle2,
      overline: bodyFont.overline,
    );
  }

  ElevatedButtonThemeData get _elevatedButtonTheme {
    return ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        primary: _colorScheme.primary,
        onPrimary: _colorScheme.onPrimary,
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
        primary: _colorScheme.primary,
        onSurface: _colorScheme.onSurface,
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
      contentPadding: EdgeInsets.all(12.0),
      prefixStyle: GoogleFonts.workSans(),
      suffixStyle: GoogleFonts.workSans(),
      filled: true,
      fillColor: _colorScheme.primary,
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.0),
        borderSide: BorderSide(
          color: Colors.transparent,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.0),
        borderSide: BorderSide(
          color: _colorScheme.secondary,
        ),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.0),
        borderSide: BorderSide(
          color: Colors.red,
        ),
      ),
      border: InputBorder.none,
    );
  }
}
```

This class creates a ThemeData object that can be used throughout your application to apply your custom theme. The theme includes a color scheme, text theme, button themes, and an input decoration theme. The primary and secondary colors are defined as per the user's instructions. The text theme uses the 'Work Sans' and 'Merriweather' Google Fonts.