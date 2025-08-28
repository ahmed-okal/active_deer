import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../core/theme/app_text_theme.dart';
import '../../../../../core/utils/app_border.dart';
import '../../../../../core/utils/size_config.dart';
import '../../getx/controllers/my_subscription_controller.dart';

class MySubscriptionTapItem extends GetView<MySubscriptionController> {
  const MySubscriptionTapItem(this.index, {super.key});
  final int index;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => controller.changePage(index),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 400),
        height: AppSize.getHeight(28),
        width: AppSize.getWidth(71),
        decoration: controller.currentPage.value == index
            ? AppBorder.primaryButtonBorder
            : AppBorder.secondaryButtonBorder,
        child: Center(
          child: Text(
            controller.pages[index],
            style: controller.currentPage.value == index
                ? AppTextTheme.white900(size: 14)
                : AppTextTheme.primary900(size: 14),
          ),
        ),
      ),
    );
  }
}
