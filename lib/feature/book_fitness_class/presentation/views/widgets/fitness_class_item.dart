import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../../core/routes/app_pages.dart';
import '../../../../../core/theme/app_text_theme.dart';
import '../../../../../core/utils/app_assets.dart';
import '../../../../../core/utils/app_border.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_padding.dart';
import '../../../../../core/utils/size_config.dart';

class FitnessClassItem extends StatelessWidget {
  const FitnessClassItem({super.key, required this.index});
  final int index;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.toNamed(
          Routes.bookExercise,
          arguments: {'heroTag': 'exercise_$index'},
        );
      },
      child: Container(
        height: AppSize.getHeight(72),
        decoration: AppBorder.homeCardBorder,
        child: Row(
          children: [
            Padding(
              padding: AppPadding.horizontalPadding6,
              child: Hero(
                tag: 'exercise_$index',
                child: Container(
                  height: AppSize.getHeight(60),
                  width: AppSize.getWidth(64),
                  decoration: AppBorder.homeCardPrimaryBorder,
                  child: Image.asset(AppAssets.test, fit: BoxFit.cover),
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'تمارين الجزء العلوي',
                  style: AppTextTheme.primary700(size: 12),
                ),
                SizedBox(height: AppSize.getHeight(6)),
                Row(
                  children: [
                    Icon(
                      Icons.access_time_rounded,
                      color: AppColors.primary,
                      size: AppSize.getHeight(10),
                    ),
                    SizedBox(width: AppSize.getWidth(4)),
                    Text(
                      'من 08:00 الى 08:45',
                      style: AppTextTheme.primary600(size: 10),
                    ),
                  ],
                ),
                Row(
                  children: [
                    SvgPicture.asset(
                      AppAssets.person,
                      height: AppSize.getHeight(10),
                      width: AppSize.getWidth(10),
                    ),
                    SizedBox(width: AppSize.getWidth(4)),
                    Text(
                      'المدرب : أسامة محمد',
                      style: AppTextTheme.primary600(size: 10),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
