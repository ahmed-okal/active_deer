import 'package:flutter/material.dart';

import '../../../../../core/theme/app_text_theme.dart';
import '../../../../../core/utils/app_border.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/size_config.dart';

class HomeActionsCard extends StatelessWidget {
  const HomeActionsCard({
    super.key,
    required this.onTap,
    required this.title,
    required this.icon,
  });
  final VoidCallback onTap;
  final String title;
  final Widget icon;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.zero,
        height: AppSize.getHeight(42.67),
        width: AppSize.getWidth(185),
        decoration: AppBorder.homeCardBorder,
        child: Row(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: AppSize.getWidth(12),
                vertical: AppSize.getHeight(8),
              ),
              child: Container(
                width: AppSize.getHeight(26),
                decoration: BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Center(child: icon),
              ),
            ),
            Text(title, style: AppTextTheme.primary700(size: 14)),
          ],
        ),
      ),
    );
  }
}
