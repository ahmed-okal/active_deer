import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/routes/app_pages.dart';
import '../../../../core/theme/app_text_theme.dart';
import '../../../../core/utils/app_assets.dart';
import '../../../../core/utils/app_padding.dart';
import '../../../../core/utils/size_config.dart';
import '../../../../core/widgets/custom_app_bar.dart';
import '../getx/controllers/my_acount_controller.dart';
import 'widgets/my_account_item.dart';
import 'widgets/user_info_section.dart';

class MyAcountView extends GetView<MyAcountController> {
  const MyAcountView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            automaticallyImplyLeading: false,
            pinned: true,
            flexibleSpace: CustomAppBar(
              title: 'myAccount'.tr,
              notificationIcon: false,
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: AppPadding.allPadding20,
              child: Column(
                children: [
                  const UserInfoSection(),
                  SizedBox(height: AppSize.getHeight(20)),
                  const Divider(height: 0),
                  SizedBox(height: AppSize.getHeight(28)),
                  Align(
                    alignment: AlignmentDirectional.centerStart,
                    child: Text(
                      'settings'.tr,
                      style: AppTextTheme.primary700(size: 14),
                    ),
                  ),
                  MyAccountItem(
                    itemTitle: 'language'.tr,
                    itemIcon: AppAssets.language,
                    isLangauge: true,
                    onTap: () {
                      Get.toNamed(Routes.language);
                    },
                  ),
                  MyAccountItem(
                    itemTitle: 'mybankCard'.tr,
                    itemIcon: AppAssets.bankCard,
                    onTap: () {},
                  ),
                  MyAccountItem(
                    itemTitle: 'clubBranches'.tr,
                    itemIcon: AppAssets.location,
                    onTap: () {
                      Get.toNamed(Routes.clubBranchs);
                    },
                  ),
                  MyAccountItem(
                    itemTitle: 'aboutUs'.tr,
                    itemIcon: AppAssets.aboutUs,
                    onTap: () {
                      Get.toNamed(Routes.aboutUs);
                    },
                  ),
                  MyAccountItem(
                    itemTitle: 'policiesAndTerms'.tr,
                    itemIcon: AppAssets.form,
                    onTap: () {
                      Get.toNamed(Routes.termsAndConditions);
                    },
                  ),
                  SizedBox(height: AppSize.getHeight(32)),
                  MyAccountItem(
                    itemTitle: 'deleteAccount'.tr,
                    itemIcon: AppAssets.delete,
                    onTap: () {},
                  ),
                  MyAccountItem(
                    itemTitle: 'logout'.tr,
                    itemIcon: AppAssets.logout,
                    onTap: () {
                      controller.cashDataSource.logout();
                    },
                    logout: true,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
