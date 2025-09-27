import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../core/theme/colors.dart';
import '../core/theme/text_styles.dart';
import '../widgets/custom_appbar.dart';

class SkillsScreen extends StatelessWidget {
  const SkillsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: const CustomAppBar(
        title: 'Habilidades',
        showBackButton: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeaderSection(),
            SizedBox(height: 24.h),
            _buildSkillCategory(
              title: 'Desarrollo Mobile',
              icon: Icons.phone_android,
              skills: [
                {'name': 'Flutter', 'level': 95, 'years': '3+ años'},
                {'name': 'Dart', 'level': 95, 'years': '3+ años'},
                {'name': 'Provider', 'level': 90, 'years': '2+ años'},
                {'name': 'BloC Pattern', 'level': 90, 'years': '2+ años'},
                {'name': 'Hive (Local DB)', 'level': 85, 'years': '2+ años'},
              ],
            ),
            SizedBox(height: 24.h),
            _buildSkillCategory(
              title: 'Frontend Development',
              icon: Icons.web,
              skills: [
                {'name': 'React', 'level': 90, 'years': '2+ años'},
                {'name': 'Angular', 'level': 88, 'years': '1+ año'},
                {'name': 'JavaScript ES6+', 'level': 90, 'years': '4+ años'},
                {'name': 'TypeScript', 'level': 85, 'years': '2+ años'},
                {'name': 'Material-UI', 'level': 85, 'years': '2+ años'},
                {'name': 'TailwindCSS', 'level': 90, 'years': '2+ años'},
                {'name': 'Redux/State Management', 'level': 80, 'years': '2+ años'},
              ],
            ),
            SizedBox(height: 24.h),
            _buildSkillCategory(
              title: 'Backend Development',
              icon: Icons.storage,
              skills: [
                {'name': 'Java Spring Boot', 'level': 85, 'years': '1+ año'},
                {'name': 'C# ASP.NET', 'level': 80, 'years': '2+ años'},
                {'name': 'RESTful APIs', 'level': 90, 'years': '4+ años'},
                {'name': 'GraphQL', 'level': 70, 'years': '1+ año'},
              ],
            ),
            SizedBox(height: 24.h),
            _buildSkillCategory(
              title: 'Bases de Datos',
              icon: Icons.storage,
              skills: [
                {'name': 'PostgreSQL', 'level': 90, 'years': '3+ años'},
                {'name': 'SQL Server', 'level': 85, 'years': '3+ años'},
                {'name': 'MongoDB', 'level': 80, 'years': '2+ años'},
                {'name': 'Hive (NoSQL)', 'level': 85, 'years': '2+ años'},
              ],
            ),
            SizedBox(height: 24.h),
            _buildSkillCategory(
              title: 'DevOps & Herramientas',
              icon: Icons.build,
              skills: [
                {'name': 'Docker', 'level': 80, 'years': '1+ año'},
                {'name': 'Jenkins', 'level': 75, 'years': '1+ año'},
                {'name': 'Git', 'level': 95, 'years': '5+ años'},
                {'name': 'Jira', 'level': 85, 'years': '3+ años'},
                {'name': 'Bitbucket', 'level': 90, 'years': '2+ años'},
                {'name': 'GitHub/GitLab', 'level': 90, 'years': '3+ años'},
                {'name': 'Figma', 'level': 80, 'years': '2+ años'},
                {'name': 'Postman', 'level': 90, 'years': '3+ años'},
              ],
            ),
            SizedBox(height: 24.h),
            _buildSkillCategory(
              title: 'Especializaciones',
              icon: Icons.star,
              skills: [
                {'name': 'Seguridad Informática', 'level': 90, 'years': 'Maestría'},
                {'name': 'Arquitectura de Software', 'level': 85, 'years': '3+ años'},
                {'name': 'Lending as a Service (LaaS)', 'level': 80, 'years': '1+ año'},
                {'name': 'Automatización de Procesos', 'level': 85, 'years': '2+ años'},
                {'name': 'Aplicaciones Offline-First', 'level': 90, 'years': '2+ años'},
              ],
            ),
            SizedBox(height: 32.h),
            _buildSoftSkillsSection(context),
            SizedBox(height: 24.h),
            _buildLanguagesSection(),
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
            Icons.code,
            size: 48.w,
            color: Colors.white,
          ),
          SizedBox(height: 16.h),
          Text(
            'Stack Tecnológico',
            style: TextStyle(
              fontSize: 24.sp,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 8.h),
          Text(
            'Tecnologías y herramientas con las que trabajo profesionalmente',
            style: TextStyle(
              fontSize: 16.sp,
              color: Colors.white.withOpacity(0.9),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSkillCategory({
    required String title,
    required IconData icon,
    required List<Map<String, dynamic>> skills,
  }) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.circular(16.r),
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
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(20.w),
            decoration: BoxDecoration(
              color: primaryColor.withOpacity(0.05),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16.r),
                topRight: Radius.circular(16.r),
              ),
            ),
            child: Row(
              children: [
                Container(
                  padding: EdgeInsets.all(8.w),
                  decoration: BoxDecoration(
                    color: primaryColor.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  child: Icon(
                    icon,
                    color: primaryColor,
                    size: 20.w,
                  ),
                ),
                SizedBox(width: 12.w),
                Text(
                  title,
                  style: subtitle1.copyWith(
                    fontWeight: FontWeight.bold,
                    color: primaryColor,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.all(20.w),
            child: Column(
              children: skills.map((skill) => _buildSkillItem(
                name: skill['name'] as String,
                level: skill['level'] as int,
                experience: skill['years'] as String,
              )).toList(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSkillItem({
    required String name,
    required int level,
    required String experience,
  }) {
    return Padding(
      padding: EdgeInsets.only(bottom: 16.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                name,
                style: body1.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 2.h),
                decoration: BoxDecoration(
                  color: backgroundColor,
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: Text(
                  experience,
                  style: TextStyle(
                    fontSize: 11.sp,
                    color: textSecondary,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 8.h),
          Row(
            children: [
              Expanded(
                child: Container(
                  height: 6.h,
                  decoration: BoxDecoration(
                    color: backgroundColor,
                    borderRadius: BorderRadius.circular(3.r),
                  ),
                  child: FractionallySizedBox(
                    alignment: Alignment.centerLeft,
                    widthFactor: level / 100,
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            primaryColor,
                            level >= 90 ? const Color(0xFF4CAF50) :
                            level >= 80 ? primaryColor :
                            const Color(0xFFFFC107),
                          ],
                        ),
                        borderRadius: BorderRadius.circular(3.r),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(width: 8.w),
              Text(
                '$level%',
                style: TextStyle(
                  fontSize: 12.sp,
                  color: textSecondary,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSoftSkillsSection(BuildContext context) {
    final softSkills = [
      'Liderazgo Técnico',
      'Resolución de Problemas',
      'Trabajo en Equipo',
      'Comunicación Efectiva',
      'Adaptabilidad',
      'Mentoría',
      'Pensamiento Analítico',
      'Gestión de Proyectos',
    ];

    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(20.w),
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
                Icons.people,
                color: primaryColor,
                size: 24.w,
              ),
              SizedBox(width: 8.w),
              Text(
                'Habilidades Blandas',
                style: subtitle1.copyWith(
                  fontWeight: FontWeight.bold,
                  color: primaryColor,
                ),
              ),
            ],
          ),
          SizedBox(height: 16.h),
          Wrap(
            spacing: 12.w,
            runSpacing: 12.h,
            children: softSkills.map((skill) => Container(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(25.r),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    offset: Offset(0, 2.h),
                    blurRadius: 4.r,
                  ),
                ],
              ),
              child: Text(
                skill,
                style: TextStyle(
                  fontSize: getResponsiveFontSize(14, context).sp,
                  color: primaryColor,
                  fontWeight: FontWeight.w500,
                ),
              ),
            )).toList(),
          ),
        ],
      ),
    );
  }

  Widget _buildLanguagesSection() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.circular(16.r),
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
          Row(
            children: [
              Icon(
                Icons.language,
                color: primaryColor,
                size: 24.w,
              ),
              SizedBox(width: 8.w),
              Text(
                'Idiomas',
                style: subtitle1.copyWith(
                  fontWeight: FontWeight.bold,
                  color: primaryColor,
                ),
              ),
            ],
          ),
          SizedBox(height: 20.h),
          Row(
            children: [
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(16.w),
                  decoration: BoxDecoration(
                    color: primaryColor.withOpacity(0.05),
                    borderRadius: BorderRadius.circular(12.r),
                    border: Border.all(
                      color: primaryColor.withOpacity(0.2),
                      width: 1,
                    ),
                  ),
                  child: Column(
                    children: [
                      Text(
                        '🇬🇹',
                        style: TextStyle(fontSize: 24.sp),
                      ),
                      SizedBox(height: 8.h),
                      Text(
                        'Español',
                        style: subtitle2.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'Nativo',
                        style: TextStyle(
                          fontSize: 12.sp,
                          color: textSecondary,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(width: 16.w),
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(16.w),
                  decoration: BoxDecoration(
                    color: backgroundColor,
                    borderRadius: BorderRadius.circular(12.r),
                    border: Border.all(
                      color: dividerColor,
                      width: 1,
                    ),
                  ),
                  child: Column(
                    children: [
                      Text(
                        '🇺🇸',
                        style: TextStyle(fontSize: 24.sp),
                      ),
                      SizedBox(height: 8.h),
                      Text(
                        'Inglés',
                        style: subtitle2.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'B1 Intermedio',
                        style: TextStyle(
                          fontSize: 12.sp,
                          color: textSecondary,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}