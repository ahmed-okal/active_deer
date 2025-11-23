import 'package:curved_labeled_navigation_bar/curved_navigation_bar.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../theme/app_text_theme.dart';
import '../utils/app_assets.dart';
import '../utils/app_colors.dart';
import '../utils/size_config.dart';
import 'bottom_nav_bar_controller.dart';

class CustomBottomNavBar extends GetView<BottomNavBarController> {
  const CustomBottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
        boxShadow: [
          BoxShadow(blurRadius: 20, color: AppColors.black.withAlpha(75)),
        ],
      ),
      padding: EdgeInsets.only(bottom: AppSize.getHeight(10)),
      height: AppSize.getHeight(70),
      child: Obx(
        () => CurvedNavigationBar(
          index: controller.currentIndex.value,
          iconPadding: AppSize.getHeight(14),
          buttonBackgroundColor: AppColors.primary,
          backgroundColor: AppColors.white,
          items: [
            CurvedNavigationBarItem(
              child: SvgPicture.asset(
                AppAssets.home,
                color: controller.currentIndex.value == 0
                    ? AppColors.white
                    : AppColors.darkGrey,
                height: AppSize.getHeight(24),
              ),
              label: 'home'.tr,
              labelStyle: controller.currentIndex.value == 0
                  ? AppTextTheme.primary700(size: 10)
                  : AppTextTheme.secondary700(size: 10),
            ),
            CurvedNavigationBarItem(
              child: SvgPicture.asset(
                AppAssets.mySubscription,
                color: controller.currentIndex.value == 1
                    ? AppColors.white
                    : AppColors.darkGrey,
                height: AppSize.getHeight(24),
              ),
              label: 'mySubscriptions'.tr,
              labelStyle: controller.currentIndex.value == 1
                  ? AppTextTheme.primary700(size: 10)
                  : AppTextTheme.secondary700(size: 10),
            ),
            CurvedNavigationBarItem(
              child: SvgPicture.asset(
                AppAssets.idCard,
                color: controller.currentIndex.value == 2
                    ? AppColors.white
                    : AppColors.darkGrey,
                height: AppSize.getHeight(24),
              ),
              label: 'idCard'.tr,
              labelStyle: controller.currentIndex.value == 2
                  ? AppTextTheme.primary700(size: 10)
                  : AppTextTheme.secondary700(size: 10),
            ),
            CurvedNavigationBarItem(
              child: SvgPicture.asset(
                AppAssets.time,
                color: controller.currentIndex.value == 3
                    ? AppColors.white
                    : AppColors.darkGrey,
                height: AppSize.getHeight(24),
              ),
              label: 'mySchedule'.tr,
              labelStyle: controller.currentIndex.value == 3
                  ? AppTextTheme.primary700(size: 10)
                  : AppTextTheme.secondary700(size: 10),
            ),
            CurvedNavigationBarItem(
              child: SvgPicture.asset(
                AppAssets.menuIcon,
                color: controller.currentIndex.value == 4
                    ? AppColors.white
                    : AppColors.darkGrey,
                height: AppSize.getHeight(24),
              ),
              label: 'more'.tr,
              labelStyle: controller.currentIndex.value == 4
                  ? AppTextTheme.primary700(size: 10)
                  : AppTextTheme.secondary700(size: 10),
            ),
          ],
          onTap: (index) {
            controller.changePage(index);
          },
        ),
      ),
    );
  }
}
