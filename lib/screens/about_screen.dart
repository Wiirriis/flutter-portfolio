import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../core/theme/colors.dart';
import '../core/theme/text_styles.dart';
import '../widgets/custom_appbar.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: const CustomAppBar(title: 'Sobre mí'),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildProfileSection(),
            SizedBox(height: 32.h),
            _buildInfoSection(),
            SizedBox(height: 32.h),
            _buildExperienceSection(),
            SizedBox(height: 32.h),
            _buildTechStackSection(),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileSection() {
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
        children: [
          // TODO: Agregar fotografía personal aquí
          // Implementar funcionalidad para cargar y mostrar imagen de perfil
          Container(
            width: 100.w,
            height: 100.h,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.2),
              shape: BoxShape.circle,
              border: Border.all(
                color: Colors.white,
                width: 3,
              ),
            ),
            child: Icon(
              Icons.person,
              size: 50.w,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 16.h),
          Text(
            'César Augusto Polanco',
            style: TextStyle(
              fontSize: 26.sp,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 8.h),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.2),
              borderRadius: BorderRadius.circular(20.r),
            ),
            child: Text(
              'Senior Software Developer',
              style: TextStyle(
                fontSize: 16.sp,
                color: Colors.white,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Información Profesional',
          style: title2,
        ),
        SizedBox(height: 16.h),
        _buildInfoCard(
          icon: Icons.school_outlined,
          title: 'Educación',
          description: 'Maestría en Seguridad Informática (2023)\nIngeniería en Sistemas (2021)\nUniversidad Mariano Gálvez',
        ),
        SizedBox(height: 16.h),
        _buildInfoCard(
          icon: Icons.work_outline,
          title: 'Experiencia',
          description: 'Más de 5 años desarrollando aplicaciones móviles\ny sistemas de gestión de alto impacto\nSectores: Fintech, Agrícola, Gubernamental',
        ),
        SizedBox(height: 16.h),
        _buildInfoCard(
          icon: Icons.code_outlined,
          title: 'Especialización',
          description: 'Flutter & Mobile Development\nFull Stack (Angular, React, Java Spring)\nLending as a Service (LaaS)\nDevOps (Docker, Jenkins)',
        ),
      ],
    );
  }

  Widget _buildInfoCard({
    required IconData icon,
    required String title,
    required String description,
  }) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            offset: Offset(0, 2.h),
            blurRadius: 8.r,
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 48.w,
            height: 48.h,
            decoration: BoxDecoration(
              color: primaryColor.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: Icon(
              icon,
              size: 24.w,
              color: primaryColor,
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
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8.h),
                Text(
                  description,
                  style: body2,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildExperienceSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Experiencia Destacada',
          style: title2,
        ),
        SizedBox(height: 16.h),
        Container(
          width: double.infinity,
          padding: EdgeInsets.all(20.w),
          decoration: BoxDecoration(
            color: cardColor,
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    width: 12.w,
                    height: 12.h,
                    decoration: const BoxDecoration(
                      color: primaryColor,
                      shape: BoxShape.circle,
                    ),
                  ),
                  SizedBox(width: 12.w),
                  Text(
                    'Senior Software Developer',
                    style: subtitle1.copyWith(
                      fontWeight: FontWeight.bold,
                      color: primaryColor,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 12.h),
              Padding(
                padding: EdgeInsets.only(left: 24.w),
                child: Text(
                  'Especializado en Flutter y tecnologías frontend/backend para '
                  'soluciones escalables. Historial comprobado liderando proyectos que han '
                  'transformado procesos organizacionales con alcance nacional. '
                  'Reconocido por versatilidad y capacidad de aprendizaje.',
                  style: body2,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildTechStackSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Stack Técnico',
          style: title2,
        ),
        SizedBox(height: 16.h),
        Wrap(
          spacing: 12.w,
          runSpacing: 12.h,
          children: [
            // Mobile
            _buildTechChip('Flutter', Icons.phone_android),
            _buildTechChip('Dart', Icons.code),
            _buildTechChip('Provider', Icons.architecture),
            _buildTechChip('BloC', Icons.account_tree),
            // Frontend
            _buildTechChip('React', Icons.web),
            _buildTechChip('Angular', Icons.web_asset),
            _buildTechChip('JavaScript', Icons.javascript),
            _buildTechChip('TailwindCSS', Icons.style),
            // Backend
            _buildTechChip('Java Spring', Icons.storage),
            _buildTechChip('C# ASP.NET', Icons.code_outlined),
            _buildTechChip('PostgreSQL', Icons.storage),
            _buildTechChip('MongoDB', Icons.storage_outlined),
            // DevOps
            _buildTechChip('Docker', Icons.inventory_2_outlined),
            _buildTechChip('Jenkins', Icons.build),
            _buildTechChip('Git', Icons.source),
          ],
        ),
        SizedBox(height: 24.h),
        Container(
          width: double.infinity,
          padding: EdgeInsets.all(20.w),
          decoration: BoxDecoration(
            color: primaryColor.withOpacity(0.05),
            borderRadius: BorderRadius.circular(12.r),
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
                    Icons.lightbulb_outline,
                    color: primaryColor,
                    size: 24.w,
                  ),
                  SizedBox(width: 8.w),
                  Text(
                    'Filosofía de Desarrollo',
                    style: subtitle1.copyWith(
                      fontWeight: FontWeight.bold,
                      color: primaryColor,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 12.h),
              Text(
                'Enfoque en desarrollo de soluciones escalables que transforman '
                'procesos organizacionales. Especialista en aplicaciones móviles '
                'para entornos de baja conectividad y sistemas de gestión '
                'de alto volumen de datos. Liderazgo técnico y mentoría.',
                style: body2.copyWith(
                  color: textSecondary,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildTechChip(String label, IconData icon) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.circular(25.r),
        border: Border.all(
          color: primaryColor.withOpacity(0.2),
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            offset: Offset(0, 2.h),
            blurRadius: 4.r,
          ),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            size: 18.w,
            color: primaryColor,
          ),
          SizedBox(width: 8.w),
          Text(
            label,
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w500,
              color: primaryColor,
            ),
          ),
        ],
      ),
    );
  }
}