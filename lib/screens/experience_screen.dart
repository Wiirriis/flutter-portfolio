import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../core/theme/colors.dart';
import '../core/theme/text_styles.dart';
import '../widgets/custom_appbar.dart';

class ExperienceScreen extends StatelessWidget {
  const ExperienceScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: const CustomAppBar(
        title: 'Experiencia',
        showBackButton: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeaderSection(),
            SizedBox(height: 24.h),
            _buildExperienceItem(
              company: 'Bowpi Guatemala',
              position: 'Senior Full Stack Developer',
              period: 'Abril 2025 – Actualidad',
              description: 'Bowpi es una plataforma de Lending as a Service (LaaS) que digitaliza y optimiza todo el proceso de otorgamiento de créditos mediante un modelo modular configurable.',
              achievements: [
                'Desarrollo y mantenimiento de portales web con Angular y Java Spring Boot',
                'Implementación de despliegues con Docker y Jenkins',
                'Integración de agentes de IA para automatización de procesos',
                'Automatización de flujos con n8n, reduciendo tiempos operativos en 20%'
              ],
              technologies: ['Angular', 'Java Spring Boot', 'Docker', 'REST APIs', 'Git'],
              isLatest: true,
            ),
            SizedBox(height: 24.h),
            _buildExperienceItem(
              company: 'Popoyan S.A. Guatemala',
              position: 'Senior Mobile Applications Developer',
              period: 'Jun 2022 – Ene 2025',
              description: 'Aplicación móvil Android Agricontrol+, utilizada por más de 500 técnicos agrícolas a nivel nacional, para la gestión de recursos y asistencia técnica.',
              achievements: [
                'Desarrollé app móvil para registro y seguimiento de actividades agrícolas',
                'Reduje el tiempo de registro de datos en campo en un 30%',
                'Integración con PostgreSQL y almacenamiento offline',
                'Participé en desarrollo de Agriconecta, app para cadena de valor agrícola'
              ],
              technologies: ['Flutter', 'Dart', 'Provider', 'BloC', 'PostgreSQL', 'Hive'],
            ),
            SizedBox(height: 24.h),
            _buildExperienceItem(
              company: 'Ministerio Público de Guatemala',
              position: 'Frontend Developer',
              period: 'Feb 2020 – Sep 2021',
              description: 'Sistema web ASTREA para gestión de expedientes y denuncias, utilizado por más de 5,000 funcionarios a nivel nacional.',
              achievements: [
                'Implementé biblioteca de componentes React que redujo 30% el tiempo de desarrollo',
                'Desarrollé interfaces reactivas con Material-UI y TailwindCSS',
                'Integración con SQLServer y MongoDB para grandes volúmenes de datos'
              ],
              technologies: ['React', 'JavaScript ES6', 'Material-UI', 'TailwindCSS', 'Redux'],
            ),
            SizedBox(height: 24.h),
            _buildExperienceItem(
              company: 'Procuraduría General de la Nación',
              position: 'Full Stack Developer',
              period: 'Sep 2019 – Ene 2020',
              description: 'Módulo PNA del sistema E-SIGE para protección de la niñez y adolescencia.',
              achievements: [
                'Mejoré el rendimiento del módulo en un 25% optimizando código C#',
                'Capacitación a más de 200 colaboradores',
                'Desarrollo de nuevas funcionalidades según feedback de usuarios'
              ],
              technologies: ['C#', 'ASP.NET', 'SQLServer'],
            ),
            SizedBox(height: 32.h),
            _buildSummarySection(),
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
            Icons.work_history,
            size: 48.w,
            color: Colors.white,
          ),
          SizedBox(height: 16.h),
          Text(
            'Trayectoria Profesional',
            style: TextStyle(
              fontSize: 24.sp,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 8.h),
          Text(
            'Más de 5 años transformando procesos organizacionales con tecnología',
            style: TextStyle(
              fontSize: 16.sp,
              color: Colors.white.withOpacity(0.9),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildExperienceItem({
    required String company,
    required String position,
    required String period,
    required String description,
    required List<String> achievements,
    required List<String> technologies,
    bool isLatest = false,
  }) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.circular(16.r),
        border: isLatest ? Border.all(color: primaryColor, width: 2) : null,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            offset: Offset(0, 4.h),
            blurRadius: 12.r,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header con empresa y posición
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(20.w),
            decoration: BoxDecoration(
              color: isLatest ? primaryColor.withOpacity(0.05) : Colors.transparent,
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
                      padding: EdgeInsets.all(8.w),
                      decoration: BoxDecoration(
                        color: primaryColor.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                      child: Icon(
                        Icons.business,
                        color: primaryColor,
                        size: 20.w,
                      ),
                    ),
                    SizedBox(width: 12.w),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            company,
                            style: subtitle1.copyWith(
                              fontWeight: FontWeight.bold,
                              color: isLatest ? primaryColor : textPrimary,
                            ),
                          ),
                          Text(
                            position,
                            style: body1.copyWith(
                              color: textSecondary,
                            ),
                          ),
                        ],
                      ),
                    ),
                    if (isLatest)
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                        decoration: BoxDecoration(
                          color: primaryColor,
                          borderRadius: BorderRadius.circular(12.r),
                        ),
                        child: Text(
                          'ACTUAL',
                          style: TextStyle(
                            fontSize: 10.sp,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                  ],
                ),
                SizedBox(height: 12.h),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
                  decoration: BoxDecoration(
                    color: backgroundColor,
                    borderRadius: BorderRadius.circular(16.r),
                  ),
                  child: Text(
                    period,
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: textSecondary,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ),
          // Contenido
          Padding(
            padding: EdgeInsets.all(20.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  description,
                  style: body2.copyWith(
                    fontStyle: FontStyle.italic,
                    color: textSecondary,
                  ),
                ),
                SizedBox(height: 16.h),
                Text(
                  'Logros destacados:',
                  style: subtitle2.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8.h),
                ...achievements.map((achievement) => Padding(
                  padding: EdgeInsets.only(bottom: 8.h),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 6.h, right: 8.w),
                        width: 6.w,
                        height: 6.h,
                        decoration: const BoxDecoration(
                          color: primaryColor,
                          shape: BoxShape.circle,
                        ),
                      ),
                      Expanded(
                        child: Text(
                          achievement,
                          style: body2,
                        ),
                      ),
                    ],
                  ),
                )),
                SizedBox(height: 16.h),
                Text(
                  'Stack tecnológico:',
                  style: subtitle2.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8.h),
                Wrap(
                  spacing: 8.w,
                  runSpacing: 8.h,
                  children: technologies.map((tech) => Container(
                    padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
                    decoration: BoxDecoration(
                      color: primaryColor.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(16.r),
                      border: Border.all(
                        color: primaryColor.withOpacity(0.3),
                        width: 1,
                      ),
                    ),
                    child: Text(
                      tech,
                      style: TextStyle(
                        fontSize: 12.sp,
                        color: primaryColor,
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

  Widget _buildSummarySection() {
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
          Row(
            children: [
              Icon(
                Icons.insights,
                color: primaryColor,
                size: 24.w,
              ),
              SizedBox(width: 8.w),
              Text(
                'Impacto y Alcance',
                style: subtitle1.copyWith(
                  fontWeight: FontWeight.bold,
                  color: primaryColor,
                ),
              ),
            ],
          ),
          SizedBox(height: 16.h),
          Row(
            children: [
              Expanded(
                child: _buildImpactCard(
                  icon: Icons.people,
                  value: '5000+',
                  label: 'Usuarios\nImpactados',
                ),
              ),
              SizedBox(width: 16.w),
              Expanded(
                child: _buildImpactCard(
                  icon: Icons.trending_up,
                  value: '30%',
                  label: 'Mejora en\nEficiencia',
                ),
              ),
              SizedBox(width: 16.w),
              Expanded(
                child: _buildImpactCard(
                  icon: Icons.public,
                  value: '3',
                  label: 'Sectores\nAtendidos',
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildImpactCard({
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
}