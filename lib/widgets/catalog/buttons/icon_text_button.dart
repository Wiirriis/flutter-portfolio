import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/theme/colors.dart';
import '../../../core/theme/text_styles.dart';

/// Botón con icono y texto personalizable
/// Permite diferentes layouts y estilos
class IconTextButton extends StatelessWidget {
  /// Texto del botón
  final String text;

  /// Icono del botón
  final IconData icon;

  /// Función callback cuando se presiona
  final VoidCallback? onPressed;

  /// Color de fondo
  final Color? backgroundColor;

  /// Color del icono
  final Color? iconColor;

  /// Color del texto
  final Color? textColor;

  /// Disposición del icono respecto al texto
  final IconPosition iconPosition;

  /// Espaciado entre icono y texto
  final double? spacing;

  /// Padding interno
  final EdgeInsets? padding;

  /// Radio del borde
  final double? borderRadius;

  /// Si está habilitado
  final bool enabled;

  /// Mostrar sombra
  final bool showShadow;

  /// Ancho del botón
  final double? width;

  /// Altura del botón
  final double? height;

  const IconTextButton({
    Key? key,
    required this.text,
    required this.icon,
    this.onPressed,
    this.backgroundColor,
    this.iconColor,
    this.textColor,
    this.iconPosition = IconPosition.left,
    this.spacing,
    this.padding,
    this.borderRadius,
    this.enabled = true,
    this.showShadow = true,
    this.width,
    this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final effectiveBackgroundColor = backgroundColor ?? primaryColor;
    final effectiveIconColor = iconColor ?? Colors.white;
    final effectiveTextColor = textColor ?? Colors.white;
    final effectiveSpacing = spacing ?? 8.w;

    Widget buildContent() {
      final iconWidget = Icon(
        icon,
        color: enabled ? effectiveIconColor : Colors.grey,
        size: 20.w,
      );

      final textWidget = Text(
        text,
        style: subtitle2.copyWith(
          color: enabled ? effectiveTextColor : Colors.grey,
          fontWeight: FontWeight.w600,
        ),
      );

      switch (iconPosition) {
        case IconPosition.left:
          return Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              iconWidget,
              SizedBox(width: effectiveSpacing),
              textWidget,
            ],
          );
        case IconPosition.right:
          return Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              textWidget,
              SizedBox(width: effectiveSpacing),
              iconWidget,
            ],
          );
        case IconPosition.top:
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              iconWidget,
              SizedBox(height: effectiveSpacing),
              textWidget,
            ],
          );
        case IconPosition.bottom:
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              textWidget,
              SizedBox(height: effectiveSpacing),
              iconWidget,
            ],
          );
      }
    }

    return SizedBox(
      width: width,
      height: height,
      child: Material(
        color: enabled ? effectiveBackgroundColor : Colors.grey.shade300,
        borderRadius: BorderRadius.circular(borderRadius ?? 12.r),
        elevation: enabled && showShadow ? 2 : 0,
        child: InkWell(
          borderRadius: BorderRadius.circular(borderRadius ?? 12.r),
          onTap: enabled ? onPressed : null,
          child: Container(
            padding: padding ?? EdgeInsets.symmetric(
              horizontal: 16.w,
              vertical: 12.h,
            ),
            child: buildContent(),
          ),
        ),
      ),
    );
  }
}

/// Botón circular con icono
class CircularIconButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback? onPressed;
  final Color? backgroundColor;
  final Color? iconColor;
  final double? size;
  final bool showShadow;

  const CircularIconButton({
    Key? key,
    required this.icon,
    this.onPressed,
    this.backgroundColor,
    this.iconColor,
    this.size,
    this.showShadow = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final buttonSize = size ?? 48.w;

    return Container(
      width: buttonSize,
      height: buttonSize,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: backgroundColor ?? primaryColor,
        boxShadow: showShadow ? [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            offset: Offset(0, 2.h),
            blurRadius: 8.r,
          ),
        ] : null,
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(buttonSize / 2),
          onTap: onPressed,
          child: Icon(
            icon,
            color: iconColor ?? Colors.white,
            size: buttonSize * 0.4,
          ),
        ),
      ),
    );
  }
}

/// Botón de texto plano con icono
class FlatIconTextButton extends StatelessWidget {
  final String text;
  final IconData icon;
  final VoidCallback? onPressed;
  final Color? color;
  final IconPosition iconPosition;

  const FlatIconTextButton({
    Key? key,
    required this.text,
    required this.icon,
    this.onPressed,
    this.color,
    this.iconPosition = IconPosition.left,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final effectiveColor = color ?? primaryColor;

    Widget buildContent() {
      final iconWidget = Icon(
        icon,
        color: effectiveColor,
        size: 18.w,
      );

      final textWidget = Text(
        text,
        style: subtitle2.copyWith(
          color: effectiveColor,
          fontWeight: FontWeight.w600,
        ),
      );

      switch (iconPosition) {
        case IconPosition.left:
          return Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              iconWidget,
              SizedBox(width: 6.w),
              textWidget,
            ],
          );
        case IconPosition.right:
          return Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              textWidget,
              SizedBox(width: 6.w),
              iconWidget,
            ],
          );
        case IconPosition.top:
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              iconWidget,
              SizedBox(height: 4.h),
              textWidget,
            ],
          );
        case IconPosition.bottom:
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              textWidget,
              SizedBox(height: 4.h),
              iconWidget,
            ],
          );
      }
    }

    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(8.r),
        onTap: onPressed,
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 8.w,
            vertical: 8.h,
          ),
          child: buildContent(),
        ),
      ),
    );
  }
}

/// Floating Action Button personalizado
class CustomFloatingActionButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback? onPressed;
  final Color? backgroundColor;
  final Color? iconColor;
  final String? tooltip;
  final bool mini;
  final List<Color>? gradientColors;

  const CustomFloatingActionButton({
    Key? key,
    required this.icon,
    this.onPressed,
    this.backgroundColor,
    this.iconColor,
    this.tooltip,
    this.mini = false,
    this.gradientColors,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = mini ? 40.w : 56.w;

    Widget fab = Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: gradientColors != null
            ? LinearGradient(colors: gradientColors!)
            : null,
        color: gradientColors == null
            ? (backgroundColor ?? primaryColor)
            : null,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            offset: Offset(0, 4.h),
            blurRadius: 12.r,
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(size / 2),
          onTap: onPressed,
          child: Icon(
            icon,
            color: iconColor ?? Colors.white,
            size: mini ? 18.w : 24.w,
          ),
        ),
      ),
    );

    if (tooltip != null) {
      fab = Tooltip(
        message: tooltip!,
        child: fab,
      );
    }

    return fab;
  }
}

/// Enum para posición del icono
enum IconPosition { left, right, top, bottom }