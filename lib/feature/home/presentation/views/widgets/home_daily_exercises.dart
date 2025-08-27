import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/theme/app_text_theme.dart';
import '../../../../../core/utils/app_assets.dart';
import '../../../../../core/utils/app_border.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_padding.dart';
import '../../../../../core/utils/size_config.dart';

class HomeDailyExercises extends StatelessWidget {
  const HomeDailyExercises({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: AppPadding.allPadding20,
      sliver: SliverList.separated(
        itemCount: 3,
        itemBuilder: (context, index) {
          return Container(
            height: AppSize.getHeight(72),
            decoration: AppBorder.homeCardBorder,
            child: Row(
              children: [
                Padding(
                  padding: AppPadding.horizontalPadding6,
                  child: Container(
                    height: AppSize.getHeight(60),
                    width: AppSize.getWidth(64),
                    decoration: AppBorder.homeCardPrimaryBorder,
                    child: Image.asset(AppAssets.test, fit: BoxFit.cover),
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
                          '20 دقيقة',
                          style: AppTextTheme.primary600(size: 10),
                        ),
                        SizedBox(width: AppSize.getWidth(6)),
                        SvgPicture.asset(
                          AppAssets.star,
                          height: AppSize.getHeight(10),
                          width: AppSize.getWidth(10),
                        ),
                        SizedBox(width: AppSize.getWidth(4)),
                        Text(
                          'مبتدئين',
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
          );
        },
        separatorBuilder: (context, index) {
          return Divider();
        },
      ),
    );
  }
}
