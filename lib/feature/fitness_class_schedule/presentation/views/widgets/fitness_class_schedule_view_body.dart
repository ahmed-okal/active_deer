import 'package:active_deer/core/theme/app_text_theme.dart';
import 'package:active_deer/core/utils/app_assets.dart';
import 'package:active_deer/core/utils/app_border.dart';
import 'package:active_deer/core/utils/app_padding.dart';
import 'package:active_deer/core/utils/size_config.dart';
import 'package:active_deer/core/widgets/custom_primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../../core/routes/app_pages.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/widgets/custom_app_bar.dart';
import '../../getx/controllers/fitness_class_schedule_controller.dart';

class FitnessClassScheduleViewBody
    extends GetView<FitnessClassScheduleController> {
  const FitnessClassScheduleViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          automaticallyImplyLeading: false,
          pinned: true,
          flexibleSpace: CustomAppBar(title: 'fitnessClassSchedule'.tr),
        ),
        SliverPadding(
          padding: AppPadding.topPadding20,
          sliver: SliverToBoxAdapter(
            child: SizedBox(
              height: AppSize.getHeight(28),
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                padding: AppPadding.horizontalPadding20,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      controller.changeExercise(index);
                    },
                    child: Obx(
                      () => Container(
                        height: AppSize.getHeight(28),
                        width: AppSize.getWidth(71),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                            color: controller.currentExercise.value == index
                                ? AppColors.primary
                                : AppColors.secondry,
                            width: AppSize.getHeight(1),
                          ),
                          color: controller.currentExercise.value == index
                              ? AppColors.primary
                              : AppColors.background,
                        ),
                        child: Center(
                          child: Text(
                            'all'.tr,
                            style: controller.currentExercise.value == index
                                ? AppTextTheme.white700(size: 12)
                                : AppTextTheme.primary700(size: 12),
                          ),
                        ),
                      ),
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return SizedBox(width: AppSize.getWidth(6));
                },
                itemCount: 5,
              ),
            ),
          ),
        ),
        SliverPadding(
          padding: AppPadding.allPadding20,
          sliver: SliverList.separated(
            itemCount: 4,
            itemBuilder: (context, index) {
              return Container(
                height: AppSize.getHeight(99),
                decoration: AppBorder.homeCardBorder,
                child: Stack(
                  children: [
                    Align(
                      alignment: AlignmentDirectional.topEnd,
                      child: Padding(
                        padding: AppPadding.allPadding8,
                        child: Container(
                          height: AppSize.getHeight(16),
                          width: AppSize.getWidth(43),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            color: AppColors.green,
                          ),
                          child: Center(
                            child: Text(
                              'new'.tr,
                              style: AppTextTheme.white700(size: 10),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadiusDirectional.only(
                            topStart: Radius.circular(6),
                            bottomStart: Radius.circular(6),
                          ),
                          child: Image.asset(
                            AppAssets.test,
                            fit: BoxFit.cover,
                            width: AppSize.getWidth(175),
                          ),
                        ),
                        Padding(
                          padding: AppPadding.allPadding8,
                          child: Column(
                            spacing: AppSize.getHeight(2),
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'تمارين الجزء العلوي',
                                style: AppTextTheme.primary700(size: 12),
                              ),
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
                                    style: AppTextTheme.primary700(size: 10),
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
                                    style: AppTextTheme.primary700(size: 10),
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
                                    style: AppTextTheme.primary700(size: 10),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Align(
                      alignment: AlignmentDirectional.bottomEnd,
                      child: Container(
                        height: AppSize.getHeight(24),
                        width: AppSize.getWidth(113),
                        decoration: BoxDecoration(
                          color: AppColors.primary,
                          borderRadius: BorderRadiusDirectional.only(
                            topStart: Radius.circular(6),
                            bottomEnd: Radius.circular(6),
                          ),
                        ),
                        child: Center(
                          child: Text(
                            'من 08:00 الى 08:45',
                            style: AppTextTheme.white700(size: 11.5),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
            separatorBuilder: (context, index) {
              return SizedBox(height: AppSize.getHeight(18));
            },
          ),
        ),
        SliverPadding(
          padding: AppPadding.allPadding20,
          sliver: SliverToBoxAdapter(
            child: CustomPrimaryButton(
              title: 'bookFitnessClass'.tr,
              onTap: () {
                Get.toNamed(Routes.bookFitnessClass);
              },
            ),
          ),
        ),
      ],
    );
  }
}
