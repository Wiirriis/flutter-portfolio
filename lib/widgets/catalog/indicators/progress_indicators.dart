import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/theme/colors.dart';
import '../../../core/theme/text_styles.dart';

/// Indicador de progreso circular personalizable
/// Más opciones que CircularProgressIndicator estándar
class CustomCircularProgress extends StatelessWidget {
  /// Valor del progreso (0.0 - 1.0), null para indeterminado
  final double? value;

  /// Color de la barra de progreso
  final Color? color;

  /// Color de fondo del círculo
  final Color? backgroundColor;

  /// Grosor de la línea
  final double strokeWidth;

  /// Tamaño del indicador
  final double size;

  /// Si muestra el porcentaje en el centro
  final bool showPercentage;

  /// Color del texto del porcentaje
  final Color? textColor;

  /// Widget personalizado para el centro
  final Widget? centerWidget;

  const CustomCircularProgress({
    Key? key,
    this.value,
    this.color,
    this.backgroundColor,
    this.strokeWidth = 4.0,
    this.size = 56.0,
    this.showPercentage = false,
    this.textColor,
    this.centerWidget,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size.w,
      height: size.h,
      child: Stack(
        alignment: Alignment.center,
        children: [
          CircularProgressIndicator(
            value: value,
            strokeWidth: strokeWidth,
            valueColor: AlwaysStoppedAnimation<Color>(color ?? primaryColor),
            backgroundColor: backgroundColor ?? Colors.grey.shade300,
          ),
          if (centerWidget != null)
            centerWidget!
          else if (showPercentage && value != null)
            Text(
              '${(value! * 100).toInt()}%',
              style: TextStyle(
                fontSize: (size * 0.2).sp,
                fontWeight: FontWeight.bold,
                color: textColor ?? textPrimary,
              ),
            ),
        ],
      ),
    );
  }
}

/// Barra de progreso segmentada
class SegmentedProgress extends StatelessWidget {
  /// Número total de segmentos
  final int totalSegments;

  /// Número de segmentos completados
  final int completedSegments;

  /// Color de segmentos completados
  final Color? activeColor;

  /// Color de segmentos incompletos
  final Color? inactiveColor;

  /// Altura de la barra
  final double height;

  /// Espaciado entre segmentos
  final double spacing;

  const SegmentedProgress({
    Key? key,
    required this.totalSegments,
    required this.completedSegments,
    this.activeColor,
    this.inactiveColor,
    this.height = 8.0,
    this.spacing = 4.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(totalSegments, (index) {
        final isActive = index < completedSegments;
        return Expanded(
          child: Container(
            height: height.h,
            margin: EdgeInsets.only(
              right: index < totalSegments - 1 ? spacing.w : 0,
            ),
            decoration: BoxDecoration(
              color: isActive
                  ? (activeColor ?? primaryColor)
                  : (inactiveColor ?? Colors.grey.shade300),
              borderRadius: BorderRadius.circular(height.r / 2),
            ),
          ),
        );
      }),
    );
  }
}

/// Indicador de progreso con múltiples etapas
class StepProgress extends StatelessWidget {
  /// Etapa actual (0-indexado)
  final int currentStep;

  /// Lista de etapas
  final List<ProgressStep> steps;

  /// Color de etapas activas
  final Color? activeColor;

  /// Color de etapas inactivas
  final Color? inactiveColor;

  /// Si es horizontal o vertical
  final bool isHorizontal;

  const StepProgress({
    Key? key,
    required this.currentStep,
    required this.steps,
    this.activeColor,
    this.inactiveColor,
    this.isHorizontal = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (isHorizontal) {
      return Row(
        children: _buildSteps(),
      );
    } else {
      return Column(
        children: _buildSteps(),
      );
    }
  }

  List<Widget> _buildSteps() {
    List<Widget> widgets = [];

    for (int i = 0; i < steps.length; i++) {
      final step = steps[i];
      final isActive = i <= currentStep;
      final isCompleted = i < currentStep;

      widgets.add(_buildStepItem(step, isActive, isCompleted, i));

      if (i < steps.length - 1) {
        widgets.add(_buildConnector(i < currentStep));
      }
    }

    return widgets;
  }

  Widget _buildStepItem(ProgressStep step, bool isActive, bool isCompleted, int index) {
    final effectiveActiveColor = activeColor ?? primaryColor;
    final effectiveInactiveColor = inactiveColor ?? Colors.grey.shade300;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 32.w,
          height: 32.h,
          decoration: BoxDecoration(
            color: isActive ? effectiveActiveColor : effectiveInactiveColor,
            shape: BoxShape.circle,
            border: Border.all(
              color: isActive ? effectiveActiveColor : Colors.grey.shade400,
              width: 2,
            ),
          ),
          child: Center(
            child: isCompleted
                ? Icon(
                    Icons.check,
                    color: Colors.white,
                    size: 16.w,
                  )
                : step.icon != null
                    ? Icon(
                        step.icon,
                        color: isActive ? Colors.white : Colors.grey.shade600,
                        size: 16.w,
                      )
                    : Text(
                        '${index + 1}',
                        style: TextStyle(
                          color: isActive ? Colors.white : Colors.grey.shade600,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
          ),
        ),
        SizedBox(height: 8.h),
        Text(
          step.title,
          style: caption.copyWith(
            color: isActive ? textPrimary : textSecondary,
            fontWeight: isActive ? FontWeight.w600 : FontWeight.normal,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Widget _buildConnector(bool isActive) {
    final color = isActive ? (activeColor ?? primaryColor) : (inactiveColor ?? Colors.grey.shade300);

    if (isHorizontal) {
      return Expanded(
        child: Container(
          height: 2.h,
          color: color,
          margin: EdgeInsets.symmetric(horizontal: 8.w),
        ),
      );
    } else {
      return Container(
        width: 2.w,
        height: 20.h,
        color: color,
        margin: EdgeInsets.symmetric(vertical: 4.h),
      );
    }
  }
}

/// Indicador de carga tipo skeleton
class SkeletonIndicator extends StatefulWidget {
  /// Ancho del skeleton
  final double? width;

  /// Altura del skeleton
  final double height;

  /// Radio del borde
  final double? borderRadius;

  /// Color base
  final Color? baseColor;

  /// Color de highlight
  final Color? highlightColor;

  const SkeletonIndicator({
    Key? key,
    this.width,
    this.height = 16.0,
    this.borderRadius,
    this.baseColor,
    this.highlightColor,
  }) : super(key: key);

  @override
  State<SkeletonIndicator> createState() => _SkeletonIndicatorState();
}

class _SkeletonIndicatorState extends State<SkeletonIndicator>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    );
    _animation = Tween<double>(begin: -1.0, end: 2.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
    _controller.repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final baseColor = widget.baseColor ?? Colors.grey.shade300;
    final highlightColor = widget.highlightColor ?? Colors.grey.shade100;

    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return Container(
          width: widget.width,
          height: widget.height.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(widget.borderRadius?.r ?? 4.r),
            gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [baseColor, highlightColor, baseColor],
              stops: [
                (_animation.value - 0.5).clamp(0.0, 1.0),
                _animation.value.clamp(0.0, 1.0),
                (_animation.value + 0.5).clamp(0.0, 1.0),
              ],
            ),
          ),
        );
      },
    );
  }
}

/// Lista de skeletons para simular contenido
class SkeletonList extends StatelessWidget {
  /// Número de elementos skeleton
  final int itemCount;

  /// Constructor de item personalizado
  final Widget Function(int index)? itemBuilder;

  const SkeletonList({
    Key? key,
    this.itemCount = 5,
    this.itemBuilder,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(itemCount, (index) {
        return Container(
          margin: EdgeInsets.only(bottom: 16.h),
          child: itemBuilder?.call(index) ?? _buildDefaultSkeletonItem(),
        );
      }),
    );
  }

  Widget _buildDefaultSkeletonItem() {
    return Row(
      children: [
        SkeletonIndicator(
          width: 48.w,
          height: 48.h,
          borderRadius: 24.r,
        ),
        SizedBox(width: 12.w),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SkeletonIndicator(
                width: double.infinity,
                height: 16.h,
              ),
              SizedBox(height: 8.h),
              SkeletonIndicator(
                width: 200.w,
                height: 14.h,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

/// Modelo para pasos del progreso
class ProgressStep {
  final String title;
  final IconData? icon;

  const ProgressStep({
    required this.title,
    this.icon,
  });
}