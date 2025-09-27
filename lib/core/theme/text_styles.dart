import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'colors.dart';

double _getWebScale() {
  return kIsWeb ? 1.2 : 1.0;
}

double _ensureMinSize(double size) {
  return size < 12.0 ? 12.0 : size;
}

final TextStyle title1 = TextStyle(
  fontSize: _ensureMinSize(28.sp * _getWebScale()),
  fontWeight: FontWeight.bold,
  color: textPrimary,
);

final TextStyle title2 = TextStyle(
  fontSize: _ensureMinSize(24.sp * _getWebScale()),
  fontWeight: FontWeight.w600,
  color: textPrimary,

);

final TextStyle title2White = TextStyle(
  fontSize: _ensureMinSize(24.sp * _getWebScale()),
  fontWeight: FontWeight.w600,
  color: Colors.white,
);

final TextStyle subtitle1 = TextStyle(
  fontSize: _ensureMinSize(18.sp * _getWebScale()),
  fontWeight: FontWeight.w500,
  color: textPrimary,
);

final TextStyle subtitle2 = TextStyle(
  fontSize: _ensureMinSize(16.sp * _getWebScale()),
  fontWeight: FontWeight.w500,
  color: textSecondary,
);

final TextStyle body1 = TextStyle(
  fontSize: _ensureMinSize(16.sp * _getWebScale()),
  color: textPrimary,
);

final TextStyle body2 = TextStyle(
  fontSize: _ensureMinSize(14.sp * _getWebScale()),
  color: textSecondary,
);

final TextStyle caption = TextStyle(
  fontSize: _ensureMinSize(12.sp * _getWebScale()),
  color: textSecondary,
);