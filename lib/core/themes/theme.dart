import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  // Premium Color Palette
  static const Color deepBlack = Color(0xFF0A0A0F);
  static const Color richBlack = Color(0xFF121218);
  static const Color surfaceBlack = Color(0xFF1A1A24);
  
  static const Color primaryPurple = Color(0xFF8B5CF6);
  static const Color purpleGlow = Color(0xFFA78BFA);
  static const Color deepPurple = Color(0xFF6D28D9);
  
  static const Color emeraldAccent = Color(0xFF10B981);
  static const Color emeraldGlow = Color(0xFF34D399);
  
  static const Color softWhite = Color(0xFFFAFAFC);
  static const Color mutedGray = Color(0xFF9CA3AF);
  static const Color borderGray = Color(0xFF374151);
  static const Color subtleBorder = Color(0xFF1F2937);
  
  // Glass Effect Colors
  static Color glassBackground = Colors.white.withOpacity(0.05);
  static Color glassBorder = Colors.white.withOpacity(0.1);
  static Color glassHighlight = Colors.white.withOpacity(0.02);
  
  // Glow Effects
  static List<BoxShadow> purpleGlowShadow = [
    BoxShadow(
      color: primaryPurple.withOpacity(0.3),
      blurRadius: 24,
      spreadRadius: -4,
    ),
  ];
  
  static List<BoxShadow> emeraldGlowShadow = [
    BoxShadow(
      color: emeraldAccent.withOpacity(0.3),
      blurRadius: 24,
      spreadRadius: -4,
    ),
  ];
  
  static List<BoxShadow> cardShadow = [
    BoxShadow(
      color: Colors.black.withOpacity(0.3),
      blurRadius: 40,
      offset: const Offset(0, 20),
    ),
    BoxShadow(
      color: primaryPurple.withOpacity(0.1),
      blurRadius: 60,
      offset: const Offset(0, 30),
    ),
  ];
  
  // Typography
  static TextTheme getTextTheme() {
    return TextTheme(
      displayLarge: GoogleFonts.outfit(
        fontSize: 56,
        fontWeight: FontWeight.w700,
        letterSpacing: -2,
        color: softWhite,
        height: 1.1,
      ),
      displayMedium: GoogleFonts.outfit(
        fontSize: 40,
        fontWeight: FontWeight.w600,
        letterSpacing: -1,
        color: softWhite,
        height: 1.2,
      ),
      headlineLarge: GoogleFonts.outfit(
        fontSize: 32,
        fontWeight: FontWeight.w600,
        letterSpacing: -0.5,
        color: softWhite,
      ),
      headlineMedium: GoogleFonts.outfit(
        fontSize: 24,
        fontWeight: FontWeight.w600,
        color: softWhite,
      ),
      titleLarge: GoogleFonts.inter(
        fontSize: 18,
        fontWeight: FontWeight.w600,
        color: softWhite,
        letterSpacing: -0.3,
      ),
      titleMedium: GoogleFonts.inter(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        color: softWhite,
      ),
      bodyLarge: GoogleFonts.inter(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        color: mutedGray,
        height: 1.6,
      ),
      bodyMedium: GoogleFonts.inter(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: mutedGray,
        height: 1.5,
      ),
      labelLarge: GoogleFonts.inter(
        fontSize: 15,
        fontWeight: FontWeight.w600,
        color: softWhite,
        letterSpacing: 0.3,
      ),
    );
  }
  
  // Spacing System
  static const double spacing4 = 4.0;
  static const double spacing8 = 8.0;
  static const double spacing12 = 12.0;
  static const double spacing16 = 16.0;
  static const double spacing20 = 20.0;
  static const double spacing24 = 24.0;
  static const double spacing32 = 32.0;
  static const double spacing40 = 40.0;
  static const double spacing48 = 48.0;
  static const double spacing64 = 64.0;
  static const double spacing80 = 80.0;
  
  // Border Radius
  static const BorderRadius radiusSmall = BorderRadius.all(Radius.circular(8));
  static const BorderRadius radiusMedium = BorderRadius.all(Radius.circular(12));
  static const BorderRadius radiusLarge = BorderRadius.all(Radius.circular(16));
  static const BorderRadius radiusXLarge = BorderRadius.all(Radius.circular(24));
  
  // Animation Durations
  static const Duration durationFast = Duration(milliseconds: 200);
  static const Duration durationMedium = Duration(milliseconds: 350);
  static const Duration durationSlow = Duration(milliseconds: 500);
  
  static ThemeData get theme {
    return ThemeData(
      brightness: Brightness.dark,
      scaffoldBackgroundColor: deepBlack,
      textTheme: getTextTheme(),
      colorScheme: const ColorScheme.dark(
        primary: primaryPurple,
        secondary: emeraldAccent,
        surface: surfaceBlack,
        background: deepBlack,
      ),
    );
  }
}