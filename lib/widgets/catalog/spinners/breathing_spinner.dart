import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/theme/colors.dart';

/// Spinner con efecto de respiración/pulsación
/// Crea una animación suave de escala que simula respiración
class BreathingSpinner extends StatefulWidget {
  /// Color del spinner
  final Color? color;

  /// Tamaño del spinner
  final double? size;

  /// Duración de la animación completa (ida y vuelta)
  final Duration? duration;

  /// Factor de escala mínimo (0.0 - 1.0)
  final double minScale;

  /// Factor de escala máximo
  final double maxScale;

  const BreathingSpinner({
    Key? key,
    this.color,
    this.size,
    this.duration,
    this.minScale = 0.8,
    this.maxScale = 1.2,
  }) : super(key: key);

  @override
  State<BreathingSpinner> createState() => _BreathingSpinnerState();
}

class _BreathingSpinnerState extends State<BreathingSpinner>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: widget.duration ?? const Duration(milliseconds: 1500),
      vsync: this,
    );

    _scaleAnimation = Tween<double>(
      begin: widget.minScale,
      end: widget.maxScale,
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
      animation: _scaleAnimation,
      builder: (context, child) {
        return Transform.scale(
          scale: _scaleAnimation.value,
          child: Container(
            width: widget.size ?? 24.w,
            height: widget.size ?? 24.h,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: (widget.color ?? primaryColor).withOpacity(0.3),
              border: Border.all(
                color: widget.color ?? primaryColor,
                width: 3.0,
              ),
            ),
          ),
        );
      },
    );
  }
}

/// Variante con múltiples círculos concéntricos
class BreathingSpinnerMultiple extends StatefulWidget {
  final Color? color;
  final double? size;

  const BreathingSpinnerMultiple({
    Key? key,
    this.color,
    this.size,
  }) : super(key: key);

  @override
  State<BreathingSpinnerMultiple> createState() => _BreathingSpinnerMultipleState();
}

class _BreathingSpinnerMultipleState extends State<BreathingSpinnerMultiple>
    with TickerProviderStateMixin {
  late List<AnimationController> _controllers;
  late List<Animation<double>> _animations;

  @override
  void initState() {
    super.initState();

    _controllers = List.generate(3, (index) {
      return AnimationController(
        duration: Duration(milliseconds: 1500 + (index * 200)),
        vsync: this,
      );
    });

    _animations = _controllers.map((controller) {
      return Tween<double>(begin: 0.5, end: 1.0).animate(
        CurvedAnimation(parent: controller, curve: Curves.easeInOut),
      );
    }).toList();

    for (var controller in _controllers) {
      controller.repeat(reverse: true);
    }
  }

  @override
  void dispose() {
    for (var controller in _controllers) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = widget.size ?? 40.w;

    return SizedBox(
      width: size,
      height: size,
      child: Stack(
        alignment: Alignment.center,
        children: List.generate(3, (index) {
          return AnimatedBuilder(
            animation: _animations[index],
            builder: (context, child) {
              return Transform.scale(
                scale: _animations[index].value,
                child: Container(
                  width: size * (0.4 + index * 0.3),
                  height: size * (0.4 + index * 0.3),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: (widget.color ?? primaryColor).withOpacity(0.7 - index * 0.2),
                      width: 2.0,
                    ),
                  ),
                ),
              );
            },
          );
        }),
      ),
    );
  }
}

/// Variante con dots pulsantes
class BreathingDots extends StatefulWidget {
  final Color? color;
  final int dotCount;
  final double? dotSize;

  const BreathingDots({
    Key? key,
    this.color,
    this.dotCount = 3,
    this.dotSize,
  }) : super(key: key);

  @override
  State<BreathingDots> createState() => _BreathingDotsState();
}

class _BreathingDotsState extends State<BreathingDots>
    with TickerProviderStateMixin {
  late List<AnimationController> _controllers;
  late List<Animation<double>> _animations;

  @override
  void initState() {
    super.initState();

    _controllers = List.generate(widget.dotCount, (index) {
      return AnimationController(
        duration: const Duration(milliseconds: 800),
        vsync: this,
      );
    });

    _animations = _controllers.map((controller) {
      return Tween<double>(begin: 0.4, end: 1.0).animate(
        CurvedAnimation(parent: controller, curve: Curves.easeInOut),
      );
    }).toList();

    _startAnimations();
  }

  void _startAnimations() async {
    for (int i = 0; i < _controllers.length; i++) {
      _controllers[i].repeat(reverse: true);
      if (i < _controllers.length - 1) {
        await Future.delayed(const Duration(milliseconds: 200));
      }
    }
  }

  @override
  void dispose() {
    for (var controller in _controllers) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(widget.dotCount, (index) {
        return AnimatedBuilder(
          animation: _animations[index],
          builder: (context, child) {
            return Container(
              margin: EdgeInsets.symmetric(horizontal: 2.w),
              child: Transform.scale(
                scale: _animations[index].value,
                child: Container(
                  width: widget.dotSize ?? 8.w,
                  height: widget.dotSize ?? 8.h,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: widget.color ?? primaryColor,
                  ),
                ),
              ),
            );
          },
        );
      }),
    );
  }
}