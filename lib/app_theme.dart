import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  // --- 1. FARBPALETTE AUS DEM BILD ---
  // Das frische Smaragdgrün von den Buttons ("Get Started", "onion", etc.)
  static const Color primaryGreen = Color(0xFF0FAF6B);

  // Das warme Gold/Gelb (z.B. "Recipe of the day" Karte / Rating Sterne)
  static const Color accentGold = Color(0xFFE2B93B);

  // Der fast weiße, leicht gräulich-warme Hintergrund
  static const Color backgroundLight = Color(0xFFF9FAFB);

  // Sehr helles Grau für Buttons/Chips (z.B. "chicken", "fish", "Noodle")
  static const Color surfaceLight = Color(0xFFF3F4F6);

  // Dunkler Text
  static const Color textDark = Color(0xFF1D242B);

  // Ausgegrauter Text (z.B. Untertitel, Zeitangaben "90 min")
  static const Color textMuted = Color(0xFF8C98A4);

  // --- 2. THEME DEFINITION ---
  static ThemeData get lightTheme {
    // Basis TextTheme von Google Fonts laden (dmSans)
    final baseTextTheme = GoogleFonts.dmSansTextTheme();

    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      scaffoldBackgroundColor: backgroundLight,

      // Farb-System
      colorScheme: const ColorScheme.light(
        primary: primaryGreen,
        secondary: accentGold,
        surface: surfaceLight,
        onPrimary: Colors.white,
        onSurface: textDark,
      ),

      // --- TYPOGRAFIE (Google Fonts DM Sans) ---
      textTheme: baseTextTheme.copyWith(
        // Große Headlines (z.B. "Select the foods you don't eat")
        displayMedium: baseTextTheme.displayMedium?.copyWith(
          fontSize: 26,
          fontWeight: FontWeight.bold,
          color: textDark,
        ),
        // Titel von Karten/Rezepten (z.B. "Pumpkin ginger curry soup")
        titleMedium: baseTextTheme.titleMedium?.copyWith(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: textDark,
        ),
        // Standard-Fließtext
        bodyMedium: baseTextTheme.bodyMedium?.copyWith(
          fontSize: 14,
          color: textDark,
        ),
        // Nebentext / Grauer Text (z.B. "This will help us...")
        bodySmall: baseTextTheme.bodySmall?.copyWith(
          fontSize: 12,
          color: textMuted,
        ),
      ),

      // --- BUTTON STYLES ---
      // Stylt z.B. deinen "Get Started" Button automatisch richtig
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: primaryGreen,
          foregroundColor: Colors.white,
          elevation: 0, // Flat Design wie im Bild
          minimumSize: const Size(
            double.infinity,
            52,
          ), // Schöner breiter Button
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16), // Abgerundete Ecken
          ),
          textStyle: GoogleFonts.dmSans(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),

      // --- CHIP STYLES (für die Kategorien "chicken", "Noodle" etc.) ---
      chipTheme: ChipThemeData(
        backgroundColor: surfaceLight,
        selectedColor: primaryGreen,
        side: BorderSide.none,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        labelStyle: GoogleFonts.dmSans(color: textDark, fontSize: 14),
      ),
    );
  }
}
