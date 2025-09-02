import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../../core/theme/app_text_theme.dart';
import '../../../../../core/utils/app_assets.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/size_config.dart';
import '../../getx/controllers/book_fitness_class_controller.dart';

class ExerciseItem extends GetView<BookFitnessClassController> {
  const ExerciseItem({super.key, required this.index});

  final int index;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        controller.changeExercise(index);
      },
      child: Obx(
        () => Container(
          height: AppSize.getHeight(64),
          width: AppSize.getWidth(73),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6),
            border: Border.all(
              color: controller.currentExercise.value == index
                  ? AppColors.primary
                  : AppColors.secondry,
              width: controller.currentExercise.value == index
                  ? AppSize.getHeight(1.5)
                  : AppSize.getHeight(1),
            ),
          ),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsetsGeometry.only(
                  top: AppSize.getHeight(10),
                  bottom: AppSize.getHeight(2),
                ),
                child: SvgPicture.asset(AppAssets.swim),
              ),
              Text('swimming', style: AppTextTheme.primary700(size: 12)),
            ],
          ),
        ),
      ),
    );
  }
}
