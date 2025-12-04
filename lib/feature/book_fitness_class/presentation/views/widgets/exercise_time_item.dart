import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/theme/app_text_theme.dart';
import '../../../../../core/utils/app_border.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/size_config.dart';

class ExerciseTimeItem extends StatelessWidget {
  const ExerciseTimeItem({super.key, required this.icon, required this.time});
  final String icon;
  final String time;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: AppSize.getHeight(42),
        decoration: AppBorder.homeCardBorder,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              icon,
              color: AppColors.primary,
              height: AppSize.getHeight(24),
            ),
            SizedBox(width: AppSize.getWidth(4)),
            Text(time, style: AppTextTheme.primary700(size: 14)),
          ],
        ),
      ),
    );
  }
}
