import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/theme/colors.dart';
import '../../../core/theme/text_styles.dart';

/// Spinner con texto de carga personalizable
/// Combina indicador circular con mensaje descriptivo
class TextSpinner extends StatelessWidget {
  /// Texto a mostrar junto al spinner
  final String text;

  /// Color del spinner
  final Color? spinnerColor;

  /// Color del texto
  final Color? textColor;

  /// Tamaño del spinner
  final double? spinnerSize;

  /// Espaciado entre spinner y texto
  final double? spacing;

  /// Si el texto debe ir arriba o abajo del spinner
  final bool textBelow;

  const TextSpinner({
    Key? key,
    required this.text,
    this.spinnerColor,
    this.textColor,
    this.spinnerSize,
    this.spacing,
    this.textBelow = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final spinner = SizedBox(
      width: spinnerSize ?? 24.w,
      height: spinnerSize ?? 24.h,
      child: CircularProgressIndicator(
        strokeWidth: 3.0,
        valueColor: AlwaysStoppedAnimation<Color>(
          spinnerColor ?? primaryColor,
        ),
      ),
    );

    final textWidget = Text(
      text,
      style: body2.copyWith(
        color: textColor ?? textSecondary,
      ),
      textAlign: TextAlign.center,
    );

    if (textBelow) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          spinner,
          SizedBox(height: spacing ?? 12.h),
          textWidget,
        ],
      );
    } else {
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          textWidget,
          SizedBox(height: spacing ?? 12.h),
          spinner,
        ],
      );
    }
  }
}

/// Variante horizontal del TextSpinner
class TextSpinnerHorizontal extends StatelessWidget {
  final String text;
  final Color? spinnerColor;
  final Color? textColor;

  const TextSpinnerHorizontal({
    Key? key,
    required this.text,
    this.spinnerColor,
    this.textColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          width: 20.w,
          height: 20.h,
          child: CircularProgressIndicator(
            strokeWidth: 2.5,
            valueColor: AlwaysStoppedAnimation<Color>(
              spinnerColor ?? primaryColor,
            ),
          ),
        ),
        SizedBox(width: 12.w),
        Text(
          text,
          style: body2.copyWith(
            color: textColor ?? textSecondary,
          ),
        ),
      ],
    );
  }
}

/// Variante con fondo card del TextSpinner
class TextSpinnerCard extends StatelessWidget {
  final String text;
  final Color? spinnerColor;
  final Color? textColor;
  final Color? backgroundColor;

  const TextSpinnerCard({
    Key? key,
    required this.text,
    this.spinnerColor,
    this.textColor,
    this.backgroundColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(24.w),
      decoration: BoxDecoration(
        color: backgroundColor ?? cardColor,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            offset: Offset(0, 4.h),
            blurRadius: 12.r,
          ),
        ],
      ),
      child: TextSpinner(
        text: text,
        spinnerColor: spinnerColor,
        textColor: textColor,
        spinnerSize: 32.w,
        spacing: 16.h,
      ),
    );
  }
}