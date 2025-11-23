import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/size_config.dart';
import '../../getx/controllers/home_controller.dart';

class PremiumCardDots extends GetView<HomeController> {
  const PremiumCardDots({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Obx(
        () => SmoothPageIndicator(
          controller: PageController(
            initialPage: controller.currentPremiumCardIndex.value,
          ),
          count: 10,
          axisDirection: Axis.horizontal,
          effect: WormEffect(
            paintStyle: PaintingStyle.fill,
            dotColor: AppColors.grey,
            activeDotColor: AppColors.primary,
            dotHeight: AppSize.getHeight(5),
            dotWidth: AppSize.getWidth(5),
            spacing: AppSize.getWidth(4),
          ),
        ),
      ),
    );
  }
}
