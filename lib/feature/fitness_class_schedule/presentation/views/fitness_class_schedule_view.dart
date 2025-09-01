import 'package:active_deer/core/routes/app_pages.dart';
import 'package:active_deer/core/theme/app_text_theme.dart';
import 'package:active_deer/core/utils/app_assets.dart';
import 'package:active_deer/core/utils/app_padding.dart';
import 'package:active_deer/core/utils/size_config.dart';
import 'package:active_deer/feature/home/presentation/views/widgets/home_days_section.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/widgets/custom_app_bar.dart';
import '../../../../core/widgets/custom_drawer.dart';
import '../../../home/presentation/views/widgets/home_daily_exercises.dart';
import '../getx/controllers/fitness_class_schedule_controller.dart';

class FitnessClassScheduleView extends GetView<FitnessClassScheduleController> {
  const FitnessClassScheduleView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const CustomDrawer(),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            automaticallyImplyLeading: false,
            pinned: true,
            flexibleSpace: CustomAppBar(title: 'fitnessClassSchedule'.tr),
          ),
          SliverPadding(
            padding: AppPadding.allPadding20,
            sliver: SliverToBoxAdapter(
              child: InkWell(
                onTap: () {
                  Get.toNamed(Routes.bookFitnessClass);
                },
                child: Container(
                  height: AppSize.getHeight(146),
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
                        style: AppTextTheme.white700(size: 18),
                      ),
                      Text(
                        'startYourJourney'.tr,
                        style: AppTextTheme.white600(size: 16),
                      ),
                      SizedBox(height: AppSize.getHeight(20)),
                    ],
                  ),
                ),
              ),
            ),
          ),
          const HomeDaysSection(),
          const HomeDailyExercises(),
        ],
      ),
    );
  }
}
