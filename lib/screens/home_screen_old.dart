import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../core/theme/colors.dart';
import '../core/theme/text_styles.dart';
import '../widgets/custom_appbar.dart';
import '../widgets/custom_drawer.dart';
import '../widgets/action_button_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isWeb = kIsWeb;
    final padding = isWeb ? 20.0 : (screenWidth < 768 ? 16.0 : 20.0);
    final spacing = isWeb ? 32.0 : (screenWidth < 768 ? 24.0 : 32.0);

    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: const CustomAppBar(),
      drawer: const CustomDrawer(
        userName: 'César Polanco',
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(padding),
        child: Center(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: kIsWeb ? 1200 : double.infinity,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildWelcomeSection(context),
                SizedBox(height: spacing),
                _buildStatsCards(context),
                SizedBox(height: spacing),
                _buildActionButtons(context),
                SizedBox(height: spacing),
                _buildRecentProjects(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildWelcomeSection() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(20.w),
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
          Text(
            '¡Bienvenido!',
            style: title2White,
          ),
          SizedBox(height: 8.h),
          Text(
            'Explora mi portafolio de desarrollo',
            style: TextStyle(
              fontSize: kIsWeb ? 18.sp : 16.sp,
              color: Colors.white.withOpacity(0.9),
            ),
          ),
          SizedBox(height: 16.h),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.2),
              borderRadius: BorderRadius.circular(20.r),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.code,
                  size: kIsWeb ? 20.w : 16.w,
                  color: Colors.white,
                ),
                SizedBox(width: 8.w),
                Text(
                  'Senior Software Developer',
                  style: TextStyle(
                    fontSize: kIsWeb ? 16.sp : 14.sp,
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatsCards() {
    return Row(
      children: [
        Expanded(
          child: _buildStatCard(
            icon: Icons.work_outline,
            value: '8+',
            label: 'Proyectos',
          ),
        ),
        SizedBox(width: 16.w),
        Expanded(
          child: _buildStatCard(
            icon: Icons.timeline,
            value: '5+',
            label: 'Años exp.',
          ),
        ),
        SizedBox(width: 16.w),
        Expanded(
          child: _buildStatCard(
            icon: Icons.people_outline,
            value: '5K+',
            label: 'Usuarios',
          ),
        ),
      ],
    );
  }

  Widget _buildStatCard({
    required IconData icon,
    required String value,
    required String label,
  }) {
    return Container(
      padding: EdgeInsets.all(16.w),
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
        children: [
          Icon(
            icon,
            size: kIsWeb ? 32.w : 24.w,
            color: primaryColor,
          ),
          SizedBox(height: 8.h),
          Text(
            value,
            style: title2.copyWith(color: primaryColor),
          ),
          Text(
            label,
            style: caption,
          ),
        ],
      ),
    );
  }

  Widget _buildActionButtons(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Navegación rápida',
          style: title2,
        ),
        SizedBox(height: 16.h),
        kIsWeb
            ? _buildWebActionGrid(context)
            : _buildMobileActionRows(context),
      ],
    );
  }

  Widget _buildWebActionGrid(BuildContext context) {
    return GridView.count(
      crossAxisCount: 3,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      childAspectRatio: 1.2,
      crossAxisSpacing: 16.w,
      mainAxisSpacing: 16.h,
      children: [
        ActionButtonCard(
          title: 'Sobre mí',
          icon: Icons.person_outline,
          onTap: () => Navigator.pushNamed(context, '/about'),
        ),
        ActionButtonCard(
          title: 'Proyectos',
          icon: Icons.work_outline,
          onTap: () => Navigator.pushNamed(context, '/projects'),
        ),
        ActionButtonCard(
          title: 'Contacto',
          icon: Icons.mail_outline,
          onTap: () => Navigator.pushNamed(context, '/contact'),
        ),
        ActionButtonCard(
          title: 'Habilidades',
          icon: Icons.code_outlined,
          onTap: () => Navigator.pushNamed(context, '/skills'),
        ),
        ActionButtonCard(
          title: 'Catalogo',
          icon: Icons.timeline_outlined,
          onTap: () => Navigator.pushNamed(context, '/experience'),
        ),
        ActionButtonCard(
          title: 'CV/Resume',
          icon: Icons.description_outlined,
          onTap: () => Navigator.pushNamed(context, '/cv'),
        ),
      ],
    );
  }

  Widget _buildMobileActionRows(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            ActionButtonCard(
              title: 'Sobre mí',
              icon: Icons.person_outline,
              onTap: () => Navigator.pushNamed(context, '/about'),
            ),
            ActionButtonCard(
              title: 'Proyectos',
              icon: Icons.work_outline,
              onTap: () => Navigator.pushNamed(context, '/projects'),
            ),
            ActionButtonCard(
              title: 'Contacto',
              icon: Icons.mail_outline,
              onTap: () => Navigator.pushNamed(context, '/contact'),
            ),
          ],
        ),
        SizedBox(height: 16.h),
        Row(
          children: [
            ActionButtonCard(
              title: 'Habilidades',
              icon: Icons.code_outlined,
              onTap: () => Navigator.pushNamed(context, '/skills'),
            ),
            ActionButtonCard(
              title: 'Catalogo',
              icon: Icons.timeline_outlined,
              onTap: () => Navigator.pushNamed(context, '/experience'),
            ),
            ActionButtonCard(
              title: 'CV/Resume',
              icon: Icons.description_outlined,
              onTap: () => Navigator.pushNamed(context, '/cv'),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildRecentProjects(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Proyectos destacados',
              style: title2,
            ),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, '/projects');
              },
              child: Text(
                'Ver todos',
                style: TextStyle(
                  fontSize: kIsWeb ? 16.sp : 14.sp,
                  color: primaryColor,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 16.h),
        _buildProjectCard(
          title: 'Bowpi - Fintech',
          description: 'Plataforma de Lending as a Service para créditos digitales',
          tech: 'Angular • Java Spring Boot • Docker',
        ),
        SizedBox(height: 12.h),
        _buildProjectCard(
          title: 'Agricontrol+',
          description: 'App para 500+ técnicos agrícolas a nivel nacional',
          tech: 'Flutter • PostgreSQL • Hive',
        ),
        SizedBox(height: 12.h),
        _buildProjectCard(
          title: 'Sistema ASTREA',
          description: 'Gestión de expedientes para 5000+ funcionarios',
          tech: 'React • Material-UI • MongoDB',
        ),
      ],
    );
  }

  Widget _buildProjectCard({
    required String title,
    required String description,
    required String tech,
  }) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(16.w),
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
                  width: 40.w,
                  height: 40.h,
                  decoration: BoxDecoration(
                    color: primaryColor.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  child: Icon(
                    Icons.smartphone,
                    size: kIsWeb ? 28.w : 20.w,
                    color: primaryColor,
                  ),
                ),
                SizedBox(width: 12.w),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: subtitle1,
                      ),
                      SizedBox(height: 4.h),
                      Text(
                        description,
                        style: body2,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
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
              tech,
              style: TextStyle(
                fontSize: kIsWeb ? 14.sp : 12.sp,
                color: textSecondary,
              ),
            ),
          ),
        ],
      ),
    );
  }
}