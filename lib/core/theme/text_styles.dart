import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'colors.dart';

double _getResponsiveFontSize(double baseSize, [BuildContext? context]) {
  if (kIsWeb) {
    // Check if context is provided to detect mobile web
    if (context != null) {
      final screenWidth = MediaQuery.of(context).size.width;
      if (screenWidth < 768) {
        return baseSize * 2.6; // Mobile web scale factor - increased more
      }
    }
    return baseSize * 1.2; // Desktop web scale factor
  }
  return baseSize;
}

double _getResponsiveIconSize(double baseSize, [BuildContext? context]) {
  if (kIsWeb) {
    // Check if context is provided to detect mobile web
    if (context != null) {
      final screenWidth = MediaQuery.of(context).size.width;
      if (screenWidth < 768) {
        return baseSize * 2.2; // Mobile web icon scale factor - increased more
      }
    }
    return baseSize * 1.1; // Desktop web icon scale factor
  }
  return baseSize;
}

double _ensureMinSize(double size) {
  return size < 12.0 ? 12.0 : size;
}

// Function to create responsive text styles with context
TextStyle getResponsiveTextStyle(double baseSize, {
  FontWeight? fontWeight,
  Color? color,
  BuildContext? context,
}) {
  return TextStyle(
    fontSize: _ensureMinSize(_getResponsiveFontSize(baseSize, context)),
    fontWeight: fontWeight,
    color: color,
  );
}

final TextStyle title1 = TextStyle(
  fontSize: _ensureMinSize(_getResponsiveFontSize(28)),
  fontWeight: FontWeight.bold,
  color: textPrimary,
);

final TextStyle title2 = TextStyle(
  fontSize: _ensureMinSize(_getResponsiveFontSize(24)),
  fontWeight: FontWeight.w600,
  color: textPrimary,
);

final TextStyle title2White = TextStyle(
  fontSize: _ensureMinSize(_getResponsiveFontSize(24)),
  fontWeight: FontWeight.w600,
  color: Colors.white,
);

final TextStyle subtitle1 = TextStyle(
  fontSize: _ensureMinSize(_getResponsiveFontSize(18)),
  fontWeight: FontWeight.w500,
  color: textPrimary,
);

final TextStyle subtitle2 = TextStyle(
  fontSize: _ensureMinSize(_getResponsiveFontSize(16)),
  fontWeight: FontWeight.w500,
  color: textSecondary,
);

final TextStyle body1 = TextStyle(
  fontSize: _ensureMinSize(_getResponsiveFontSize(16)),
  color: textPrimary,
);

final TextStyle body2 = TextStyle(
  fontSize: _ensureMinSize(_getResponsiveFontSize(14)),
  color: textSecondary,
);

final TextStyle caption = TextStyle(
  fontSize: _ensureMinSize(_getResponsiveFontSize(12)),
  color: textSecondary,
);

// Public helper functions for responsive sizing
double getResponsiveFontSize(double baseSize, BuildContext context) {
  return _getResponsiveFontSize(baseSize, context);
}

double getResponsiveIconSize(double baseSize, BuildContext context) {
  return _getResponsiveIconSize(baseSize, context);
}