import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/theme/colors.dart';
import '../../../core/theme/text_styles.dart';

/// Tarjeta para mostrar características o features
/// Útil para landing pages o descripciones de productos
class FeatureCard extends StatelessWidget {
  /// Título de la característica
  final String title;

  /// Descripción de la característica
  final String description;

  /// Icono de la característica
  final IconData icon;

  /// Color del icono y elementos destacados
  final Color? accentColor;

  /// Color de fondo de la tarjeta
  final Color? backgroundColor;

  /// Función callback cuando se toca la tarjeta
  final VoidCallback? onTap;

  /// Si se muestra en orientación horizontal
  final bool horizontal;

  /// Altura de la tarjeta (solo para orientación vertical)
  final double? height;

  const FeatureCard({
    Key? key,
    required this.title,
    required this.description,
    required this.icon,
    this.accentColor,
    this.backgroundColor,
    this.onTap,
    this.horizontal = false,
    this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final effectiveAccentColor = accentColor ?? primaryColor;

    return Container(
      height: horizontal ? null : (height ?? 200.h),
      decoration: BoxDecoration(
        color: backgroundColor ?? Colors.white,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            offset: Offset(0, 4.h),
            blurRadius: 12.r,
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
            child: horizontal ? _buildHorizontalLayout(effectiveAccentColor)
                              : _buildVerticalLayout(effectiveAccentColor),
          ),
        ),
      ),
    );
  }

  Widget _buildVerticalLayout(Color accentColor) {
    return Column(
      children: [
        Container(
          width: 56.w,
          height: 56.h,
          decoration: BoxDecoration(
            color: accentColor.withOpacity(0.1),
            borderRadius: BorderRadius.circular(16.r),
          ),
          child: Icon(
            icon,
            color: accentColor,
            size: 28.w,
          ),
        ),
        SizedBox(height: 16.h),
        Text(
          title,
          style: subtitle1.copyWith(
            color: textPrimary,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
          overflow: TextOverflow.ellipsis,
        ),
        SizedBox(height: 8.h),
        Expanded(
          child: Text(
            description,
            style: body2.copyWith(color: textSecondary),
            textAlign: TextAlign.center,
            maxLines: 4,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }

  Widget _buildHorizontalLayout(Color accentColor) {
    return Row(
      children: [
        Container(
          width: 48.w,
          height: 48.h,
          decoration: BoxDecoration(
            color: accentColor.withOpacity(0.1),
            borderRadius: BorderRadius.circular(12.r),
          ),
          child: Icon(
            icon,
            color: accentColor,
            size: 24.w,
          ),
        ),
        SizedBox(width: 16.w),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: subtitle1.copyWith(
                  color: textPrimary,
                  fontWeight: FontWeight.bold,
                ),
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(height: 4.h),
              Text(
                description,
                style: body2.copyWith(color: textSecondary),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

/// Tarjeta de característica con número o badge
class FeatureCardNumbered extends StatelessWidget {
  final String title;
  final String description;
  final int number;
  final Color? accentColor;
  final VoidCallback? onTap;

  const FeatureCardNumbered({
    Key? key,
    required this.title,
    required this.description,
    required this.number,
    this.accentColor,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final effectiveAccentColor = accentColor ?? primaryColor;

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            offset: Offset(0, 4.h),
            blurRadius: 12.r,
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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 32.w,
                  height: 32.h,
                  decoration: BoxDecoration(
                    color: effectiveAccentColor,
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  child: Center(
                    child: Text(
                      number.toString(),
                      style: subtitle1.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 16.h),
                Text(
                  title,
                  style: subtitle1.copyWith(
                    color: textPrimary,
                    fontWeight: FontWeight.bold,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 8.h),
                Text(
                  description,
                  style: body2.copyWith(color: textSecondary),
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/// Tarjeta de característica minimalista
class FeatureCardMinimal extends StatelessWidget {
  final String title;
  final String description;
  final IconData icon;
  final Color? accentColor;
  final VoidCallback? onTap;
  final bool showIcon;

  const FeatureCardMinimal({
    Key? key,
    required this.title,
    required this.description,
    required this.icon,
    this.accentColor,
    this.onTap,
    this.showIcon = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final effectiveAccentColor = accentColor ?? primaryColor;

    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade200),
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(12.r),
          onTap: onTap,
          child: Row(
            children: [
              if (showIcon) ...[
                Icon(
                  icon,
                  color: effectiveAccentColor,
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
                    SizedBox(height: 2.h),
                    Text(
                      description,
                      style: caption.copyWith(color: textSecondary),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// Grid de características con animación hover
class FeatureCardGrid extends StatelessWidget {
  final List<FeatureItem> features;
  final int crossAxisCount;
  final double? childAspectRatio;
  final Color? accentColor;

  const FeatureCardGrid({
    Key? key,
    required this.features,
    this.crossAxisCount = 2,
    this.childAspectRatio,
    this.accentColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        childAspectRatio: childAspectRatio ?? 0.8,
        crossAxisSpacing: 16.w,
        mainAxisSpacing: 16.h,
      ),
      itemCount: features.length,
      itemBuilder: (context, index) {
        final feature = features[index];
        return FeatureCard(
          title: feature.title,
          description: feature.description,
          icon: feature.icon,
          accentColor: feature.color ?? accentColor,
          onTap: feature.onTap,
        );
      },
    );
  }
}

/// Modelo para elementos del grid de características
class FeatureItem {
  final String title;
  final String description;
  final IconData icon;
  final Color? color;
  final VoidCallback? onTap;

  const FeatureItem({
    required this.title,
    required this.description,
    required this.icon,
    this.color,
    this.onTap,
  });
}