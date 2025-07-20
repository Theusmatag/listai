import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      primaryColor: const Color.fromARGB(255, 81, 218, 85),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: Color.fromARGB(255, 81, 218, 85),
          foregroundColor: Colors.white,
        ),
      ),

      hintColor: const Color.fromARGB(255, 19, 19, 19),
      textTheme: GoogleFonts.outfitTextTheme(Typography.whiteCupertino),
      scaffoldBackgroundColor: Colors.transparent,
      // Define other light theme properties
    );
  }

  static ThemeData get darkTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      primaryColor: const Color.fromARGB(246, 93, 23, 223),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          foregroundColor: const Color.fromARGB(246, 93, 23, 223),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(foregroundColor: Colors.white),
      ),
      hintColor: const Color.fromARGB(255, 214, 214, 214),
      textTheme: GoogleFonts.outfitTextTheme(Typography.whiteCupertino),
      scaffoldBackgroundColor: const Color.fromARGB(246, 93, 23, 223),
      // Define other dark theme properties
    );
  }

  static BoxDecoration get lightGradientBackground {
    return const BoxDecoration(
      gradient: RadialGradient(
        radius: 0.9,
        center: Alignment(-0.4, -1.2),
        colors: [
          Color(0xFF00CB00), // Verde vibrante
          Color(
            0xFF66E066,
          ), // Verde claro intermediário (opcional, ajuda na transição)
          Color.fromARGB(255, 243, 240, 240), // Branco
        ],
        stops: [0.1, 0.6, 1.0],
      ),
    );
  }

  static BoxDecoration get darkGradientBackground {
    return const BoxDecoration(
      gradient: RadialGradient(
        radius: 0.9,
        center: Alignment(-0.4, -1.1),
        colors: [
          Color(0xFF0C653B), // verde escuro
          Color.fromARGB(255, 13, 30, 46), // azul escuro
          Color.fromARGB(255, 13, 30, 46),
          // Color(0xFF0B0F20), // preto azulado
        ],
        stops: [0.0, 0.8, 1.5],
      ),
    );
  }

  // static BoxDecoration get darkGradientBackground {
  //   return const BoxDecoration(
  //     gradient: RadialGradient(
  //       radius: 0.9,
  //       center: Alignment(-0.4, -1.2),
  //       colors: [
  //         Color.fromARGB(255, 47, 78, 71),
  //         Color.fromARGB(255, 19, 32, 29),
  //         Color(0xff070b0e),
  //       ],
  //       stops: [0.1, 0.6, 1.0],
  //     ),
  //   );
  // }
}
