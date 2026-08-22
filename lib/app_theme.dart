import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// SCHRITT 2 — Theme-Werte in einer beliebigen anderen Datei/Widget NUTZEN:
//
//   Man holt sich das aktuell aktive Theme über den `context`, den jedes
//   Widget im `build()` sowieso schon hat:
//
//   @override
//   Widget build(BuildContext context) {
//     final theme = Theme.of(context); // <-- holt das AppTheme.darkTheme
//
//     return Container(
//       color: theme.colorScheme.surface,       // Kartenfarbe
//       child: Text(
//         "Hallo",
//         style: theme.textTheme.titleMedium,    // vordefinierte Schrift
//       ),
//     );
//   }
//
// WICHTIG: `Theme.of(context)` funktioniert nur INNERHALB von build(),
// weil es den `context` braucht, um im Widget-Baum nach oben zur
// MaterialApp zu schauen, wo das Theme hinterlegt ist. Außerhalb von
// build() (z.B. in initState() ganz am Anfang) ist das Theme evtl.
// noch nicht sauber verfügbar.
//
// SCHRITT 3 — Direkter Zugriff auf einzelne Farben (falls kein Theme-Wert passt):
//
//   Für Sonderfälle, die nicht im ColorScheme abgebildet sind (z.B. eine
//   der Akzentfarben aus den Kategorie-Kacheln), kannst du auch direkt
//   auf die statischen Farb-Konstanten dieser Klasse zugreifen, OHNE
//   Theme.of(context):
//
//   Container(color: AppTheme.accentBlue)
//
// Buttons (ElevatedButton), Chips (Chip/FilterChip) und Texte holen sich
// ihre Werte automatisch aus dem Theme, sobald AppTheme.darkTheme in der
// MaterialApp gesetzt ist — dafür musst du in JEDEM einzelnen Button
// nichts mehr manuell einstellen.
// ═══════════════════════════════════════════════════════════════════════

class AppTheme {
  // ─────────────────────────────────────────────────────────────────
  // 1. FARBPALETTE — inspiriert vom Screenshot (Finance-App)
  // ─────────────────────────────────────────────────────────────────

  // Hauptakzent: kräftiges Blau (Graph-Karte, primäre Buttons)
  static const Color primaryBlue = Color(0xFF4361EE);

  // Zweitakzent: Violett (z.B. "Grocerie"-Kachel im Screenshot)
  static const Color accentViolet = Color(0xFF7B2FF7);

  // Dritter Akzent: Pink/Magenta (z.B. "Taxi"-Kachel)
  static const Color accentPink = Color(0xFFEC4899);

  // Vierter Akzent: Grün, für positive Werte / Einnahmen / Erfolg
  static const Color accentGreen = Color(0xFF10B981);

  // Fast schwarzer Hintergrund, wie im Screenshot (kein reines #000000,
  // damit es nicht so hart wirkt)
  static const Color backgroundDark = Color(0xFF0B0E14);

  // Karten, Chips & Eingabefelder heben sich leicht vom Hintergrund ab
  static const Color surfaceDark = Color(0xFF161B24);

  // Noch einen Ton heller — für Elemente, die auf einer Karte
  // nochmal eine eigene Ebene brauchen (z.B. Icon-Kreis in einer Zeile)
  static const Color surfaceDarkElevated = Color(0xFF1F2733);

  // Haupt-Textfarbe (kein reines Weiß, etwas softer)
  static const Color textLight = Color(0xFFF3F4F6);

  // Ausgegrauter Text für Untertitel/Datum/Zeitangaben
  static const Color textMuted = Color(0xFF8B93A1);

  static const Color customGrey = Color(0xFF6B7280);

  // Für negative Werte (Ausgaben, "- $49")
  static const Color negativeRed = Color(0xFFEF4444);

  // ─────────────────────────────────────────────────────────────────
  // 2. DARK THEME DEFINITION
  // ─────────────────────────────────────────────────────────────────
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
        primary: primaryBlue,
        secondary: accentViolet,
        tertiary: accentPink,
        surface: surfaceDark,
        error: negativeRed,
        onPrimary: Colors.white,
        onSecondary: Colors.white,
        onSurface: textLight, // Textfarbe auf Oberflächen (Karten, Screens)
        onError: Colors.white,
      ),

      // --- TYPOGRAFIE (Google Fonts DM Sans, hell auf dunkel) ---
      textTheme: baseTextTheme.copyWith(
        // Große Headlines, z.B. "$1,673.80"
        displayMedium: baseTextTheme.displayMedium?.copyWith(
          fontSize: 34,
          fontWeight: FontWeight.bold,
          color: textLight,
        ),
        displaySmall: baseTextTheme.displaySmall?.copyWith(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: textLight,
        ),
        // Titel von Karten/Sections, z.B. "Transactions"
        titleMedium: baseTextTheme.titleMedium?.copyWith(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: textLight,
        ),
        // Standard-Fließtext, z.B. Transaktionsname "Subscription"
        bodyMedium: baseTextTheme.bodyMedium?.copyWith(
          fontSize: 16,
          color: textLight,
        ),
        // Nebentext / Grauer Text, z.B. "Today, Sep 16"
        bodySmall: baseTextTheme.bodySmall?.copyWith(
          fontSize: 14,
          color: textMuted,
        ),
      ),

      // --- BUTTON STYLES ---
      // Gilt automatisch für JEDEN ElevatedButton in der App, ohne dass
      // du in der jeweiligen Datei irgendwas extra einstellen musst:
      //   ElevatedButton(onPressed: () {}, child: Text("Speichern"))
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: primaryBlue,
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

      // --- CHIP STYLES (z.B. Kategorie-Filter "Spendings" / "Incomes") ---
      chipTheme: ChipThemeData(
        backgroundColor: surfaceDark,
        selectedColor: primaryBlue,
        side: BorderSide.none,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        labelStyle: GoogleFonts.dmSans(color: textLight, fontSize: 14),
      ),

      // --- CARD STYLE (z.B. für Transaktions-Zeilen, Statistik-Karten) ---
      // Gilt automatisch für jedes Card()-Widget:
      //   Card(child: ListTile(title: Text("Food Garage")))
      cardTheme: CardThemeData(
        color: surfaceDark,
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        margin: EdgeInsets.zero,
      ),

      // --- INPUT FIELD STYLE (z.B. Suchfeld, Formulare) ---
      // Gilt automatisch für jedes TextField()/TextFormField():
      //   TextField(decoration: InputDecoration(hintText: "Suchen..."))
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: surfaceDark,
        hintStyle: GoogleFonts.dmSans(color: textMuted, fontSize: 14),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide.none,
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 14,
        ),
      ),

      // --- ICON THEME (Standardfarbe für Icons, z.B. Icon(Icons.search)) ---
      iconTheme: const IconThemeData(color: textLight),
    );
  }

  // ─────────────────────────────────────────────────────────────────
  // 3. HELFER: Liste der Akzentfarben für z.B. Kategorie-Kacheln
  // ─────────────────────────────────────────────────────────────────
  //
  // NUTZUNG-BEISPIEL (wie im Screenshot: jede Kategorie-Kachel bekommt
  // eine andere Farbe aus dieser Liste, z.B. per Index):
  //
  //   final farbe = AppTheme.categoryAccents[index % AppTheme.categoryAccents.length];
  //   Container(color: farbe, child: Text("Fast Food"))
  //
  static const List<Color> categoryAccents = [
    accentGreen, // z.B. "Fast Food"
    accentViolet, // z.B. "Grocerie"
    accentPink, // z.B. "Taxi"
    primaryBlue, // weitere Kategorie
  ];
}
