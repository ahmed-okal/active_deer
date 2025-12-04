import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/theme/app_text_theme.dart';
import '../../../../../core/utils/app_border.dart';
import '../../../../../core/utils/size_config.dart';

class ExercisePlaceItem extends StatelessWidget {
  const ExercisePlaceItem({
    super.key,
    required this.icon,
    required this.title,
    required this.description,
    required this.width,
  });
  final String icon, title, description;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: AppSize.getHeight(85),
        decoration: AppBorder.homeCardBorder,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title,
                  style: AppTextTheme.primary700(size: 40).copyWith(height: 1),
                ),
                Text(
                  description,
                  style: AppTextTheme.primary700(size: 12).copyWith(height: 1),
                ),
              ],
            ),
            SizedBox(width: width),
            SvgPicture.asset(icon, height: AppSize.getHeight(43)),
          ],
        ),
      ),
    );
  }
}
