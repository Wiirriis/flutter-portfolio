import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../core/theme/colors.dart';
import '../core/theme/text_styles.dart';
import '../widgets/custom_appbar.dart';

class ProjectsScreen extends StatelessWidget {
  const ProjectsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: const CustomAppBar(
        title: 'Proyectos',
        showBackButton: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeaderSection(),
            SizedBox(height: 24.h),
            _buildProjectCard(
              title: 'Bowpi - Lending as a Service (Fintech)',
              subtitle: 'Plataforma Fintech',
              description: 'Plataforma de Lending as a Service (LaaS) que digitaliza y optimiza todo el proceso de otorgamiento de créditos mediante un modelo modular configurable.',
              impact: 'Automatización del 100% del proceso de créditos digitales',
              technologies: ['Angular', 'Java Spring Boot', 'Docker', 'Jenkins', 'REST APIs'],
              achievements: [
                'Desarrollo de portales web escalables',
                'Implementación de CI/CD con Docker y Jenkins',
                'Integración de agentes de IA para automatización',
                'Reducción de 20% en tiempos operativos con n8n'
              ],
              status: 'En desarrollo',
              period: '2025',
              featured: true,
            ),
            SizedBox(height: 20.h),
            _buildProjectCard(
              title: 'Agricontrol+',
              subtitle: 'Aplicación Móvil Agrícola',
              description: 'Aplicación móvil Android para gestión de recursos y asistencia técnica, utilizada por más de 500 técnicos agrícolas a nivel nacional.',
              impact: '500+ técnicos agrícolas impactados nacionalmente',
              technologies: ['Flutter', 'Dart', 'Provider', 'BloC', 'PostgreSQL', 'Hive'],
              achievements: [
                'Desarrollo de app para registro de actividades agrícolas',
                'Reducción de 30% en tiempo de registro de datos',
                'Implementación de almacenamiento offline para baja conectividad',
                'Integración con PostgreSQL y sincronización automática'
              ],
              status: 'Desplegado',
              period: '2022-2025',
            ),
            SizedBox(height: 20.h),
            _buildProjectCard(
              title: 'Sistema ASTREA',
              subtitle: 'Sistema Gubernamental',
              description: 'Sistema web para gestión de expedientes y denuncias del Ministerio Público, utilizado por más de 5,000 funcionarios a nivel nacional.',
              impact: '5,000+ funcionarios utilizando el sistema',
              technologies: ['React', 'JavaScript ES6', 'Material-UI', 'TailwindCSS', 'Redux', 'MongoDB'],
              achievements: [
                'Biblioteca de componentes React reutilizables',
                'Reducción de 30% en tiempo de desarrollo',
                'Interfaces reactivas optimizadas para alta concurrencia',
                'Integración con SQLServer y MongoDB'
              ],
              status: 'Desplegado',
              period: '2020-2021',
            ),
            SizedBox(height: 20.h),
            _buildProjectCard(
              title: 'Agriconecta',
              subtitle: 'Plataforma de Conexión Agrícola',
              description: 'Aplicación que conecta actores de la cadena de valor agrícola, facilitando la comunicación entre productores, técnicos y compradores.',
              impact: 'Conexión de múltiples actores en la cadena agrícola',
              technologies: ['Flutter', 'Dart', 'Firebase', 'REST APIs'],
              achievements: [
                'Desarrollo de plataforma de networking agrícola',
                'Implementación de sistema de matching inteligente',
                'Integración con servicios de geolocalización',
                'Dashboard de métricas en tiempo real'
              ],
              status: 'En desarrollo',
              period: '2024-2025',
            ),
            SizedBox(height: 20.h),
            _buildProjectCard(
              title: 'Módulo PNA - E-SIGE',
              subtitle: 'Sistema de Protección Social',
              description: 'Módulo del sistema E-SIGE para protección de la niñez y adolescencia de la Procuraduría General de la Nación.',
              impact: '200+ colaboradores capacitados',
              technologies: ['C#', 'ASP.NET', 'SQLServer'],
              achievements: [
                'Mejora de 25% en rendimiento del módulo',
                'Optimización de código C# y bases de datos',
                'Capacitación masiva a usuarios finales',
                'Implementación de nuevas funcionalidades'
              ],
              status: 'Completado',
              period: '2019-2020',
            ),
            SizedBox(height: 32.h),
            _buildStatsSection(),
          ],
        ),
      ),
    );
  }

  Widget _buildHeaderSection() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(24.w),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [primaryColor, primaryDark],
        ),
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            Icons.rocket_launch,
            size: 48.w,
            color: Colors.white,
          ),
          SizedBox(height: 16.h),
          Text(
            'Proyectos Destacados',
            style: TextStyle(
              fontSize: 24.sp,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 8.h),
          Text(
            'Soluciones tecnológicas que han transformado procesos organizacionales',
            style: TextStyle(
              fontSize: 16.sp,
              color: Colors.white.withOpacity(0.9),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProjectCard({
    required String title,
    required String subtitle,
    required String description,
    required String impact,
    required List<String> technologies,
    required List<String> achievements,
    required String status,
    required String period,
    bool featured = false,
  }) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.circular(16.r),
        border: featured ? Border.all(color: primaryColor, width: 2) : null,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            offset: Offset(0, 6.h),
            blurRadius: 16.r,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(20.w),
            decoration: BoxDecoration(
              color: featured ? primaryColor.withOpacity(0.05) : Colors.transparent,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16.r),
                topRight: Radius.circular(16.r),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      padding: EdgeInsets.all(10.w),
                      decoration: BoxDecoration(
                        color: primaryColor.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                      child: Icon(
                        Icons.web,
                        color: primaryColor,
                        size: 24.w,
                      ),
                    ),
                    SizedBox(width: 12.w),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            title,
                            style: subtitle1.copyWith(
                              fontWeight: FontWeight.bold,
                              color: featured ? primaryColor : textPrimary,
                            ),
                          ),
                          Text(
                            subtitle,
                            style: TextStyle(
                              fontSize: 13.sp,
                              color: textSecondary,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                          decoration: BoxDecoration(
                            color: _getStatusColor(status).withOpacity(0.1),
                            borderRadius: BorderRadius.circular(12.r),
                          ),
                          child: Text(
                            status,
                            style: TextStyle(
                              fontSize: 10.sp,
                              color: _getStatusColor(status),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        SizedBox(height: 4.h),
                        Text(
                          period,
                          style: TextStyle(
                            fontSize: 11.sp,
                            color: textSecondary,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                if (featured) ...[
                  SizedBox(height: 12.h),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
                    decoration: BoxDecoration(
                      color: primaryColor,
                      borderRadius: BorderRadius.circular(16.r),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.star,
                          color: Colors.white,
                          size: 14.w,
                        ),
                        SizedBox(width: 4.w),
                        Text(
                          'PROYECTO DESTACADO',
                          style: TextStyle(
                            fontSize: 10.sp,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ],
            ),
          ),
          // Content
          Padding(
            padding: EdgeInsets.all(20.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  description,
                  style: body2.copyWith(
                    color: textSecondary,
                    height: 1.5,
                  ),
                ),
                SizedBox(height: 16.h),
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(16.w),
                  decoration: BoxDecoration(
                    color: primaryColor.withOpacity(0.05),
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.trending_up,
                        color: primaryColor,
                        size: 18.w,
                      ),
                      SizedBox(width: 8.w),
                      Expanded(
                        child: Text(
                          impact,
                          style: TextStyle(
                            fontSize: 13.sp,
                            color: primaryColor,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 16.h),
                Text(
                  'Logros principales:',
                  style: subtitle2.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8.h),
                ...achievements.map((achievement) => Padding(
                  padding: EdgeInsets.only(bottom: 6.h),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 6.h, right: 8.w),
                        width: 4.w,
                        height: 4.h,
                        decoration: const BoxDecoration(
                          color: primaryColor,
                          shape: BoxShape.circle,
                        ),
                      ),
                      Expanded(
                        child: Text(
                          achievement,
                          style: TextStyle(
                            fontSize: 13.sp,
                            color: textSecondary,
                            height: 1.4,
                          ),
                        ),
                      ),
                    ],
                  ),
                )),
                SizedBox(height: 16.h),
                Text(
                  'Tecnologías utilizadas:',
                  style: subtitle2.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8.h),
                Wrap(
                  spacing: 8.w,
                  runSpacing: 8.h,
                  children: technologies.map((tech) => Container(
                    padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
                    decoration: BoxDecoration(
                      color: backgroundColor,
                      borderRadius: BorderRadius.circular(14.r),
                      border: Border.all(
                        color: dividerColor,
                        width: 1,
                      ),
                    ),
                    child: Text(
                      tech,
                      style: TextStyle(
                        fontSize: 11.sp,
                        color: textSecondary,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  )).toList(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatsSection() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(24.w),
      decoration: BoxDecoration(
        color: primaryColor.withOpacity(0.05),
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(
          color: primaryColor.withOpacity(0.2),
          width: 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Resumen de Impacto',
            style: subtitle1.copyWith(
              fontWeight: FontWeight.bold,
              color: primaryColor,
            ),
          ),
          SizedBox(height: 20.h),
          Row(
            children: [
              Expanded(
                child: _buildStatItem(
                  icon: Icons.people,
                  value: '5500+',
                  label: 'Usuarios\nImpactados',
                ),
              ),
              SizedBox(width: 16.w),
              Expanded(
                child: _buildStatItem(
                  icon: Icons.business,
                  value: '3',
                  label: 'Sectores\nAtendidos',
                ),
              ),
              SizedBox(width: 16.w),
              Expanded(
                child: _buildStatItem(
                  icon: Icons.timeline,
                  value: '5+',
                  label: 'Años de\nExperiencia',
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildStatItem({
    required IconData icon,
    required String value,
    required String label,
  }) {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            offset: Offset(0, 2.h),
            blurRadius: 8.r,
          ),
        ],
      ),
      child: Column(
        children: [
          Icon(
            icon,
            size: 24.w,
            color: primaryColor,
          ),
          SizedBox(height: 8.h),
          Text(
            value,
            style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.bold,
              color: primaryColor,
            ),
          ),
          SizedBox(height: 4.h),
          Text(
            label,
            style: TextStyle(
              fontSize: 11.sp,
              color: textSecondary,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Color _getStatusColor(String status) {
    switch (status.toLowerCase()) {
      case 'en desarrollo':
        return const Color(0xFF2196F3);
      case 'desplegado':
        return const Color(0xFF4CAF50);
      case 'completado':
        return const Color(0xFF9E9E9E);
      default:
        return primaryColor;
    }
  }
}