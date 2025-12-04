import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../../core/routes/app_pages.dart';
import '../../../../../core/theme/app_text_theme.dart';
import '../../../../../core/utils/app_assets.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_padding.dart';
import '../../../../../core/utils/size_config.dart';
import '../../../../../core/widgets/custom_primary_button.dart';
import 'exercise_place_item.dart';
import 'exercise_time_item.dart';
import 'exercise_title.dart';

class BookExerciseContent extends StatelessWidget {
  const BookExerciseContent({super.key});

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.67, // Starts at 25% of screen (approximately 200px)
      minChildSize: 0.67, // Minimum 15% of screen
      maxChildSize: 0.67, // Can expand to 95% of screen
      builder: (context, scrollController) {
        return Container(
          decoration: BoxDecoration(
            color: AppColors.background,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(32),
              topRight: Radius.circular(32),
            ),
            boxShadow: [
              BoxShadow(
                color: AppColors.primary.withValues(alpha: 0.1),
                blurRadius: 10,
                offset: Offset(0, -2),
              ),
            ],
          ),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsetsDirectional.symmetric(
                  vertical: AppSize.getHeight(25),
                ),
                child: const ExerciseTitle(),
              ),
              Padding(
                padding: AppPadding.horizontalPadding20,
                child: SingleChildScrollView(
                  controller: scrollController,
                  child: Column(
                    children: [
                      Text(
                        ' تمارين شاملة تستهدف جميع عضلات الجسم، تجمع بين القوة واللياقة لزيادة التحمل، شدّ العضلات، وحرق الدهون في جلسة واحدة ، مناسب لأي شخص عايز يحقق توازن بين القوة واللياقة في وقت قصير.',
                        style: AppTextTheme.primary600(size: 14),
                      ),
                      SizedBox(height: AppSize.getHeight(20)),
                      Row(
                        children: [
                          SvgPicture.asset(
                            AppAssets.person,
                            height: AppSize.getHeight(24),
                          ),
                          SizedBox(width: AppSize.getWidth(4)),
                          Text(
                            'المدرب : أسامة محمد',
                            style: AppTextTheme.primary700(size: 14),
                          ),
                        ],
                      ),
                      SizedBox(height: AppSize.getHeight(20)),
                      Row(
                        spacing: AppSize.getWidth(10),
                        children: const [
                          ExerciseTimeItem(
                            icon: AppAssets.time,
                            time: '08:00 - 08:45',
                          ),
                          ExerciseTimeItem(
                            icon: AppAssets.date,
                            time: '09/08/2025',
                          ),
                        ],
                      ),
                      SizedBox(height: AppSize.getHeight(10)),
                      Row(
                        children: [
                          ExercisePlaceItem(
                            icon: AppAssets.door,
                            title: '1',
                            description: 'غرفة التمارين',
                            width: AppSize.getWidth(25),
                          ),
                          SizedBox(width: AppSize.getWidth(10)),
                          ExercisePlaceItem(
                            icon: AppAssets.capacity,
                            title: '10',
                            description: 'القدرة الاستيعابية',
                            width: AppSize.getWidth(5),
                          ),
                        ],
                      ),
                      SizedBox(height: AppSize.getHeight(50)),
                      CustomPrimaryButton(
                        title: 'approveBooking'.tr,
                        onTap: () {
                          Get.toNamed(Routes.bookSuccess);
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
