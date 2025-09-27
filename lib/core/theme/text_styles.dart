import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'colors.dart';

double _getResponsiveFontSize(double baseSize) {
  if (kIsWeb) {
    return baseSize * 1.2; // Web scale factor
  }
  return baseSize;
}

double _ensureMinSize(double size) {
  return size < 12.0 ? 12.0 : size;
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