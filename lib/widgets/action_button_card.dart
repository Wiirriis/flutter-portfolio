import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../core/theme/colors.dart';
import '../core/theme/text_styles.dart';

class ActionButtonCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback? onTap;
  final bool enabled;
  final Color? backgroundColor;
  final Color? iconColor;

  const ActionButtonCard({
    Key? key,
    required this.title,
    required this.icon,
    this.onTap,
    this.enabled = true,
    this.backgroundColor,
    this.iconColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 4.w),
        child: kIsWeb
            ? _buildWebCard()
            : _buildMobileCard(),
      ),
    );
  }

  Widget _buildWebCard() {
    return GestureDetector(
      onTap: enabled ? onTap : null,
      child: Container(
        height: 100,
        decoration: BoxDecoration(
          color: enabled ? Colors.white : const Color(0xFFF5F5F5),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: enabled ? const Color(0xFFE0E0E0) : const Color(0xFFBDBDBD),
            width: 1,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 56,
              height: 56,
              decoration: BoxDecoration(
                color: enabled ? const Color(0xFFE8F5E8) : const Color(0xFFF5F5F5),
                borderRadius: BorderRadius.circular(28),
              ),
              child: Icon(
                icon,
                size: 28,
                color: enabled ? primaryColor : textSecondary,
              ),
            ),
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Text(
                title,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: enabled ? textPrimary : textSecondary,
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMobileCard() {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: enabled ? onTap : null,
        borderRadius: BorderRadius.circular(12.r),
        child: Container(
          height: 120.h,
          decoration: BoxDecoration(
            color: enabled
                ? (backgroundColor ?? cardColor)
                : cardColor.withOpacity(0.5),
            borderRadius: BorderRadius.circular(12.r),
            boxShadow: [
              if (enabled)
                BoxShadow(
                  color: Colors.black.withOpacity(0.08),
                  offset: Offset(0, 2.h),
                  blurRadius: 8.r,
                  spreadRadius: 0,
                ),
            ],
            border: Border.all(
              color: enabled ? primaryColor.withOpacity(0.1) : dividerColor,
              width: 1,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 48.w,
                height: 48.h,
                decoration: BoxDecoration(
                  color: enabled
                      ? (iconColor ?? primaryColor).withOpacity(0.1)
                      : dividerColor.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(24.r),
                ),
                child: Icon(
                  icon,
                  size: 24.w,
                  color: enabled
                      ? (iconColor ?? primaryColor)
                      : textSecondary,
                ),
              ),
              SizedBox(height: 8.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.w),
                child: Text(
                  title,
                  textAlign: TextAlign.center,
                  style: subtitle2.copyWith(
                    color: enabled ? textPrimary : textSecondary,
                    fontWeight: FontWeight.w500,
                    fontSize: 14.sp,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}