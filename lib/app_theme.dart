import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  // --- 1. FARBPALETTE FÜR DARK MODE ---
  // Ein etwas leuchtenderes Grün, damit es auf dunklem Grund perfekt knallt
  static const Color primaryGreen = Color(0xFF10B981);

  // Akzent-Gold für Sterne/Highlights
  static const Color accentGold = Color(0xFFF59E0B);

  // Tiefer, edler dunkler Hintergrund (nicht ganz reines Schwarz, schont die Augen)
  static const Color backgroundDark = Color(0xFF12181F);

  // Karten, Chips & Eingabefelder ("chicken", "Noodle" etc.) heben sich leicht ab
  static const Color surfaceDark = Color(0xFF1E2630);

  // Haupt-Textfarbe (Weiß mit minimaler Wärme für bessere Lesbarkeit)
  static const Color textLight = Color(0xFFF9FAFB);

  // Ausgegrauter Text für Untertitel/Zeitangaben ("90 min")
  static const Color textMuted = Color(0xFF9CA3AF);
  static const Color customGrey = Color(0xFF6B7280);
  // --- 2. DARK THEME DEFINITION ---
  static ThemeData get darkTheme {
    // Basis-TextTheme für dunkle Hintergründe laden
    final baseTextTheme = GoogleFonts.dmSansTextTheme(
      ThemeData.dark().textTheme,
    );

    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark, // Sagt Flutter: Hier gilt Darkmode!
      scaffoldBackgroundColor: backgroundDark,

      // Farb-System
      colorScheme: const ColorScheme.dark(
        primary: primaryGreen,
        secondary: accentGold,
        surface: surfaceDark,
        onPrimary: Colors.white,
        onSurface: textLight, // Textfarbe auf Oberflächen (Karten, Screens)
      ),

      // --- TYPOGRAFIE (Google Fonts DM Sans in Hell) ---
      textTheme: baseTextTheme.copyWith(
        // Große Headlines
        displayMedium: baseTextTheme.displayMedium?.copyWith(
          fontSize: 34,
          fontWeight: FontWeight.bold,
          color: textLight,
        ), // Anderes
        displaySmall: baseTextTheme.displaySmall?.copyWith(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: textLight,
        ),
        // Titel von Karten/Rezepten
        titleMedium: baseTextTheme.titleMedium?.copyWith(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: textLight,
        ),
        // Standard-Fließtext
        bodyMedium: baseTextTheme.bodyMedium?.copyWith(
          fontSize: 16,
          color: textLight,
        ),
        // Nebentext / Grauer Text
        bodySmall: baseTextTheme.bodySmall?.copyWith(
          fontSize: 14,
          color: textMuted,
        ),
      ),

      // --- BUTTON STYLES ---
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: primaryGreen,
          foregroundColor: Colors.white,
          elevation: 0,
          minimumSize: const Size(double.infinity, 52),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          textStyle: GoogleFonts.dmSans(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),

      // --- CHIP STYLES (Kategorien "chicken", "Noodle" etc.) ---
      chipTheme: ChipThemeData(
        backgroundColor: surfaceDark, // Dunkle Chip-Hintergründe
        selectedColor: primaryGreen,
        side: BorderSide.none,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        labelStyle: GoogleFonts.dmSans(
          color: textLight, // Helle Schrift auf den Chips
          fontSize: 14,
        ),
      ),
    );
  }
}
