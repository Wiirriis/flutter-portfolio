import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/theme/colors.dart';

/// Botón primario personalizable con diferentes variantes
/// Extendido del diseño actual de la app
class PrimaryButton extends StatelessWidget {
  /// Texto del botón
  final String text;

  /// Función callback cuando se presiona
  final VoidCallback? onPressed;

  /// Color de fondo del botón
  final Color? backgroundColor;

  /// Color del texto
  final Color? textColor;

  /// Ancho del botón (null para ajustarse al contenido)
  final double? width;

  /// Altura del botón
  final double? height;

  /// Radio del borde
  final double? borderRadius;

  /// Si está habilitado
  final bool enabled;

  /// Icono opcional
  final IconData? icon;

  /// Si está en estado de carga
  final bool loading;

  /// Tamaño del botón (small, medium, large)
  final ButtonSize size;

  const PrimaryButton({
    Key? key,
    required this.text,
    this.onPressed,
    this.backgroundColor,
    this.textColor,
    this.width,
    this.height,
    this.borderRadius,
    this.enabled = true,
    this.icon,
    this.loading = false,
    this.size = ButtonSize.medium,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final buttonHeight = height ?? _getHeightForSize(size);
    final fontSize = _getFontSizeForSize(size);
    final horizontalPadding = _getPaddingForSize(size);

    return SizedBox(
      width: width,
      height: buttonHeight,
      child: ElevatedButton(
        onPressed: enabled && !loading ? onPressed : null,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor ?? primaryColor,
          foregroundColor: textColor ?? Colors.white,
          disabledBackgroundColor: Colors.grey.shade300,
          elevation: enabled ? 2 : 0,
          shadowColor: Colors.black.withOpacity(0.1),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius ?? 12.r),
          ),
          padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
        ),
        child: loading
            ? SizedBox(
                width: 20.w,
                height: 20.h,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  valueColor: AlwaysStoppedAnimation<Color>(
                    textColor ?? Colors.white,
                  ),
                ),
              )
            : Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (icon != null) ...[
                    Icon(icon, size: fontSize + 2),
                    SizedBox(width: 8.w),
                  ],
                  Text(
                    text,
                    style: TextStyle(
                      fontSize: fontSize,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
      ),
    );
  }

  double _getHeightForSize(ButtonSize size) {
    switch (size) {
      case ButtonSize.small:
        return 36.h;
      case ButtonSize.medium:
        return 48.h;
      case ButtonSize.large:
        return 56.h;
    }
  }

  double _getFontSizeForSize(ButtonSize size) {
    switch (size) {
      case ButtonSize.small:
        return 14.sp;
      case ButtonSize.medium:
        return 16.sp;
      case ButtonSize.large:
        return 18.sp;
    }
  }

  double _getPaddingForSize(ButtonSize size) {
    switch (size) {
      case ButtonSize.small:
        return 16.w;
      case ButtonSize.medium:
        return 24.w;
      case ButtonSize.large:
        return 32.w;
    }
  }
}

/// Variante de botón de ancho completo
class PrimaryButtonFullWidth extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final Color? backgroundColor;
  final bool enabled;
  final bool loading;
  final IconData? icon;

  const PrimaryButtonFullWidth({
    Key? key,
    required this.text,
    this.onPressed,
    this.backgroundColor,
    this.enabled = true,
    this.loading = false,
    this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PrimaryButton(
      text: text,
      onPressed: onPressed,
      backgroundColor: backgroundColor,
      enabled: enabled,
      loading: loading,
      icon: icon,
      width: double.infinity,
      size: ButtonSize.medium,
    );
  }
}

/// Variante pequeña del botón primario
class PrimaryButtonSmall extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final Color? backgroundColor;
  final bool enabled;
  final IconData? icon;

  const PrimaryButtonSmall({
    Key? key,
    required this.text,
    this.onPressed,
    this.backgroundColor,
    this.enabled = true,
    this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PrimaryButton(
      text: text,
      onPressed: onPressed,
      backgroundColor: backgroundColor,
      enabled: enabled,
      icon: icon,
      size: ButtonSize.small,
    );
  }
}

/// Variante grande del botón primario
class PrimaryButtonLarge extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final Color? backgroundColor;
  final bool enabled;
  final bool loading;
  final IconData? icon;

  const PrimaryButtonLarge({
    Key? key,
    required this.text,
    this.onPressed,
    this.backgroundColor,
    this.enabled = true,
    this.loading = false,
    this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PrimaryButton(
      text: text,
      onPressed: onPressed,
      backgroundColor: backgroundColor,
      enabled: enabled,
      loading: loading,
      icon: icon,
      size: ButtonSize.large,
    );
  }
}

/// Enum para tamaños de botón
enum ButtonSize { small, medium, large }