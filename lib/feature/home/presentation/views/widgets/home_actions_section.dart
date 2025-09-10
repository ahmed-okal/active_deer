import 'package:active_deer/feature/home/presentation/views/widgets/home_actions_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../../core/routes/app_pages.dart';
import '../../../../../core/theme/app_text_theme.dart';
import '../../../../../core/utils/app_assets.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_padding.dart';
import '../../../../../core/utils/size_config.dart';

class HomeActionsSection extends StatelessWidget {
  const HomeActionsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppPadding.horizontalPadding20,
      child: Row(
        children: [
          InkWell(
            onTap: () {
              Get.toNamed(Routes.bookFitnessClass);
            },
            child: Container(
              height: AppSize.getHeight(146),
              width: AppSize.getWidth(154),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(AppAssets.test),
                  fit: BoxFit.cover,
                ),

                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'bookFitnessClass'.tr,
                    style: AppTextTheme.white800(size: 14),
                  ),
                  Text(
                    'startYourJourney'.tr,
                    style: AppTextTheme.white600(size: 8),
                  ),
                  SizedBox(height: AppSize.getHeight(13)),
                ],
              ),
            ),
          ),
          Spacer(),
          Column(
            spacing: AppSize.getHeight(8),
            children: [
              HomeActionsCard(
                onTap: () {
                  Get.toNamed(Routes.mySubscription);
                },
                title: 'mySubscriptions'.tr,
                icon: Icon(
                  Icons.access_time_rounded,
                  color: AppColors.white,
                  size: AppSize.getHeight(16),
                ),
              ),
              HomeActionsCard(
                onTap: () {
                  Get.toNamed(Routes.offers);
                },
                title: 'offers'.tr,
                icon: SvgPicture.asset(
                  AppAssets.persent,
                  height: AppSize.getHeight(16),
                  width: AppSize.getWidth(16),
                ),
              ),
              HomeActionsCard(
                onTap: () {},
                title: 'idCard'.tr,
                icon: SvgPicture.asset(
                  AppAssets.card,
                  height: AppSize.getHeight(16),
                  width: AppSize.getWidth(16),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
