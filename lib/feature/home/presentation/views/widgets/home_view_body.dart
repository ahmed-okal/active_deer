import 'package:active_deer/feature/home/presentation/views/widgets/home_actions_section.dart';
import 'package:active_deer/feature/home/presentation/views/widgets/home_daily_exercises.dart';
import 'package:active_deer/feature/home/presentation/views/widgets/home_days_section.dart';
import 'package:active_deer/feature/home/presentation/views/widgets/home_final_card.dart';
import 'package:active_deer/feature/home/presentation/views/widgets/home_premium_card_section.dart';
import 'package:active_deer/feature/home/presentation/views/widgets/home_sliver_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../core/routes/app_pages.dart';
import '../../../../../core/theme/app_text_theme.dart';
import '../../../../../core/utils/app_assets.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_padding.dart';
import '../../../../../core/utils/size_config.dart';
import '../../getx/controllers/home_controller.dart';

class HomeViewBody extends GetView<HomeController> {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        const SliverAppBar(
          automaticallyImplyLeading: false,
          pinned: true,
          flexibleSpace: HomeSliverAppBar(),
        ),
        SliverList(
          delegate: SliverChildListDelegate([
            Padding(
              padding: AppPadding.verticalPadding20,
              child: Image.asset(
                AppAssets.logo,
                height: AppSize.getHeight(98),
                width: AppSize.getWidth(98),
              ),
            ),
            const HomePremiumCardSection(),
            SizedBox(height: AppSize.getHeight(13)),
            const HomeActionsSection(),
            SizedBox(height: AppSize.getHeight(15)),
            Padding(
              padding: AppPadding.horizontalPadding20,
              child: Row(
                children: [
                  Text(
                    'fitnessClassSchedule'.tr,
                    style: AppTextTheme.primary700(size: 12),
                  ),
                  const Spacer(),
                  InkWell(
                    onTap: () {
                      Get.toNamed(Routes.fitnessClassSchedule);
                    },
                    child: Text(
                      'more'.tr,
                      style: AppTextTheme.secondary700(size: 12).copyWith(
                        decoration: TextDecoration.underline,
                        decorationColor: AppColors.darkGrey,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: AppSize.getHeight(15)),
          ]),
        ),
        const HomeDaysSection(),
        const HomeDailyExercises(),
        const HomeFinalCard(),
      ],
    );
  }
}
