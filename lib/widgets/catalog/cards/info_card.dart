import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/theme/colors.dart';
import '../../../core/theme/text_styles.dart';

/// Tarjeta informativa básica con título y contenido
/// Útil para mostrar estadísticas o información general
class InfoCard extends StatelessWidget {
  /// Título principal de la tarjeta
  final String title;

  /// Contenido o descripción
  final String content;

  /// Icono opcional
  final IconData? icon;

  /// Color del icono
  final Color? iconColor;

  /// Color de fondo de la tarjeta
  final Color? backgroundColor;

  /// Altura fija de la tarjeta
  final double? height;

  /// Ancho de la tarjeta
  final double? width;

  /// Si muestra sombra
  final bool showShadow;

  /// Función callback cuando se toca la tarjeta
  final VoidCallback? onTap;

  /// Color del borde
  final Color? borderColor;

  const InfoCard({
    Key? key,
    required this.title,
    required this.content,
    this.icon,
    this.iconColor,
    this.backgroundColor,
    this.height,
    this.width,
    this.showShadow = true,
    this.onTap,
    this.borderColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? 120.h,
      width: width,
      child: Material(
        color: backgroundColor ?? Colors.white,
        borderRadius: BorderRadius.circular(12.r),
        elevation: showShadow ? 2 : 0,
        child: InkWell(
          borderRadius: BorderRadius.circular(12.r),
          onTap: onTap,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.r),
              border: borderColor != null
                  ? Border.all(color: borderColor!, width: 1)
                  : null,
            ),
            padding: EdgeInsets.all(16.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    if (icon != null) ...[
                      Icon(
                        icon,
                        color: iconColor ?? primaryColor,
                        size: 24.w,
                      ),
                      SizedBox(width: 12.w),
                    ],
                    Expanded(
                      child: Text(
                        title,
                        style: subtitle1.copyWith(
                          color: textPrimary,
                          fontWeight: FontWeight.bold,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 8.h),
                Expanded(
                  child: Text(
                    content,
                    style: body2.copyWith(color: textSecondary),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 3,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/// Tarjeta de estadística con número prominente
class StatsCard extends StatelessWidget {
  final String number;
  final String label;
  final IconData icon;
  final Color? color;
  final Color? backgroundColor;
  final double? height;

  const StatsCard({
    Key? key,
    required this.number,
    required this.label,
    required this.icon,
    this.color,
    this.backgroundColor,
    this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final effectiveColor = color ?? primaryColor;

    return Container(
      height: height ?? 100.h,
      child: Material(
        color: backgroundColor ?? Colors.white,
        borderRadius: BorderRadius.circular(12.r),
        elevation: 2,
        child: Padding(
          padding: EdgeInsets.all(16.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                color: effectiveColor,
                size: 28.w,
              ),
              SizedBox(height: 8.h),
              Text(
                number,
                style: title1.copyWith(
                  color: effectiveColor,
                  fontWeight: FontWeight.bold,
                ),
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(height: 4.h),
              Text(
                label,
                style: caption.copyWith(color: textSecondary),
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// Tarjeta con gradiente de fondo
class GradientCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final List<Color> gradientColors;
  final IconData? icon;
  final Widget? child;
  final double? height;
  final VoidCallback? onTap;

  const GradientCard({
    Key? key,
    required this.title,
    required this.subtitle,
    this.gradientColors = const [primaryColor, primaryDark],
    this.icon,
    this.child,
    this.height,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? 140.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.r),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: gradientColors,
        ),
        boxShadow: [
          BoxShadow(
            color: gradientColors.first.withOpacity(0.3),
            offset: Offset(0, 8.h),
            blurRadius: 24.r,
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(16.r),
          onTap: onTap,
          child: Padding(
            padding: EdgeInsets.all(20.w),
            child: child ??
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (icon != null) ...[
                      Icon(
                        icon,
                        color: Colors.white,
                        size: 32.w,
                      ),
                      SizedBox(height: 12.h),
                    ],
                    Text(
                      title,
                      style: subtitle1.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: 8.h),
                    Expanded(
                      child: Text(
                        subtitle,
                        style: body2.copyWith(
                          color: Colors.white.withOpacity(0.9),
                        ),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                      ),
                    ),
                  ],
                ),
          ),
        ),
      ),
    );
  }
}

/// Tarjeta compacta para listas
class CompactCard extends StatelessWidget {
  final String title;
  final String? subtitle;
  final IconData? leadingIcon;
  final Widget? trailing;
  final VoidCallback? onTap;
  final Color? backgroundColor;
  final bool showBorder;

  const CompactCard({
    Key? key,
    required this.title,
    this.subtitle,
    this.leadingIcon,
    this.trailing,
    this.onTap,
    this.backgroundColor,
    this.showBorder = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 8.h),
      decoration: BoxDecoration(
        color: backgroundColor ?? Colors.white,
        borderRadius: BorderRadius.circular(8.r),
        border: showBorder
            ? Border.all(color: Colors.grey.shade300)
            : null,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            offset: Offset(0, 2.h),
            blurRadius: 4.r,
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(8.r),
          onTap: onTap,
          child: Padding(
            padding: EdgeInsets.all(12.w),
            child: Row(
              children: [
                if (leadingIcon != null) ...[
                  Icon(
                    leadingIcon,
                    color: primaryColor,
                    size: 20.w,
                  ),
                  SizedBox(width: 12.w),
                ],
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: subtitle1.copyWith(
                          color: textPrimary,
                          fontWeight: FontWeight.w600,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                      if (subtitle != null) ...[
                        SizedBox(height: 2.h),
                        Text(
                          subtitle!,
                          style: caption.copyWith(color: textSecondary),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ],
                  ),
                ),
                if (trailing != null) ...[
                  SizedBox(width: 8.w),
                  trailing!,
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}