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

    // Responsive values based on screen size
    final cardHeight = isWeb ? 100.0 : (isMobile ? 120.0 : 110.0);
    final iconContainerSize = isWeb ? 40.0 : (isMobile ? 48.0 : 44.0);
    final iconSize = isWeb ? 20.0 : (isMobile ? 24.0 : 22.0);
    final fontSize = isWeb ? 14.0 : (isMobile ? 14.0 : 16.0);
    final horizontalMargin = isWeb ? 4.0 : (isMobile ? 4.0 : 6.0);

    return Expanded(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: horizontalMargin),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: enabled ? onTap : null,
            borderRadius: BorderRadius.circular(12),
            child: Container(
              height: cardHeight,
              decoration: BoxDecoration(
                color: enabled
                    ? (backgroundColor ?? (kIsWeb ? Colors.red : cardColor))
                    : cardColor.withOpacity(0.5),
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  if (enabled)
                    BoxShadow(
                      color: Colors.black.withOpacity(0.08),
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
                    width: iconContainerSize,
                    height: iconContainerSize,
                    decoration: BoxDecoration(
                      color: enabled
                          ? (iconColor ?? primaryColor).withOpacity(0.1)
                          : dividerColor.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(iconContainerSize / 2),
                    ),
                    child: kIsWeb
                        ? Text(
                            "◉", // Simple circle character
                            style: TextStyle(
                              fontSize: iconSize,
                              color: enabled
                                  ? (iconColor ?? primaryColor)
                                  : textSecondary,
                            ),
                          )
                        : Icon(
                            icon,
                            size: iconSize,
                            color: enabled
                                ? (iconColor ?? primaryColor)
                                : textSecondary,
                          ),
                  ),
                  const SizedBox(height: 8),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Text(
                      title,
                      textAlign: TextAlign.center,
                      style: subtitle2.copyWith(
                        color: enabled ? textPrimary : textSecondary,
                        fontWeight: FontWeight.w500,
                        fontSize: fontSize,
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