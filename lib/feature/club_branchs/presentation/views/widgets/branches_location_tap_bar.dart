import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../core/theme/app_text_theme.dart';
import '../../../../../core/utils/app_border.dart';
import '../../../../../core/utils/app_padding.dart';
import '../../../../../core/utils/size_config.dart';
import '../../getx/controllers/club_branchs_controller.dart';

class BranchesLocationTapBar extends GetView<ClubBranchsController> {
  const BranchesLocationTapBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppSize.getHeight(29),
      child: ListView.separated(
        padding: AppPadding.horizontalPadding20,
        itemBuilder: (context, index) {
          return Obx(
            () => InkWell(
              onTap: () {
                controller.changeBranch(index);
              },
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                height: AppSize.getHeight(28),
                width: AppSize.getWidth(71),
                decoration: controller.currentBranch.value == index
                    ? AppBorder.primaryButtonBorder
                    : AppBorder.secondaryButtonBorder,
                child: Center(
                  child: Text(
                    ' الرياض',
                    style: controller.currentBranch.value == index
                        ? AppTextTheme.white700(size: 12)
                        : AppTextTheme.primary700(size: 12),
                  ),
                ),
              ),
            ),
          );
        },
        separatorBuilder: (context, index) {
          return SizedBox(width: AppSize.getWidth(10));
        },
        itemCount: 5,
        scrollDirection: Axis.horizontal,
      ),
    );
  }
}
