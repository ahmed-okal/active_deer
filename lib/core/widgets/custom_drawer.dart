import 'package:active_deer/core/widgets/drawer_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../routes/app_pages.dart';
import '../theme/app_text_theme.dart';
import '../utils/app_assets.dart';
import '../utils/size_config.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          SizedBox(height: AppSize.getHeight(80)),
          Image.asset(
            AppAssets.whiteLogo,
            height: AppSize.getHeight(95),
            width: AppSize.getWidth(95),
          ),
          SizedBox(height: AppSize.getHeight(67)),
          DrawerItem(
            icon: AppAssets.home,
            title: 'home'.tr,
            onTap: () {
              Get.toNamed(Routes.home);
            },
          ),
          Divider(height: AppSize.getHeight(15)),
          DrawerItem(
            icon: AppAssets.mySubscription,
            title: 'mySubscriptions'.tr,
            onTap: () {
              Get.toNamed(Routes.mySubscription);
            },
          ),
          Divider(height: AppSize.getHeight(15)),
          DrawerItem(
            icon: AppAssets.time,
            title: 'fitnessClassesschedule'.tr,
            onTap: () {},
          ),
          Divider(height: AppSize.getHeight(15)),
          DrawerItem(
            icon: AppAssets.nutritionalAdvice,
            title: 'nutritionalAdvice'.tr,
            onTap: () {},
          ),
          Divider(height: AppSize.getHeight(15)),
          DrawerItem(icon: AppAssets.card, title: 'idCard'.tr, onTap: () {}),
          Divider(height: AppSize.getHeight(15)),
          DrawerItem(icon: AppAssets.persent, title: 'offers'.tr, onTap: () {}),
          SizedBox(height: AppSize.getHeight(268)),

          DrawerItem(
            icon: AppAssets.settings,
            title: 'settings'.tr,
            onTap: () {},
          ),
          Divider(height: AppSize.getHeight(15)),
          InkWell(
            onTap: () {
              Get.toNamed(Routes.auth);
            },
            child: Row(
              children: [
                SvgPicture.asset(
                  AppAssets.logout,
                  height: AppSize.getHeight(24),
                  width: AppSize.getWidth(24),
                ),
                SizedBox(width: AppSize.getWidth(4)),
                Text('logout'.tr, style: AppTextTheme.red700(size: 14)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
