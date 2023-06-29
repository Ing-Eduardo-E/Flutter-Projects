import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// Definición del esquema de colores
final ColorScheme colorScheme = ColorScheme.fromSeed(
  seedColor: const Color.fromARGB(255, 215, 200, 236),
  brightness: Brightness.light,
  primary: const Color.fromARGB(255, 184, 9, 131),
  secondary: const Color(0xFF03DAC6),
  surface: const Color(0xFFE5E5E5),
  background: const Color.fromARGB(255, 123, 66, 204),
  onBackground: const Color(0xFFFFFFFF),
);

// Definición del tema
final ThemeData theme = ThemeData(
  useMaterial3: true,
  scaffoldBackgroundColor: colorScheme.background,
  colorScheme: colorScheme,
  textTheme: getUbuntuCondensedTextTheme(),
  inputDecorationTheme: getInputDecorationTheme(colorScheme),
);

//definir metodo para un tema de textfields
InputDecorationTheme getInputDecorationTheme(ColorScheme colorScheme) {
  return InputDecorationTheme(
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(
        color: colorScheme.primary,
        width: 2,
      ),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(
        color: colorScheme.primary,
        width: 2,
      ),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(
        color: colorScheme.primary,
        width: 2,
      ),
    ),
  );
}

// Definición del tema de texto
TextTheme getUbuntuCondensedTextTheme() {
  final TextTheme base = GoogleFonts.ubuntuCondensedTextTheme();
  return base.copyWith(
    titleSmall: GoogleFonts.ubuntuCondensed(
      fontWeight: FontWeight.bold,
    ),
    titleMedium: GoogleFonts.ubuntuCondensed(
      fontWeight: FontWeight.bold,
    ),
    titleLarge: GoogleFonts.ubuntuCondensed(
      fontWeight: FontWeight.bold,
    ),
  );
}
