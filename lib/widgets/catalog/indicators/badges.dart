import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/theme/colors.dart';
import '../../../core/theme/text_styles.dart';

/// Badge básico personalizable
/// Útil para mostrar estados, contadores o etiquetas
class CustomBadge extends StatelessWidget {
  /// Texto del badge
  final String text;

  /// Color de fondo
  final Color? backgroundColor;

  /// Color del texto
  final Color? textColor;

  /// Tipo de badge
  final BadgeType type;

  /// Tamaño del badge
  final BadgeSize size;

  /// Si tiene borde
  final bool outlined;

  /// Función callback cuando se toca
  final VoidCallback? onTap;

  /// Icono opcional
  final IconData? icon;

  /// Si se puede cerrar
  final bool dismissible;

  /// Función callback cuando se cierra
  final VoidCallback? onDismiss;

  const CustomBadge({
    Key? key,
    required this.text,
    this.backgroundColor,
    this.textColor,
    this.type = BadgeType.primary,
    this.size = BadgeSize.medium,
    this.outlined = false,
    this.onTap,
    this.icon,
    this.dismissible = false,
    this.onDismiss,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final colors = _getColorsForType();
    final dimensions = _getDimensionsForSize();

    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: dimensions.paddingHorizontal,
          vertical: dimensions.paddingVertical,
        ),
        decoration: BoxDecoration(
          color: outlined ? Colors.transparent : (backgroundColor ?? colors.background),
          border: outlined ? Border.all(color: backgroundColor ?? colors.background) : null,
          borderRadius: BorderRadius.circular(dimensions.borderRadius),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (icon != null) ...[
              Icon(
                icon,
                size: dimensions.iconSize,
                color: outlined ? (backgroundColor ?? colors.background) : (textColor ?? colors.text),
              ),
              SizedBox(width: 4.w),
            ],
            Text(
              text,
              style: TextStyle(
                fontSize: dimensions.fontSize,
                fontWeight: FontWeight.w500,
                color: outlined ? (backgroundColor ?? colors.background) : (textColor ?? colors.text),
              ),
            ),
            if (dismissible) ...[
              SizedBox(width: 4.w),
              GestureDetector(
                onTap: onDismiss,
                child: Icon(
                  Icons.close,
                  size: dimensions.iconSize,
                  color: outlined ? (backgroundColor ?? colors.background) : (textColor ?? colors.text),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }

  BadgeColors _getColorsForType() {
    switch (type) {
      case BadgeType.primary:
        return BadgeColors(background: primaryColor, text: Colors.white);
      case BadgeType.success:
        return BadgeColors(background: successColor, text: Colors.white);
      case BadgeType.warning:
        return BadgeColors(background: warningColor, text: Colors.white);
      case BadgeType.error:
        return BadgeColors(background: errorColor, text: Colors.white);
      case BadgeType.info:
        return BadgeColors(background: infoColor, text: Colors.white);
      case BadgeType.secondary:
        return BadgeColors(background: Colors.grey.shade600, text: Colors.white);
    }
  }

  BadgeDimensions _getDimensionsForSize() {
    switch (size) {
      case BadgeSize.small:
        return BadgeDimensions(
          fontSize: 10.sp,
          paddingHorizontal: 6.w,
          paddingVertical: 2.h,
          borderRadius: 8.r,
          iconSize: 12.w,
        );
      case BadgeSize.medium:
        return BadgeDimensions(
          fontSize: 12.sp,
          paddingHorizontal: 8.w,
          paddingVertical: 4.h,
          borderRadius: 12.r,
          iconSize: 14.w,
        );
      case BadgeSize.large:
        return BadgeDimensions(
          fontSize: 14.sp,
          paddingHorizontal: 12.w,
          paddingVertical: 6.h,
          borderRadius: 16.r,
          iconSize: 16.w,
        );
    }
  }
}

/// Badge contador para notificaciones
class CounterBadge extends StatelessWidget {
  /// Número a mostrar
  final int count;

  /// Color de fondo
  final Color? backgroundColor;

  /// Color del texto
  final Color? textColor;

  /// Tamaño del badge
  final double? size;

  /// Widget hijo al que se le añade el badge
  final Widget child;

  /// Posición del badge
  final BadgePosition position;

  /// Si se muestra cuando el contador es 0
  final bool showZero;

  /// Número máximo a mostrar (después muestra +)
  final int? maxCount;

  const CounterBadge({
    Key? key,
    required this.count,
    this.backgroundColor,
    this.textColor,
    this.size,
    required this.child,
    this.position = BadgePosition.topRight,
    this.showZero = false,
    this.maxCount,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (count == 0 && !showZero) {
      return child;
    }

    final badgeSize = size ?? 18.w;
    final displayCount = maxCount != null && count > maxCount!
        ? '${maxCount!}+'
        : count.toString();

    return Stack(
      clipBehavior: Clip.none,
      children: [
        child,
        _buildPositionedBadge(position, badgeSize, Container(
            constraints: BoxConstraints(minWidth: badgeSize),
            height: badgeSize,
            padding: EdgeInsets.symmetric(horizontal: 4.w),
            decoration: BoxDecoration(
              color: backgroundColor ?? errorColor,
              borderRadius: BorderRadius.circular(badgeSize / 2),
            ),
            child: Center(
              child: Text(
                displayCount,
                style: TextStyle(
                  color: textColor ?? Colors.white,
                  fontSize: 10.sp,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildPositionedBadge(BadgePosition position, double badgeSize, Widget child) {
    switch (position) {
      case BadgePosition.topLeft:
        return Positioned(
          top: -badgeSize / 3,
          left: -badgeSize / 3,
          child: child,
        );
      case BadgePosition.topRight:
        return Positioned(
          top: -badgeSize / 3,
          right: -badgeSize / 3,
          child: child,
        );
      case BadgePosition.bottomLeft:
        return Positioned(
          bottom: -badgeSize / 3,
          left: -badgeSize / 3,
          child: child,
        );
      case BadgePosition.bottomRight:
        return Positioned(
          bottom: -badgeSize / 3,
          right: -badgeSize / 3,
          child: child,
        );
    }
  }
}

/// Badge de estado con punto colorido
class StatusBadge extends StatelessWidget {
  /// Texto del estado
  final String text;

  /// Estado del badge
  final BadgeStatus status;

  /// Si muestra solo el punto sin texto
  final bool dotOnly;

  /// Tamaño del punto
  final double? dotSize;

  /// Si el punto pulsa (animación)
  final bool pulsing;

  const StatusBadge({
    Key? key,
    required this.text,
    required this.status,
    this.dotOnly = false,
    this.dotSize,
    this.pulsing = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final color = _getColorForStatus();
    final effectiveDotSize = dotSize ?? (dotOnly ? 8.w : 6.w);

    Widget dot = Container(
      width: effectiveDotSize,
      height: effectiveDotSize,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
      ),
    );

    if (pulsing) {
      dot = _PulsingDot(color: color, size: effectiveDotSize);
    }

    if (dotOnly) {
      return dot;
    }

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        dot,
        SizedBox(width: 6.w),
        Text(
          text,
          style: caption.copyWith(
            color: textPrimary,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }

  Color _getColorForStatus() {
    switch (status) {
      case BadgeStatus.active:
        return successColor;
      case BadgeStatus.inactive:
        return Colors.grey;
      case BadgeStatus.pending:
        return warningColor;
      case BadgeStatus.error:
        return errorColor;
    }
  }
}

/// Badge con gradiente
class GradientBadge extends StatelessWidget {
  final String text;
  final List<Color> gradientColors;
  final Color? textColor;
  final IconData? icon;
  final VoidCallback? onTap;

  const GradientBadge({
    Key? key,
    required this.text,
    this.gradientColors = const [primaryColor, primaryDark],
    this.textColor,
    this.icon,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: gradientColors),
          borderRadius: BorderRadius.circular(16.r),
          boxShadow: [
            BoxShadow(
              color: gradientColors.first.withOpacity(0.3),
              offset: Offset(0, 2.h),
              blurRadius: 4.r,
            ),
          ],
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (icon != null) ...[
              Icon(
                icon,
                size: 14.w,
                color: textColor ?? Colors.white,
              ),
              SizedBox(width: 4.w),
            ],
            Text(
              text,
              style: TextStyle(
                fontSize: 12.sp,
                fontWeight: FontWeight.w600,
                color: textColor ?? Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// Widget para animación de pulsación
class _PulsingDot extends StatefulWidget {
  final Color color;
  final double size;

  const _PulsingDot({
    Key? key,
    required this.color,
    required this.size,
  }) : super(key: key);

  @override
  State<_PulsingDot> createState() => _PulsingDotState();
}

class _PulsingDotState extends State<_PulsingDot>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1200),
      vsync: this,
    );

    _animation = Tween<double>(
      begin: 0.8,
      end: 1.2,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));

    _controller.repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return Transform.scale(
          scale: _animation.value,
          child: Container(
            width: widget.size,
            height: widget.size,
            decoration: BoxDecoration(
              color: widget.color,
              shape: BoxShape.circle,
            ),
          ),
        );
      },
    );
  }
}

/// Enums y clases de soporte
enum BadgeType { primary, success, warning, error, info, secondary }
enum BadgeSize { small, medium, large }
enum BadgeStatus { active, inactive, pending, error }

enum BadgePosition { topLeft, topRight, bottomLeft, bottomRight }


class BadgeColors {
  final Color background;
  final Color text;

  BadgeColors({required this.background, required this.text});
}

class BadgeDimensions {
  final double fontSize;
  final double paddingHorizontal;
  final double paddingVertical;
  final double borderRadius;
  final double iconSize;

  BadgeDimensions({
    required this.fontSize,
    required this.paddingHorizontal,
    required this.paddingVertical,
    required this.borderRadius,
    required this.iconSize,
  });
}