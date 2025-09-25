import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/theme/colors.dart';
import 'primary_button.dart';

/// Botón con borde y fondo transparente
/// Útil para acciones secundarias
class OutlineButton extends StatelessWidget {
  /// Texto del botón
  final String text;

  /// Función callback cuando se presiona
  final VoidCallback? onPressed;

  /// Color del borde y texto
  final Color? borderColor;

  /// Color del texto
  final Color? textColor;

  /// Color de fondo (transparente por defecto)
  final Color? backgroundColor;

  /// Ancho del botón
  final double? width;

  /// Altura del botón
  final double? height;

  /// Radio del borde
  final double? borderRadius;

  /// Grosor del borde
  final double? borderWidth;

  /// Si está habilitado
  final bool enabled;

  /// Icono opcional
  final IconData? icon;

  /// Si está en estado de carga
  final bool loading;

  /// Tamaño del botón
  final ButtonSize size;

  const OutlineButton({
    Key? key,
    required this.text,
    this.onPressed,
    this.borderColor,
    this.textColor,
    this.backgroundColor,
    this.width,
    this.height,
    this.borderRadius,
    this.borderWidth,
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
    final effectiveBorderColor = borderColor ?? primaryColor;
    final effectiveTextColor = textColor ?? effectiveBorderColor;

    return SizedBox(
      width: width,
      height: buttonHeight,
      child: OutlinedButton(
        onPressed: enabled && !loading ? onPressed : null,
        style: OutlinedButton.styleFrom(
          foregroundColor: effectiveTextColor,
          backgroundColor: backgroundColor ?? Colors.transparent,
          disabledForegroundColor: Colors.grey.shade400,
          side: BorderSide(
            color: enabled ? effectiveBorderColor : Colors.grey.shade300,
            width: borderWidth ?? 1.5,
          ),
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
                  valueColor: AlwaysStoppedAnimation<Color>(effectiveTextColor),
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

/// Botón outline con efecto de hover/pressed
class OutlineButtonWithHover extends StatefulWidget {
  final String text;
  final VoidCallback? onPressed;
  final Color? borderColor;
  final Color? hoverColor;
  final IconData? icon;

  const OutlineButtonWithHover({
    Key? key,
    required this.text,
    this.onPressed,
    this.borderColor,
    this.hoverColor,
    this.icon,
  }) : super(key: key);

  @override
  State<OutlineButtonWithHover> createState() => _OutlineButtonWithHoverState();
}

class _OutlineButtonWithHoverState extends State<OutlineButtonWithHover> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    final effectiveBorderColor = widget.borderColor ?? primaryColor;
    final effectiveHoverColor = widget.hoverColor ?? effectiveBorderColor.withOpacity(0.1);

    return GestureDetector(
      onTapDown: (_) => setState(() => _isPressed = true),
      onTapUp: (_) => setState(() => _isPressed = false),
      onTapCancel: () => setState(() => _isPressed = false),
      child: OutlineButton(
        text: widget.text,
        onPressed: widget.onPressed,
        borderColor: effectiveBorderColor,
        backgroundColor: _isPressed ? effectiveHoverColor : Colors.transparent,
        icon: widget.icon,
      ),
    );
  }
}

/// Botón outline de ancho completo
class OutlineButtonFullWidth extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final Color? borderColor;
  final bool enabled;
  final IconData? icon;

  const OutlineButtonFullWidth({
    Key? key,
    required this.text,
    this.onPressed,
    this.borderColor,
    this.enabled = true,
    this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlineButton(
      text: text,
      onPressed: onPressed,
      borderColor: borderColor,
      enabled: enabled,
      icon: icon,
      width: double.infinity,
    );
  }
}

/// Botón outline con gradiente en el borde
class GradientOutlineButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final List<Color> gradientColors;
  final double? width;
  final double? height;

  const GradientOutlineButton({
    Key? key,
    required this.text,
    this.onPressed,
    this.gradientColors = const [primaryColor, primaryDark],
    this.width,
    this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height ?? 48.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.r),
        gradient: LinearGradient(colors: gradientColors),
      ),
      child: Container(
        margin: EdgeInsets.all(2.w), // Grosor del borde
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.r),
          color: Colors.white,
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            borderRadius: BorderRadius.circular(10.r),
            onTap: onPressed,
            child: Container(
              alignment: Alignment.center,
              child: ShaderMask(
                shaderCallback: (bounds) => LinearGradient(
                  colors: gradientColors,
                ).createShader(bounds),
                child: Text(
                  text,
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}