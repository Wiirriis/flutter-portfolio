import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../core/theme/colors.dart';
import '../core/theme/text_styles.dart';

class CustomDrawer extends StatelessWidget {
  final String userName;

  const CustomDrawer({
    Key? key,
    required this.userName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _buildHeader(),
          Expanded(
            child: _buildMenuItems(context),
          ),
          _buildFooter(),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      height: 180.h,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            primaryColor,
            primaryDark,
          ],
        ),
      ),
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                radius: 35.r,
                backgroundColor: Colors.white,
                child: Icon(
                  Icons.person,
                  size: 40.w,
                  color: primaryColor,
                ),
              ),
              SizedBox(height: 12.h),
              Text(
                'Hola,',
                style: TextStyle(
                  fontSize: 16.sp,
                  color: Colors.white70,
                ),
              ),
              Text(
                userName,
                style: title2White,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMenuItems(BuildContext context) {
    final items = [
      DrawerItem(
        icon: Icons.home_outlined,
        title: 'Inicio',
        onTap: () {
          Navigator.pop(context);
          // Navigate to home
        },
      ),
      DrawerItem(
        icon: Icons.person_outline,
        title: 'Sobre mí',
        onTap: () {
          Navigator.pop(context);
          // Navigate to about
        },
      ),
      DrawerItem(
        icon: Icons.work_outline,
        title: 'Proyectos',
        onTap: () {
          Navigator.pop(context);
          // Navigate to projects
        },
      ),
      DrawerItem(
        icon: Icons.school_outlined,
        title: 'Experiencia',
        onTap: () {
          Navigator.pop(context);
          // Navigate to experience
        },
      ),
      DrawerItem(
        icon: Icons.code_outlined,
        title: 'Habilidades',
        onTap: () {
          Navigator.pop(context);
          // Navigate to skills
        },
      ),
      DrawerItem(
        icon: Icons.mail_outline,
        title: 'Contacto',
        onTap: () {
          Navigator.pop(context);
          // Navigate to contact
        },
      ),
    ];

    return ListView.builder(
      padding: EdgeInsets.symmetric(vertical: 8.h),
      itemCount: items.length,
      itemBuilder: (context, index) {
        final item = items[index];
        return _buildMenuItem(item);
      },
    );
  }

  Widget _buildMenuItem(DrawerItem item) {
    return ListTile(
      leading: Container(
        width: 40.w,
        height: 40.h,
        decoration: BoxDecoration(
          color: primaryColor.withOpacity(0.1),
          borderRadius: BorderRadius.circular(8.r),
        ),
        child: Icon(
          item.icon,
          color: primaryColor,
          size: 22.w,
        ),
      ),
      title: Text(
        item.title,
        style: subtitle1,
      ),
      onTap: item.onTap,
      dense: true,
    );
  }

  Widget _buildFooter() {
    return Container(
      padding: EdgeInsets.all(16.w),
      child: Column(
        children: [
          Divider(
            color: dividerColor,
            thickness: 1,
          ),
          SizedBox(height: 8.h),
          Text(
            'Portfolio App v1.0',
            style: caption,
          ),
        ],
      ),
    );
  }
}

class DrawerItem {
  final IconData icon;
  final String title;
  final VoidCallback onTap;

  DrawerItem({
    required this.icon,
    required this.title,
    required this.onTap,
  });
}