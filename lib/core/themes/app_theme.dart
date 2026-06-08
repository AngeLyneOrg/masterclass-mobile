import 'package:flutter/material.dart';

const _primaryColor = Color(0xFF003BFF);

class AppTheme {
  AppTheme._();

  // ── Color Scheme ───────────────────────────────────────────
  static const _lightColorScheme = ColorScheme(
    brightness: Brightness.light,

    primary: Color(0xFF003BFF),
    onPrimary: Color(0xFFFFFFFF),
    primaryContainer: Color(0xFFDDE1FF),
    onPrimaryContainer: Color(0xFF00105C),

    secondary: Color(0xFF585E7E),
    onSecondary: Color(0xFFFFFFFF),
    secondaryContainer: Color(0xFFDDE1FF),
    onSecondaryContainer: Color(0xFF141937),

    tertiary: Color(0xFF7B5294),
    onTertiary: Color(0xFFFFFFFF),
    tertiaryContainer: Color(0xFFF3DAFF),
    onTertiaryContainer: Color(0xFF300B4C),

    error: Color(0xFFBA1A1A),
    onError: Color(0xFFFFFFFF),
    errorContainer: Color(0xFFFFDAD6),
    onErrorContainer: Color(0xFF410002),

    surface: Color(0xFFFBF8FF),
    onSurface: Color(0xFF1A1B23),
    surfaceContainerHighest: Color(0xFFE2E1F0),
    onSurfaceVariant: Color(0xFF45464F),

    outline: Color(0xFF757680),
    outlineVariant: Color(0xFFC5C6D0),

    shadow: Color(0xFF000000),
    scrim: Color(0xFF000000),

    inverseSurface: Color(0xFF2F3038),
    onInverseSurface: Color(0xFFF2EFF9),
    inversePrimary: Color(0xFFB8C3FF),
  );

  static const _darkColorScheme = ColorScheme(
    brightness: Brightness.dark,

    primary: Color(0xFFB8C3FF),
    onPrimary: Color(0xFF001E8C),
    primaryContainer: Color(0xFF002AC4),
    onPrimaryContainer: Color(0xFFDDE1FF),

    secondary: Color(0xFFBEC4E8),
    onSecondary: Color(0xFF29304D),
    secondaryContainer: Color(0xFF404764),
    onSecondaryContainer: Color(0xFFDDE1FF),

    tertiary: Color(0xFFDFB8F9),
    onTertiary: Color(0xFF481962),
    tertiaryContainer: Color(0xFF61397B),
    onTertiaryContainer: Color(0xFFF3DAFF),

    error: Color(0xFFFFB4AB),
    onError: Color(0xFF690005),
    errorContainer: Color(0xFF93000A),
    onErrorContainer: Color(0xFFFFDAD6),

    surface: Color(0xFF11121A),
    onSurface: Color(0xFFE3E1F0),
    surfaceContainerHighest: Color(0xFF33343D),
    onSurfaceVariant: Color(0xFFC5C6D0),

    outline: Color(0xFF8F909A),
    outlineVariant: Color(0xFF45464F),

    shadow: Color(0xFF000000),
    scrim: Color(0xFF000000),

    inverseSurface: Color(0xFFE3E1F0),
    onInverseSurface: Color(0xFF2F3038),
    inversePrimary: Color(0xFF003BFF),
  );

  // ── Text Theme ─────────────────────────────────────────────
  static const _textTheme = TextTheme(
    displayLarge:  TextStyle(fontSize: 57, fontWeight: FontWeight.w400, letterSpacing: -0.25),
    displayMedium: TextStyle(fontSize: 45, fontWeight: FontWeight.w400),
    displaySmall:  TextStyle(fontSize: 36, fontWeight: FontWeight.w400),
    headlineLarge: TextStyle(fontSize: 32, fontWeight: FontWeight.w600),
    headlineMedium:TextStyle(fontSize: 28, fontWeight: FontWeight.w600),
    headlineSmall: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
    titleLarge:    TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
    titleMedium:   TextStyle(fontSize: 16, fontWeight: FontWeight.w500, letterSpacing: 0.15),
    titleSmall:    TextStyle(fontSize: 14, fontWeight: FontWeight.w500, letterSpacing: 0.1),
    bodyLarge:     TextStyle(fontSize: 16, fontWeight: FontWeight.w400, letterSpacing: 0.5),
    bodyMedium:    TextStyle(fontSize: 14, fontWeight: FontWeight.w400, letterSpacing: 0.25),
    bodySmall:     TextStyle(fontSize: 12, fontWeight: FontWeight.w400, letterSpacing: 0.4),
    labelLarge:    TextStyle(fontSize: 14, fontWeight: FontWeight.w500, letterSpacing: 1.25),
    labelMedium:   TextStyle(fontSize: 12, fontWeight: FontWeight.w500, letterSpacing: 1.0),
    labelSmall:    TextStyle(fontSize: 11, fontWeight: FontWeight.w500, letterSpacing: 1.5),
  );

  // ── Light Theme ────────────────────────────────────────────
  static ThemeData get light => ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    colorScheme: _lightColorScheme,
    textTheme: _textTheme,

    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xFFFBF8FF),
      foregroundColor: Color(0xFF1A1B23),
      elevation: 0,
      centerTitle: true,
      titleTextStyle: TextStyle(
        color: Color(0xFF1A1B23),
        fontSize: 18,
        fontWeight: FontWeight.w600,
      ),
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: _primaryColor,
        foregroundColor: Colors.white,
        minimumSize: const Size(double.infinity, 52),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
      ),
    ),

    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: _primaryColor,
        minimumSize: const Size(double.infinity, 52),
        side: const BorderSide(color: _primaryColor, width: 1.5),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
      ),
    ),

    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: const Color(0xFFE2E1F0).withOpacity(0.4),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide.none,
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: Color(0xFFC5C6D0)),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: _primaryColor, width: 2),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: Color(0xFFBA1A1A)),
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      labelStyle: const TextStyle(color: Color(0xFF45464F)),
    ),

    cardTheme: CardThemeData(
      color: Colors.white,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: const BorderSide(color: Color(0xFFC5C6D0), width: 0.5),
      ),
    ),

    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Color(0xFFFBF8FF),
      selectedItemColor: _primaryColor,
      unselectedItemColor: Color(0xFF757680),
      type: BottomNavigationBarType.fixed,
      elevation: 0,
    ),

    chipTheme: ChipThemeData(
      backgroundColor: const Color(0xFFDDE1FF),
      labelStyle: const TextStyle(color: _primaryColor, fontWeight: FontWeight.w500),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
    ),

    dividerTheme: const DividerThemeData(
      color: Color(0xFFC5C6D0),
      thickness: 0.5,
    ),
  );

  // ── Dark Theme ─────────────────────────────────────────────
  static ThemeData get dark => ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    colorScheme: _darkColorScheme,
    textTheme: _textTheme,

    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xFF11121A),
      foregroundColor: Color(0xFFE3E1F0),
      elevation: 0,
      centerTitle: true,
      titleTextStyle: TextStyle(
        color: Color(0xFFE3E1F0),
        fontSize: 18,
        fontWeight: FontWeight.w600,
      ),
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFFB8C3FF),
        foregroundColor: const Color(0xFF001E8C),
        minimumSize: const Size(double.infinity, 52),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
      ),
    ),

    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: const Color(0xFFB8C3FF),
        minimumSize: const Size(double.infinity, 52),
        side: const BorderSide(color: Color(0xFFB8C3FF), width: 1.5),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
      ),
    ),

    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: const Color(0xFF33343D).withOpacity(0.6),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide.none,
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: Color(0xFF45464F)),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: Color(0xFFB8C3FF), width: 2),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: Color(0xFFFFB4AB)),
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      labelStyle: const TextStyle(color: Color(0xFFC5C6D0)),
    ),

    cardTheme: CardThemeData(
      color: const Color(0xFF1E1F28),
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: const BorderSide(color: Color(0xFF45464F), width: 0.5),
      ),
    ),

    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Color(0xFF11121A),
      selectedItemColor: Color(0xFFB8C3FF),
      unselectedItemColor: Color(0xFF8F909A),
      type: BottomNavigationBarType.fixed,
      elevation: 0,
    ),

    chipTheme: ChipThemeData(
      backgroundColor: const Color(0xFF002AC4),
      labelStyle: const TextStyle(color: Color(0xFFDDE1FF), fontWeight: FontWeight.w500),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
    ),

    dividerTheme: const DividerThemeData(
      color: Color(0xFF45464F),
      thickness: 0.5,
    ),
  );
}