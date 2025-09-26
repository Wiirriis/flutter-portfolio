import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'colors.dart';

double _getWebScale() {
  return kIsWeb ? 0.65 : 1.0;
}

final TextStyle title1 = TextStyle(
  fontSize: (28.sp * _getWebScale()),
  fontWeight: FontWeight.bold,
  color: textPrimary,
);

final TextStyle title2 = TextStyle(
  fontSize: (24.sp * _getWebScale()),
  fontWeight: FontWeight.w600,
  color: textPrimary,

);

final TextStyle title2White = TextStyle(
  fontSize: (24.sp * _getWebScale()),
  fontWeight: FontWeight.w600,
  color: Colors.white,
);

final TextStyle subtitle1 = TextStyle(
  fontSize: (18.sp * _getWebScale()),
  fontWeight: FontWeight.w500,
  color: textPrimary,
);

final TextStyle subtitle2 = TextStyle(
  fontSize: (16.sp * _getWebScale()),
  fontWeight: FontWeight.w500,
  color: textSecondary,
);

final TextStyle body1 = TextStyle(
  fontSize: (16.sp * _getWebScale()),
  color: textPrimary,
);

final TextStyle body2 = TextStyle(
  fontSize: (14.sp * _getWebScale()),
  color: textSecondary,
);

final TextStyle caption = TextStyle(
  fontSize: (12.sp * _getWebScale()),
  color: textSecondary,
);