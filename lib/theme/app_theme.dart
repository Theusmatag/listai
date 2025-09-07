import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      primaryColorLight: Color(0xff4169E1),
      iconTheme: const IconThemeData(
        color: Color(0xff4169E1), // Cor roxa
      ),
      useMaterial3: true,
      brightness: Brightness.light,
      primaryColor: Colors.white,
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          foregroundColor: Color(0xff4169E1),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(foregroundColor: Colors.white),
      ),
      hintColor: const Color.fromARGB(255, 214, 214, 214),
      cardTheme: CardThemeData(
        color: Colors.white,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        elevation: 7,
      ),
      textTheme: GoogleFonts.outfitTextTheme(Typography.whiteCupertino),
      scaffoldBackgroundColor: Colors.white,
      dialogTheme: DialogThemeData(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: const Color.fromARGB(
          246,
          255,
          255,
          255,
        ), // ou use sua cor roxa customizada
        elevation: 7,
        surfaceTintColor: Color(0xff4169E1), // evitar interferência
        foregroundColor: Color(0xff4169E1),
      ),
      scrollbarTheme: ScrollbarThemeData(
        thumbColor: WidgetStateProperty.all(Colors.black),
        trackVisibility: WidgetStateProperty.all(true),
        thickness: WidgetStateProperty.all(8.0),
        radius: const Radius.circular(10),
      ),
      listTileTheme: ListTileThemeData(
        textColor: Color(0xff4169E1),
        iconColor: Color(0xff4169E1),
        tileColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),

      // Define other dark theme properties
    );
  }

  static ThemeData get darkTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      primaryColor: Color(0xff0047AB),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          foregroundColor: Color(0xff0047AB),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(foregroundColor: Colors.white),
      ),
      hintColor: const Color.fromARGB(255, 214, 214, 214),
      cardTheme: CardThemeData(
        color: Color.fromARGB(246, 93, 23, 223),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        elevation: 7,
      ),
      textTheme: GoogleFonts.outfitTextTheme(Typography.whiteCupertino),
      scaffoldBackgroundColor: Color(0xff0047AB),
      listTileTheme: ListTileThemeData(
        textColor: Colors.white,
        iconColor: Colors.white,
        tileColor: Color(0xff0047AB).withOpacity(0.9),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
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
