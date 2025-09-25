import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/theme/colors.dart';
import '../../../core/theme/text_styles.dart';

/// Indicador de progreso lineal personalizable
/// Útil para mostrar progreso de carga o completado de tareas
class LinearProgress extends StatelessWidget {
  /// Valor del progreso (0.0 - 1.0), null para indeterminado
  final double? value;

  /// Color de la barra de progreso
  final Color? color;

  /// Color de fondo de la barra
  final Color? backgroundColor;

  /// Altura de la barra
  final double? height;

  /// Radio del borde
  final double? borderRadius;

  /// Si debe mostrar el porcentaje como texto
  final bool showPercentage;

  /// Color del texto del porcentaje
  final Color? textColor;

  const LinearProgress({
    Key? key,
    this.value,
    this.color,
    this.backgroundColor,
    this.height,
    this.borderRadius,
    this.showPercentage = false,
    this.textColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final widget = Container(
      height: height ?? 8.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius ?? 4.r),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(borderRadius ?? 4.r),
        child: LinearProgressIndicator(
          value: value,
          valueColor: AlwaysStoppedAnimation<Color>(color ?? primaryColor),
          backgroundColor: backgroundColor ?? Colors.grey.shade300,
        ),
      ),
    );

    if (showPercentage && value != null) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            '${(value! * 100).toInt()}%',
            style: caption.copyWith(
              color: textColor ?? textSecondary,
            ),
          ),
          SizedBox(height: 4.h),
          widget,
        ],
      );
    }

    return widget;
  }
}

/// Progreso lineal con etiqueta
class LinearProgressWithLabel extends StatelessWidget {
  final double? value;
  final String label;
  final Color? color;
  final Color? backgroundColor;
  final Color? textColor;

  const LinearProgressWithLabel({
    Key? key,
    this.value,
    required this.label,
    this.color,
    this.backgroundColor,
    this.textColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              label,
              style: subtitle2.copyWith(
                color: textColor ?? textPrimary,
              ),
            ),
            if (value != null)
              Text(
                '${(value! * 100).toInt()}%',
                style: caption.copyWith(
                  color: textColor ?? textSecondary,
                ),
              ),
          ],
        ),
        SizedBox(height: 8.h),
        LinearProgress(
          value: value,
          color: color,
          backgroundColor: backgroundColor,
          height: 6.h,
        ),
      ],
    );
  }
}

/// Progreso lineal animado con steps
class SteppedLinearProgress extends StatefulWidget {
  final int totalSteps;
  final int currentStep;
  final Color? activeColor;
  final Color? inactiveColor;
  final Duration? animationDuration;

  const SteppedLinearProgress({
    Key? key,
    required this.totalSteps,
    required this.currentStep,
    this.activeColor,
    this.inactiveColor,
    this.animationDuration,
  }) : super(key: key);

  @override
  State<SteppedLinearProgress> createState() => _SteppedLinearProgressState();
}

class _SteppedLinearProgressState extends State<SteppedLinearProgress>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: widget.animationDuration ?? const Duration(milliseconds: 500),
      vsync: this,
    );

    _updateAnimation();
    _controller.forward();
  }

  void _updateAnimation() {
    final progress = widget.currentStep / widget.totalSteps;
    final currentValue = _animation?.value ?? 0.0;
    _animation = Tween<double>(
      begin: currentValue,
      end: progress,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));
  }

  @override
  void didUpdateWidget(SteppedLinearProgress oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.currentStep != widget.currentStep) {
      _controller.reset();
      _updateAnimation();
      _controller.forward();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(widget.totalSteps, (index) {
            final isActive = index < widget.currentStep;
            return Container(
              width: 12.w,
              height: 12.h,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: isActive
                    ? (widget.activeColor ?? primaryColor)
                    : (widget.inactiveColor ?? Colors.grey.shade300),
                border: Border.all(
                  color: isActive
                      ? (widget.activeColor ?? primaryColor)
                      : Colors.grey.shade400,
                  width: 2,
                ),
              ),
              child: isActive
                  ? Icon(
                      Icons.check,
                      size: 8.w,
                      color: Colors.white,
                    )
                  : null,
            );
          }),
        ),
        SizedBox(height: 8.h),
        AnimatedBuilder(
          animation: _animation,
          builder: (context, child) {
            return LinearProgress(
              value: _animation.value,
              color: widget.activeColor ?? primaryColor,
              backgroundColor: widget.inactiveColor ?? Colors.grey.shade300,
            );
          },
        ),
      ],
    );
  }
}

/// Múltiples barras de progreso con diferentes colores
class MultiColorLinearProgress extends StatelessWidget {
  final List<ProgressSegment> segments;
  final double? height;
  final double? borderRadius;

  const MultiColorLinearProgress({
    Key? key,
    required this.segments,
    this.height,
    this.borderRadius,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? 12.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius ?? 6.r),
        color: Colors.grey.shade200,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(borderRadius ?? 6.r),
        child: Row(
          children: segments.map((segment) {
            return Expanded(
              flex: (segment.value * 100).toInt(),
              child: Container(
                color: segment.color,
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}

/// Modelo para segmentos del MultiColorLinearProgress
class ProgressSegment {
  final double value;
  final Color color;
  final String? label;

  const ProgressSegment({
    required this.value,
    required this.color,
    this.label,
  });
}