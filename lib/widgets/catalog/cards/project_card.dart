import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/theme/colors.dart';
import '../../../core/theme/text_styles.dart';

/// Tarjeta para mostrar proyectos con imagen y detalles
class ProjectCard extends StatelessWidget {
  /// Título del proyecto
  final String title;

  /// Descripción del proyecto
  final String description;

  /// URL o path de la imagen
  final String? imageUrl;

  /// Widget de imagen personalizado
  final Widget? imageWidget;

  /// Lista de tecnologías usadas
  final List<String> technologies;

  /// Estado del proyecto
  final ProjectStatus status;

  /// Función callback cuando se toca la tarjeta
  final VoidCallback? onTap;

  /// Función callback para el botón de acción
  final VoidCallback? onActionPressed;

  /// Texto del botón de acción
  final String actionText;

  /// Si muestra fecha
  final String? date;

  const ProjectCard({
    Key? key,
    required this.title,
    required this.description,
    this.imageUrl,
    this.imageWidget,
    this.technologies = const [],
    this.status = ProjectStatus.active,
    this.onTap,
    this.onActionPressed,
    this.actionText = 'Ver más',
    this.date,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 16.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Imagen del proyecto
              if (imageWidget != null || imageUrl != null)
                Container(
                  height: 200.h,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(16.r),
                    ),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(16.r),
                    ),
                    child: imageWidget ??
                        Container(
                          color: Colors.grey.shade200,
                          child: Icon(
                            Icons.image,
                            size: 48.w,
                            color: Colors.grey.shade400,
                          ),
                        ),
                  ),
                ),

              // Contenido de la tarjeta
              Padding(
                padding: EdgeInsets.all(20.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Header con título y estado
                    Row(
                      children: [
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
                        _buildStatusChip(),
                      ],
                    ),

                    if (date != null) ...[
                      SizedBox(height: 4.h),
                      Text(
                        date!,
                        style: caption.copyWith(color: textSecondary),
                      ),
                    ],

                    SizedBox(height: 12.h),

                    // Descripción
                    Text(
                      description,
                      style: body2.copyWith(color: textSecondary),
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),

                    SizedBox(height: 16.h),

                    // Tecnologías
                    if (technologies.isNotEmpty) ...[
                      Wrap(
                        spacing: 8.w,
                        runSpacing: 8.h,
                        children: technologies.map((tech) => _buildTechChip(tech)).toList(),
                      ),
                      SizedBox(height: 16.h),
                    ],

                    // Botón de acción
                    if (onActionPressed != null)
                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          onPressed: onActionPressed,
                          style: TextButton.styleFrom(
                            foregroundColor: primaryColor,
                            padding: EdgeInsets.symmetric(
                              horizontal: 16.w,
                              vertical: 8.h,
                            ),
                          ),
                          child: Text(actionText),
                        ),
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

  Widget _buildStatusChip() {
    Color chipColor;
    String statusText;

    switch (status) {
      case ProjectStatus.active:
        chipColor = successColor;
        statusText = 'Activo';
        break;
      case ProjectStatus.completed:
        chipColor = primaryColor;
        statusText = 'Completado';
        break;
      case ProjectStatus.inProgress:
        chipColor = warningColor;
        statusText = 'En progreso';
        break;
      case ProjectStatus.paused:
        chipColor = Colors.grey;
        statusText = 'Pausado';
        break;
    }

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
      decoration: BoxDecoration(
        color: chipColor.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Text(
        statusText,
        style: caption.copyWith(
          color: chipColor,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  Widget _buildTechChip(String tech) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
      decoration: BoxDecoration(
        color: primaryColor.withOpacity(0.1),
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Text(
        tech,
        style: caption.copyWith(
          color: primaryColor,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}

/// Tarjeta de proyecto compacta para listas
class ProjectCardCompact extends StatelessWidget {
  final String title;
  final String subtitle;
  final ProjectStatus status;
  final List<String> technologies;
  final VoidCallback? onTap;
  final Widget? leading;

  const ProjectCardCompact({
    Key? key,
    required this.title,
    required this.subtitle,
    this.status = ProjectStatus.active,
    this.technologies = const [],
    this.onTap,
    this.leading,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 8.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(12.r),
          onTap: onTap,
          child: Padding(
            padding: EdgeInsets.all(16.w),
            child: Row(
              children: [
                if (leading != null) ...[
                  leading!,
                  SizedBox(width: 12.w),
                ],
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              title,
                              style: subtitle1.copyWith(
                                color: textPrimary,
                                fontWeight: FontWeight.w600,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          _buildStatusDot(),
                        ],
                      ),
                      SizedBox(height: 4.h),
                      Text(
                        subtitle,
                        style: caption.copyWith(color: textSecondary),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                      ),
                      if (technologies.isNotEmpty) ...[
                        SizedBox(height: 8.h),
                        Wrap(
                          spacing: 4.w,
                          children: technologies.take(3).map((tech) {
                            return Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: 6.w,
                                vertical: 2.h,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.grey.shade100,
                                borderRadius: BorderRadius.circular(4.r),
                              ),
                              child: Text(
                                tech,
                                style: TextStyle(
                                  fontSize: 10.sp,
                                  color: textSecondary,
                                ),
                              ),
                            );
                          }).toList(),
                        ),
                      ],
                    ],
                  ),
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  size: 16.w,
                  color: Colors.grey.shade400,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildStatusDot() {
    Color color;
    switch (status) {
      case ProjectStatus.active:
        color = successColor;
        break;
      case ProjectStatus.completed:
        color = primaryColor;
        break;
      case ProjectStatus.inProgress:
        color = warningColor;
        break;
      case ProjectStatus.paused:
        color = Colors.grey;
        break;
    }

    return Container(
      width: 8.w,
      height: 8.h,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color,
      ),
    );
  }
}

/// Enum para estado de proyectos
enum ProjectStatus { active, completed, inProgress, paused }