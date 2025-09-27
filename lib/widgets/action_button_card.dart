import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
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
    final screenWidth = MediaQuery.of(context).size.width;
    final isWeb = kIsWeb;
    final isMobile = screenWidth < 768;

    return Expanded(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: isWeb ? 8.0 : (isMobile ? 4.0 : 8.0)),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: enabled ? onTap : null,
            borderRadius: BorderRadius.circular(12),
            child: Container(
              height: isWeb ? 120.0 : (isMobile ? 100.0 : 120.0),
              decoration: BoxDecoration(
                color: enabled
                    ? (backgroundColor ?? cardColor)
                    : cardColor.withOpacity(0.5),
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  if (enabled)
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      offset: const Offset(0, 2),
                      blurRadius: 8,
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
                    width: isWeb ? 48.0 : (isMobile ? 40.0 : 48.0),
                    height: isWeb ? 48.0 : (isMobile ? 40.0 : 48.0),
                    decoration: BoxDecoration(
                      color: enabled
                          ? (iconColor ?? primaryColor).withOpacity(0.1)
                          : dividerColor.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(isWeb ? 24.0 : (isMobile ? 20.0 : 24.0)),
                    ),
                    child: Icon(
                      icon,
                      size: isWeb ? 24.0 : (isMobile ? 20.0 : 24.0),
                      color: enabled
                          ? (iconColor ?? primaryColor)
                          : textSecondary,
                    ),
                  ),
                  SizedBox(height: isWeb ? 8.0 : (isMobile ? 6.0 : 8.0)),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: isWeb ? 8.0 : (isMobile ? 6.0 : 8.0)),
                    child: Text(
                      title,
                      textAlign: TextAlign.center,
                      style: subtitle2.copyWith(
                        color: enabled ? textPrimary : textSecondary,
                        fontWeight: FontWeight.w500,
                        fontSize: isWeb ? 14.0 : (isMobile ? 12.0 : 14.0),
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}