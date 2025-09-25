import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/theme/colors.dart';

/// Widget de spinner circular personalizable
/// Útil para indicar procesos de carga
class CircularSpinner extends StatelessWidget {
  /// Color del spinner
  final Color? color;

  /// Tamaño del spinner
  final double? size;

  /// Grosor de la línea
  final double? strokeWidth;

  /// Si debe mostrar fondo
  final bool showBackground;

  /// Color del fondo (si showBackground es true)
  final Color? backgroundColor;

  const CircularSpinner({
    Key? key,
    this.color,
    this.size,
    this.strokeWidth,
    this.showBackground = false,
    this.backgroundColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final widget = SizedBox(
      width: size ?? 24.w,
      height: size ?? 24.h,
      child: CircularProgressIndicator(
        strokeWidth: strokeWidth ?? 3.0,
        valueColor: AlwaysStoppedAnimation<Color>(
          color ?? primaryColor,
        ),
      ),
    );

    if (showBackground) {
      return Container(
        padding: EdgeInsets.all(16.w),
        decoration: BoxDecoration(
          color: backgroundColor ?? Colors.white.withOpacity(0.9),
          borderRadius: BorderRadius.circular(8.r),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              offset: Offset(0, 2.h),
              blurRadius: 8.r,
            ),
          ],
        ),
        child: widget,
      );
    }

    return widget;
  }
}

/// Variante pequeña del spinner circular
class CircularSpinnerSmall extends StatelessWidget {
  final Color? color;

  const CircularSpinnerSmall({
    Key? key,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircularSpinner(
      size: 16.w,
      strokeWidth: 2.0,
      color: color,
    );
  }
}

/// Variante grande del spinner circular con fondo
class CircularSpinnerLarge extends StatelessWidget {
  final Color? color;
  final Color? backgroundColor;

  const CircularSpinnerLarge({
    Key? key,
    this.color,
    this.backgroundColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircularSpinner(
      size: 40.w,
      strokeWidth: 4.0,
      color: color,
      showBackground: true,
      backgroundColor: backgroundColor,
    );
  }
}