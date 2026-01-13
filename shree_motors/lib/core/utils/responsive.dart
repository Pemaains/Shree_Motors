// lib/core/utils/responsive.dart
import 'package:flutter/material.dart';

class Responsive {
  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < 451;

  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width >= 451 &&
      MediaQuery.of(context).size.width < 801;

  static bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= 801;

  static double width(BuildContext context) =>
      MediaQuery.of(context).size.width;

  static double height(BuildContext context) =>
      MediaQuery.of(context).size.height;

  // Responsive value based on screen size
  static T value<T>(
    BuildContext context, {
    required T mobile,
    T? tablet,
    required T desktop,
  }) {
    if (isMobile(context)) return mobile;
    if (isTablet(context)) return tablet ?? mobile;
    return desktop;
  }

  // Responsive padding
  static double padding(BuildContext context) {
    if (isMobile(context)) return 16.0;
    if (isTablet(context)) return 24.0;
    return 32.0;
  }

  // Responsive font size
  static double fontSize(BuildContext context, double baseSize) {
    if (isMobile(context)) return baseSize * 0.85;
    if (isTablet(context)) return baseSize * 0.95;
    return baseSize;
  }

  // Responsive grid columns
  static int gridColumns(BuildContext context) {
    if (isMobile(context)) return 1;
    if (isTablet(context)) return 2;
    return 3;
  }

  // Responsive spacing
  static double spacing(BuildContext context) {
    if (isMobile(context)) return 12.0;
    if (isTablet(context)) return 16.0;
    return 20.0;
  }
}
