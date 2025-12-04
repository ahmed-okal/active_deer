import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/routes/app_pages.dart';
import '../../../../core/theme/app_text_theme.dart';
import '../../../../core/utils/size_config.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/widgets/custom_primary_button.dart';
import '../../../../core/widgets/custom_third_button.dart';
import '../getx/controllers/waiver_controller.dart';

class WaiverConfirmationBottomSheet extends GetView<WaiverController> {
  const WaiverConfirmationBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppSize.getHeight(300),
      padding: EdgeInsets.only(
        right: AppSize.getWidth(34),
        left: AppSize.getWidth(34),
      ),
      decoration: const BoxDecoration(
        color: AppColors.background,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsetsDirectional.symmetric(
              vertical: AppSize.getHeight(25),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _decorLines(),
                Padding(
                  padding: EdgeInsetsDirectional.symmetric(
                    horizontal: AppSize.getWidth(10),
                  ),
                  child: Text(
                    '${'waiverFee'.tr} 100 ${'sar'.tr}',
                    style: AppTextTheme.primary700(size: 20),
                  ),
                ),
                _decorLines(),
              ],
            ),
          ),
          Center(
            child: Text(
              'waiverDeductionNotice'.tr,
              style: AppTextTheme.primary500(size: 14),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(height: AppSize.getHeight(80)),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: CustomPrimaryButton(
                  title: 'agree'.tr,
                  onTap: () {
                    Get.toNamed(Routes.payment);
                  },
                ),
              ),
              SizedBox(width: AppSize.getWidth(6)),
              Expanded(
                child: CustomthirdButton(
                  title: 'cancel'.tr,
                  onTap: () {
                    Get.back();
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _decorLines() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: AppSize.getHeight(1.5),
      children: [
        Padding(
          padding: EdgeInsetsDirectional.only(start: AppSize.getWidth(4)),
          child: Container(
            height: AppSize.getHeight(1.5),
            width: AppSize.getWidth(15),
            decoration: BoxDecoration(
              color: AppColors.primary,
              borderRadius: BorderRadiusDirectional.circular(20),
            ),
          ),
        ),
        Container(
          height: AppSize.getHeight(1.5),
          width: AppSize.getWidth(15),
          decoration: BoxDecoration(
            color: AppColors.primary,
            borderRadius: BorderRadiusDirectional.circular(20),
          ),
        ),
      ],
    );
  }
}

