import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../../../core/theme/app_text_theme.dart';
import '../../../../../../core/utils/app_assets.dart';
import '../../../../../../core/utils/app_colors.dart';
import '../../../../../../core/utils/size_config.dart';
import '../../getx/controllers/login_controller.dart';

class BirthDateField extends GetView<LoginController> {
  const BirthDateField({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('birthDate'.tr, style: AppTextTheme.primary700(size: 14)),
        SizedBox(height: AppSize.getHeight(5)),
        Obx(
          () => InkWell(
            onTap: () => controller.selectBirthDate(context),
            child: Container(
              height: AppSize.getHeight(48),
              padding: EdgeInsets.symmetric(
                horizontal: AppSize.getWidth(16),
                vertical: AppSize.getHeight(12),
              ),
              decoration: BoxDecoration(
                border: Border.all(color: AppColors.secondry, width: 1),
                borderRadius: BorderRadius.circular(8),
                color: AppColors.white,
              ),
              child: Row(
                children: [
                  SvgPicture.asset(
                    AppAssets.date,
                    height: AppSize.getHeight(20),
                    width: AppSize.getWidth(20),
                    colorFilter: ColorFilter.mode(
                      AppColors.secondry,
                      BlendMode.srcIn,
                    ),
                  ),
                  SizedBox(width: AppSize.getWidth(12)),
                  Expanded(
                    child: Text(
                      controller.selectedBirthDate.value != null
                          ? controller.formattedBirthDate
                          : 'selectBirthDate'.tr,
                      style: AppTextTheme.primary700(size: 16).copyWith(
                        color: controller.selectedBirthDate.value != null
                            ? AppColors.primary
                            : AppColors.secondry,
                      ),
                      textAlign: TextAlign.right,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
