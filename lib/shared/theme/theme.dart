import "package:flutter/material.dart";

class MaterialTheme {
  final TextTheme textTheme;

  const MaterialTheme(this.textTheme);

  static ColorScheme lightScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff296a47),
      surfaceTint: Color(0xff296a47),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xffaef2c5),
      onPrimaryContainer: Color(0xff095131),
      secondary: Color(0xff006874),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xff9eeffd),
      onSecondaryContainer: Color(0xff004f58),
      tertiary: Color(0xff166684),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xffc0e8ff),
      onTertiaryContainer: Color(0xff004d66),
      error: Color(0xffba1a1a),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffffdad6),
      onErrorContainer: Color(0xff93000a),
      surface: Color(0xfff6fbf4),
      onSurface: Color(0xff171d19),
      onSurfaceVariant: Color(0xff514347),
      outline: Color(0xff837377),
      outlineVariant: Color(0xffd5c2c6),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff2c322d),
      inversePrimary: Color(0xff93d5aa),
      primaryFixed: Color(0xffaef2c5),
      onPrimaryFixed: Color(0xff002110),
      primaryFixedDim: Color(0xff93d5aa),
      onPrimaryFixedVariant: Color(0xff095131),
      secondaryFixed: Color(0xff9eeffd),
      onSecondaryFixed: Color(0xff001f24),
      secondaryFixedDim: Color(0xff82d3e0),
      onSecondaryFixedVariant: Color(0xff004f58),
      tertiaryFixed: Color(0xffc0e8ff),
      onTertiaryFixed: Color(0xff001e2b),
      tertiaryFixedDim: Color(0xff8dcff1),
      onTertiaryFixedVariant: Color(0xff004d66),
      surfaceDim: Color(0xffd6dbd5),
      surfaceBright: Color(0xfff6fbf4),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfff0f5ee),
      surfaceContainer: Color(0xffeaefe8),
      surfaceContainerHigh: Color(0xffe4eae3),
      surfaceContainerHighest: Color(0xffdfe4dd),
    );
  }

  ThemeData light() {
    return theme(lightScheme());
  }

  static ColorScheme lightMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff003f24),
      surfaceTint: Color(0xff296a47),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff397955),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xff003c44),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xff187884),
      onSecondaryContainer: Color(0xffffffff),
      tertiary: Color(0xff003b4f),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff2c7593),
      onTertiaryContainer: Color(0xffffffff),
      error: Color(0xff740006),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffcf2c27),
      onErrorContainer: Color(0xffffffff),
      surface: Color(0xfff6fbf4),
      onSurface: Color(0xff0d120f),
      onSurfaceVariant: Color(0xff403336),
      outline: Color(0xff5d4f52),
      outlineVariant: Color(0xff79696d),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff2c322d),
      inversePrimary: Color(0xff93d5aa),
      primaryFixed: Color(0xff397955),
      onPrimaryFixed: Color(0xffffffff),
      primaryFixedDim: Color(0xff1e603e),
      onPrimaryFixedVariant: Color(0xffffffff),
      secondaryFixed: Color(0xff187884),
      onSecondaryFixed: Color(0xffffffff),
      secondaryFixedDim: Color(0xff005e68),
      onSecondaryFixedVariant: Color(0xffffffff),
      tertiaryFixed: Color(0xff2c7593),
      onTertiaryFixed: Color(0xffffffff),
      tertiaryFixedDim: Color(0xff005c79),
      onTertiaryFixedVariant: Color(0xffffffff),
      surfaceDim: Color(0xffc3c8c1),
      surfaceBright: Color(0xfff6fbf4),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfff0f5ee),
      surfaceContainer: Color(0xffe4eae3),
      surfaceContainerHigh: Color(0xffd9ded7),
      surfaceContainerHighest: Color(0xffced3cc),
    );
  }

  ThemeData lightMediumContrast() {
    return theme(lightMediumContrastScheme());
  }

  static ColorScheme lightHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff00341d),
      surfaceTint: Color(0xff296a47),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff0d5433),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xff003238),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xff00515a),
      onSecondaryContainer: Color(0xffffffff),
      tertiary: Color(0xff003042),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff004f69),
      onTertiaryContainer: Color(0xffffffff),
      error: Color(0xff600004),
      onError: Color(0xffffffff),
      errorContainer: Color(0xff98000a),
      onErrorContainer: Color(0xffffffff),
      surface: Color(0xfff6fbf4),
      onSurface: Color(0xff000000),
      onSurfaceVariant: Color(0xff000000),
      outline: Color(0xff35292c),
      outlineVariant: Color(0xff544649),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff2c322d),
      inversePrimary: Color(0xff93d5aa),
      primaryFixed: Color(0xff0d5433),
      onPrimaryFixed: Color(0xffffffff),
      primaryFixedDim: Color(0xff003b21),
      onPrimaryFixedVariant: Color(0xffffffff),
      secondaryFixed: Color(0xff00515a),
      onSecondaryFixed: Color(0xffffffff),
      secondaryFixedDim: Color(0xff00393f),
      onSecondaryFixedVariant: Color(0xffffffff),
      tertiaryFixed: Color(0xff004f69),
      onTertiaryFixed: Color(0xffffffff),
      tertiaryFixedDim: Color(0xff00374a),
      onTertiaryFixedVariant: Color(0xffffffff),
      surfaceDim: Color(0xffb5bab4),
      surfaceBright: Color(0xfff6fbf4),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xffedf2eb),
      surfaceContainer: Color(0xffdfe4dd),
      surfaceContainerHigh: Color(0xffd1d6cf),
      surfaceContainerHighest: Color(0xffc3c8c1),
    );
  }

  ThemeData lightHighContrast() {
    return theme(lightHighContrastScheme());
  }

  static ColorScheme darkScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xff93d5aa),
      surfaceTint: Color(0xff93d5aa),
      onPrimary: Color(0xff003920),
      primaryContainer: Color(0xff095131),
      onPrimaryContainer: Color(0xffaef2c5),
      secondary: Color(0xff82d3e0),
      onSecondary: Color(0xff00363d),
      secondaryContainer: Color(0xff004f58),
      onSecondaryContainer: Color(0xff9eeffd),
      tertiary: Color(0xff8dcff1),
      onTertiary: Color(0xff003547),
      tertiaryContainer: Color(0xff004d66),
      onTertiaryContainer: Color(0xffc0e8ff),
      error: Color(0xffffb4ab),
      onError: Color(0xff690005),
      errorContainer: Color(0xff93000a),
      onErrorContainer: Color(0xffffdad6),
      surface: Color(0xff0f1511),
      onSurface: Color(0xffdfe4dd),
      onSurfaceVariant: Color(0xffd5c2c6),
      outline: Color(0xff9e8c90),
      outlineVariant: Color(0xff514347),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffdfe4dd),
      inversePrimary: Color(0xff296a47),
      primaryFixed: Color(0xffaef2c5),
      onPrimaryFixed: Color(0xff002110),
      primaryFixedDim: Color(0xff93d5aa),
      onPrimaryFixedVariant: Color(0xff095131),
      secondaryFixed: Color(0xff9eeffd),
      onSecondaryFixed: Color(0xff001f24),
      secondaryFixedDim: Color(0xff82d3e0),
      onSecondaryFixedVariant: Color(0xff004f58),
      tertiaryFixed: Color(0xffc0e8ff),
      onTertiaryFixed: Color(0xff001e2b),
      tertiaryFixedDim: Color(0xff8dcff1),
      onTertiaryFixedVariant: Color(0xff004d66),
      surfaceDim: Color(0xff0f1511),
      surfaceBright: Color(0xff353b36),
      surfaceContainerLowest: Color(0xff0a0f0c),
      surfaceContainerLow: Color(0xff171d19),
      surfaceContainer: Color(0xff1b211d),
      surfaceContainerHigh: Color(0xff262b27),
      surfaceContainerHighest: Color(0xff313632),
    );
  }

  ThemeData dark() {
    return theme(darkScheme());
  }

  static ColorScheme darkMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xffa8ebbf),
      surfaceTint: Color(0xff93d5aa),
      onPrimary: Color(0xff002c18),
      primaryContainer: Color(0xff5e9e77),
      onPrimaryContainer: Color(0xff000000),
      secondary: Color(0xff98e9f7),
      onSecondary: Color(0xff002a30),
      secondaryContainer: Color(0xff499ca9),
      onSecondaryContainer: Color(0xff000000),
      tertiary: Color(0xffb1e3ff),
      onTertiary: Color(0xff002939),
      tertiaryContainer: Color(0xff5599b9),
      onTertiaryContainer: Color(0xff000000),
      error: Color(0xffffd2cc),
      onError: Color(0xff540003),
      errorContainer: Color(0xffff5449),
      onErrorContainer: Color(0xff000000),
      surface: Color(0xff0f1511),
      onSurface: Color(0xffffffff),
      onSurfaceVariant: Color(0xffecd7db),
      outline: Color(0xffc0adb1),
      outlineVariant: Color(0xff9d8c90),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffdfe4dd),
      inversePrimary: Color(0xff0b5332),
      primaryFixed: Color(0xffaef2c5),
      onPrimaryFixed: Color(0xff001509),
      primaryFixedDim: Color(0xff93d5aa),
      onPrimaryFixedVariant: Color(0xff003f24),
      secondaryFixed: Color(0xff9eeffd),
      onSecondaryFixed: Color(0xff001417),
      secondaryFixedDim: Color(0xff82d3e0),
      onSecondaryFixedVariant: Color(0xff003c44),
      tertiaryFixed: Color(0xffc0e8ff),
      onTertiaryFixed: Color(0xff00131d),
      tertiaryFixedDim: Color(0xff8dcff1),
      onTertiaryFixedVariant: Color(0xff003b4f),
      surfaceDim: Color(0xff0f1511),
      surfaceBright: Color(0xff404641),
      surfaceContainerLowest: Color(0xff040806),
      surfaceContainerLow: Color(0xff191f1b),
      surfaceContainer: Color(0xff242925),
      surfaceContainerHigh: Color(0xff2e342f),
      surfaceContainerHighest: Color(0xff393f3a),
    );
  }

  ThemeData darkMediumContrast() {
    return theme(darkMediumContrastScheme());
  }

  static ColorScheme darkHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xffbdffd3),
      surfaceTint: Color(0xff93d5aa),
      onPrimary: Color(0xff000000),
      primaryContainer: Color(0xff8fd1a7),
      onPrimaryContainer: Color(0xff000f05),
      secondary: Color(0xffcdf7ff),
      onSecondary: Color(0xff000000),
      secondaryContainer: Color(0xff7ecfdc),
      onSecondaryContainer: Color(0xff000e10),
      tertiary: Color(0xffe0f3ff),
      onTertiary: Color(0xff000000),
      tertiaryContainer: Color(0xff89cbed),
      onTertiaryContainer: Color(0xff000d14),
      error: Color(0xffffece9),
      onError: Color(0xff000000),
      errorContainer: Color(0xffffaea4),
      onErrorContainer: Color(0xff220001),
      surface: Color(0xff0f1511),
      onSurface: Color(0xffffffff),
      onSurfaceVariant: Color(0xffffffff),
      outline: Color(0xffffebef),
      outlineVariant: Color(0xffd1bec2),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffdfe4dd),
      inversePrimary: Color(0xff0b5332),
      primaryFixed: Color(0xffaef2c5),
      onPrimaryFixed: Color(0xff000000),
      primaryFixedDim: Color(0xff93d5aa),
      onPrimaryFixedVariant: Color(0xff001509),
      secondaryFixed: Color(0xff9eeffd),
      onSecondaryFixed: Color(0xff000000),
      secondaryFixedDim: Color(0xff82d3e0),
      onSecondaryFixedVariant: Color(0xff001417),
      tertiaryFixed: Color(0xffc0e8ff),
      onTertiaryFixed: Color(0xff000000),
      tertiaryFixedDim: Color(0xff8dcff1),
      onTertiaryFixedVariant: Color(0xff00131d),
      surfaceDim: Color(0xff0f1511),
      surfaceBright: Color(0xff4c514c),
      surfaceContainerLowest: Color(0xff000000),
      surfaceContainerLow: Color(0xff1b211d),
      surfaceContainer: Color(0xff2c322d),
      surfaceContainerHigh: Color(0xff373d38),
      surfaceContainerHighest: Color(0xff434843),
    );
  }

  ThemeData darkHighContrast() {
    return theme(darkHighContrastScheme());
  }


  ThemeData theme(ColorScheme colorScheme) => ThemeData(
     useMaterial3: true,
     brightness: colorScheme.brightness,
     colorScheme: colorScheme,
     textTheme: textTheme.apply(
       bodyColor: colorScheme.onSurface,
       displayColor: colorScheme.onSurface,
     ),
     scaffoldBackgroundColor: colorScheme.background,
     canvasColor: colorScheme.surface,
  );


  List<ExtendedColor> get extendedColors => [
  ];
}

class ExtendedColor {
  final Color seed, value;
  final ColorFamily light;
  final ColorFamily lightHighContrast;
  final ColorFamily lightMediumContrast;
  final ColorFamily dark;
  final ColorFamily darkHighContrast;
  final ColorFamily darkMediumContrast;

  const ExtendedColor({
    required this.seed,
    required this.value,
    required this.light,
    required this.lightHighContrast,
    required this.lightMediumContrast,
    required this.dark,
    required this.darkHighContrast,
    required this.darkMediumContrast,
  });
}

class ColorFamily {
  const ColorFamily({
    required this.color,
    required this.onColor,
    required this.colorContainer,
    required this.onColorContainer,
  });

  final Color color;
  final Color onColor;
  final Color colorContainer;
  final Color onColorContainer;
}
