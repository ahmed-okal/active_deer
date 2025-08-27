import 'package:active_deer/feature/home/presentation/views/widgets/home_pop_up_menu_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import '../../../../../core/theme/app_text_theme.dart';
import '../../../../../core/utils/app_assets.dart';
import '../../../../../core/utils/app_border.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_padding.dart';
import '../../../../../core/utils/size_config.dart';

class HomePremiumCard extends StatelessWidget {
  const HomePremiumCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: AppPadding.horizontalPadding6,
        child: Container(
          height: AppSize.getHeight(83),
          decoration: AppBorder.homeContainerBorder,
          child: Container(
            margin: EdgeInsets.all(AppSize.getHeight(1)),
            decoration: BoxDecoration(
              color: AppColors.background,
              borderRadius: BorderRadius.circular(6),
            ),
            child: Padding(
              padding: AppPadding.homeCardPadding,
              child: Column(
                children: [
                  Row(
                    children: [
                      SvgPicture.asset(
                        AppAssets.premiumIcon,
                        height: AppSize.getHeight(19),
                        width: AppSize.getWidth(19),
                      ),
                      Text(
                        'premiumSubscription'.tr,
                        style: AppTextTheme.primary800(size: 14),
                      ),
                      const Spacer(),
                      const HomePopupMenuButton(),
                    ],
                  ),
                  SizedBox(height: AppSize.getHeight(10)),
                  Center(
                    child: LinearPercentIndicator(
                      padding: EdgeInsets.zero,
                      isRTL: Locale('ar', 'EG') == Get.locale ? true : false,
                      barRadius: const Radius.circular(10),
                      animation: true,
                      animationDuration: 1000,
                      lineHeight: 8.0,
                      percent: 0.5,
                      progressColor: AppColors.primary,
                      backgroundColor: AppColors.grey,
                    ),
                  ),
                  Spacer(),
                  Row(
                    children: [
                      Icon(
                        Icons.access_time_rounded,
                        color: AppColors.primary,
                        size: AppSize.getHeight(11),
                      ),
                      SizedBox(width: AppSize.getWidth(2)),
                      Text(
                        '${'startDate'.tr}: 29/4/2025',
                        style: AppTextTheme.secondary700(size: 10),
                      ),
                      Spacer(),
                      Icon(
                        Icons.access_time_rounded,
                        color: AppColors.primary,
                        size: AppSize.getHeight(11),
                      ),
                      SizedBox(width: AppSize.getWidth(2)),
                      Text(
                        '${'endDate'.tr}: 29/4/2025',
                        style: AppTextTheme.secondary700(size: 10),
                      ),
                    ],
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
