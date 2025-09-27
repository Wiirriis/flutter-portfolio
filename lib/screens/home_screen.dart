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

  Widget _buildWelcomeSection(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isWeb = kIsWeb;
    final isMobile = screenWidth < 768;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(isWeb ? 20.0 : (isMobile ? 16.0 : 20.0)),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [primaryColor, primaryDark],
        ),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '¡Bienvenido!',
            style: title2White,
          ),
          SizedBox(height: isWeb ? 8.0 : (isMobile ? 6.0 : 8.0)),
          Text(
            'Explora mi portafolio de desarrollo',
            style: TextStyle(
              fontSize: isWeb ? 18.0 : (isMobile ? 16.0 : 18.0),
              color: Colors.white.withOpacity(0.9),
            ),
          ),
          SizedBox(height: isWeb ? 16.0 : (isMobile ? 12.0 : 16.0)),
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: isWeb ? 16.0 : (isMobile ? 12.0 : 16.0),
              vertical: isWeb ? 8.0 : (isMobile ? 6.0 : 8.0),
            ),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.2),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.code,
                  size: isWeb ? 20.0 : (isMobile ? 16.0 : 20.0),
                  color: Colors.white,
                ),
                SizedBox(width: isWeb ? 8.0 : (isMobile ? 6.0 : 8.0)),
                Text(
                  'Senior Software Developer',
                  style: TextStyle(
                    fontSize: isWeb ? 16.0 : (isMobile ? 14.0 : 16.0),
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

  Widget _buildStatsCards(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 768;
    final spacing = isMobile ? 12.0 : 16.0;

    return Row(
      children: [
        Expanded(
          child: _buildStatCard(
            context: context,
            icon: Icons.work_outline,
            value: '8+',
            label: 'Proyectos',
          ),
        ),
        SizedBox(width: spacing),
        Expanded(
          child: _buildStatCard(
            context: context,
            icon: Icons.timeline,
            value: '5+',
            label: 'Años exp.',
          ),
        ),
        SizedBox(width: spacing),
        Expanded(
          child: _buildStatCard(
            context: context,
            icon: Icons.people_outline,
            value: '5K+',
            label: 'Usuarios',
          ),
        ),
      ],
    );
  }

  Widget _buildStatCard({
    required BuildContext context,
    required IconData icon,
    required String value,
    required String label,
  }) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isWeb = kIsWeb;
    final isMobile = screenWidth < 768;

    return Container(
      padding: EdgeInsets.all(isWeb ? 16.0 : (isMobile ? 12.0 : 16.0)),
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            offset: const Offset(0, 2),
            blurRadius: 8,
          ),
        ],
      ),
      child: Column(
        children: [
          Icon(
            icon,
            size: isWeb ? 32.0 : (isMobile ? 24.0 : 32.0),
            color: primaryColor,
          ),
          SizedBox(height: isWeb ? 8.0 : (isMobile ? 6.0 : 8.0)),
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

  Widget _buildWebNavigationCard({
    required BuildContext context,
    required String title,
    required IconData icon,
    required VoidCallback onTap,
  }) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isWeb = kIsWeb;
    final isMobile = screenWidth < 768;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(isWeb ? 16.0 : (isMobile ? 12.0 : 16.0)),
        decoration: BoxDecoration(
          color: cardColor,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              offset: const Offset(0, 2),
              blurRadius: 8,
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: isWeb ? 32.0 : (isMobile ? 24.0 : 32.0),
              color: primaryColor,
            ),
            SizedBox(height: isWeb ? 8.0 : (isMobile ? 6.0 : 8.0)),
            Text(
              title,
              textAlign: TextAlign.center,
              style: subtitle1.copyWith(
                color: textPrimary,
                fontWeight: FontWeight.w500,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildActionButtons(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isWeb = kIsWeb;
    final isMobile = screenWidth < 768;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Navegación rápida',
          style: title2,
        ),
        SizedBox(height: isWeb ? 16.0 : (isMobile ? 12.0 : 16.0)),
        isWeb
            ? _buildWebActionGrid(context)
            : _buildMobileActionRows(context),
      ],
    );
  }

  Widget _buildWebActionGrid(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final spacing = screenWidth > 1200 ? 16.0 : 12.0;

    return GridView.count(
      crossAxisCount: 3,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      childAspectRatio: 1.2,
      crossAxisSpacing: spacing,
      mainAxisSpacing: spacing,
      children: [
        _buildWebNavigationCard(
          context: context,
          title: 'Sobre mí',
          icon: Icons.person_outline,
          onTap: () => Navigator.pushNamed(context, '/about'),
        ),
        _buildWebNavigationCard(
          context: context,
          title: 'Proyectos',
          icon: Icons.work_outline,
          onTap: () => Navigator.pushNamed(context, '/projects'),
        ),
        _buildWebNavigationCard(
          context: context,
          title: 'Contacto',
          icon: Icons.mail_outline,
          onTap: () => Navigator.pushNamed(context, '/contact'),
        ),
        _buildWebNavigationCard(
          context: context,
          title: 'Habilidades',
          icon: Icons.code_outlined,
          onTap: () => Navigator.pushNamed(context, '/skills'),
        ),
        _buildWebNavigationCard(
          context: context,
          title: 'Catalogo',
          icon: Icons.timeline_outlined,
          onTap: () => Navigator.pushNamed(context, '/experience'),
        ),
        _buildWebNavigationCard(
          context: context,
          title: 'CV/Resume',
          icon: Icons.description_outlined,
          onTap: () => Navigator.pushNamed(context, '/cv'),
        ),
      ],
    );
  }

  Widget _buildMobileActionRows(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final spacing = screenWidth < 600 ? 12.0 : 16.0;

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
        SizedBox(height: spacing),
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
    final screenWidth = MediaQuery.of(context).size.width;
    final isWeb = kIsWeb;
    final isMobile = screenWidth < 768;

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
                  fontSize: isWeb ? 16.0 : (isMobile ? 14.0 : 16.0),
                  color: primaryColor,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: isWeb ? 16.0 : (isMobile ? 12.0 : 16.0)),
        _buildProjectCard(
          context: context,
          title: 'Bowpi - Fintech',
          description: 'Plataforma de Lending as a Service para créditos digitales',
          tech: 'Angular • Java Spring Boot • Docker',
        ),
        SizedBox(height: isWeb ? 12.0 : (isMobile ? 8.0 : 12.0)),
        _buildProjectCard(
          context: context,
          title: 'Agricontrol+',
          description: 'App para 500+ técnicos agrícolas a nivel nacional',
          tech: 'Flutter • PostgreSQL • Hive',
        ),
        SizedBox(height: isWeb ? 12.0 : (isMobile ? 8.0 : 12.0)),
        _buildProjectCard(
          context: context,
          title: 'Sistema ASTREA',
          description: 'Gestión de expedientes para 5000+ funcionarios',
          tech: 'React • Material-UI • MongoDB',
        ),
      ],
    );
  }

  Widget _buildProjectCard({
    required BuildContext context,
    required String title,
    required String description,
    required String tech,
  }) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isWeb = kIsWeb;
    final isMobile = screenWidth < 768;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(isWeb ? 16.0 : (isMobile ? 12.0 : 16.0)),
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            offset: const Offset(0, 2),
            blurRadius: 8,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
              children: [
                Container(
                  width: isWeb ? 40.0 : (isMobile ? 32.0 : 40.0),
                  height: isWeb ? 40.0 : (isMobile ? 32.0 : 40.0),
                  decoration: BoxDecoration(
                    color: primaryColor.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Icon(
                    Icons.smartphone,
                    size: isWeb ? 28.0 : (isMobile ? 20.0 : 28.0),
                    color: primaryColor,
                  ),
                ),
                SizedBox(width: isWeb ? 12.0 : (isMobile ? 8.0 : 12.0)),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: subtitle1,
                      ),
                      SizedBox(height: 4),
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
          SizedBox(height: isWeb ? 12.0 : (isMobile ? 8.0 : 12.0)),
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: isWeb ? 12.0 : (isMobile ? 8.0 : 12.0),
              vertical: isWeb ? 6.0 : (isMobile ? 4.0 : 6.0),
            ),
            decoration: BoxDecoration(
              color: backgroundColor,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Text(
              tech,
              style: TextStyle(
                fontSize: isWeb ? 14.0 : (isMobile ? 12.0 : 14.0),
                color: textSecondary,
              ),
            ),
          ),
        ],
      ),
    );
  }
}