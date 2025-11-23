import 'package:flutter/material.dart';

import '../../../../../core/theme/app_text_theme.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/size_config.dart';

class ExerciseTitle extends StatelessWidget {
  const ExerciseTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: AppSize.getHeight(1.5),
          children: [
            Padding(
              padding: EdgeInsetsDirectional.only(start: AppSize.getWidth(4)),
              child: Container(
                height: AppSize.getHeight(1.5),
                width: AppSize.getWidth(15),
                decoration: BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadiusDirectional.circular(20),
                ),
              ),
            ),
            Container(
              height: AppSize.getHeight(1.5),
              width: AppSize.getWidth(15),
              decoration: BoxDecoration(
                color: AppColors.primary,
                borderRadius: BorderRadiusDirectional.circular(20),
              ),
            ),
          ],
        ),
        Padding(
          padding: EdgeInsetsDirectional.symmetric(
            horizontal: AppSize.getWidth(10),
          ),
          child: Text(
            'تمارين الجزء العلوي',
            style: AppTextTheme.primary700(size: 20),
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: AppSize.getHeight(1.5),
          children: [
            Padding(
              padding: EdgeInsetsDirectional.only(start: AppSize.getWidth(4)),
              child: Container(
                height: AppSize.getHeight(1.5),
                width: AppSize.getWidth(15),
                decoration: BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadiusDirectional.circular(20),
                ),
              ),
            ),
            Container(
              height: AppSize.getHeight(1.5),
              width: AppSize.getWidth(15),
              decoration: BoxDecoration(
                color: AppColors.primary,
                borderRadius: BorderRadiusDirectional.circular(20),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
