// lib/core/constants/colors.dart
import 'package:flutter/material.dart';

class AppColors {
  // Primary Colors (based on your design)
  static const Color primary = Color(0xFFFF6347); // Coral/Orange-Red
  static const Color secondary = Color(0xFF2C3E50); // Dark Blue-Gray
  static const Color accent =
      Color(0xFF7FFF00); // Bright Green (for "zero Emission")

  // Neutral Colors
  static const Color background = Color(0xFFF5F5F5);
  static const Color white = Color(0xFFFFFFFF);
  static const Color black = Color(0xFF000000);
  static const Color darkGray = Color(0xFF333333);
  static const Color mediumGray = Color(0xFF666666);
  static const Color lightGray = Color(0xFFE0E0E0);

  // Text Colors
  static const Color textPrimary = Color(0xFF2C3E50);
  static const Color textSecondary = Color(0xFF666666);
  static const Color textLight = Color(0xFF999999);

  // Status Colors
  static const Color success = Color(0xFF4CAF50);
  static const Color warning = Color(0xFFFFC107);
  static const Color error = Color(0xFFF44336);
  static const Color info = Color(0xFF2196F3);

  // Gradient Colors
  static const LinearGradient primaryGradient = LinearGradient(
    colors: [Color(0xFFFF6347), Color(0xFFFF4500)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient heroGradient = LinearGradient(
    colors: [Color(0xFF87CEEB), Color(0xFFE0F6FF)],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );
}
