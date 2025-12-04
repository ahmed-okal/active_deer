import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../core/theme/app_text_theme.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_padding.dart';
import '../../../../../core/utils/size_config.dart';
import '../../../../../core/widgets/custom_primary_button.dart';
import 'confirm_suspension_bottom_sheet.dart';
import 'days_wheel.dart';

class SelectCountOfDaysBottomSheet extends StatelessWidget {
  const SelectCountOfDaysBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppPadding.allPadding20,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'pleaseSpecifyTheDurationOfTheTemporarySuspension'.tr,
            style: AppTextTheme.primary700(size: 14),
          ),
          SizedBox(height: AppSize.getHeight(5)),
          Text(
            '${'numberOfDaysOfSuspensionAllowed'.tr} 20 ${'days'.tr}',
            style: AppTextTheme.darkRed700(size: 14),
          ),
          Padding(
            padding: AppPadding.verticalPadding25,
            child: SizedBox(
              height: AppSize.getHeight(210),
              child: const DaysWheel(),
            ),
          ),
          Center(
            child: CustomPrimaryButton(
              title: 'next'.tr,
              onTap: () {
                Get.back();
                showModalBottomSheet(
                  context: Get.context!,
                  isScrollControlled: false,
                  backgroundColor: AppColors.background,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(20),
                    ),
                  ),
                  builder: (_) => const ConfirmSuspensionBottomSheet(),
                );
              },
            ),
          ),
          SizedBox(height: AppSize.getHeight(32)),
        ],
      ),
    );
  }
}

