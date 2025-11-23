import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../core/theme/app_text_theme.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_padding.dart';
import '../../../../../core/utils/size_config.dart';
import '../../../../../core/widgets/bottom_sheet_title.dart';
import '../../../../../core/widgets/custom_primary_button.dart';
import 'select_count_of_days_bottom_sheet.dart';

class ShowStopBottomSheet extends StatelessWidget {
  const ShowStopBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppPadding.allPadding20,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          BottomSheetTitle(title: 'stopSubscription'.tr),
          const SizedBox(height: 16),
          Align(
            alignment: AlignmentDirectional.centerStart,
            child: Text(
              'stopSubscriptionMessage'.tr,
              style: AppTextTheme.primary600(size: 14),
            ),
          ),
          SizedBox(height: AppSize.getHeight(20)),
          Align(
            alignment: AlignmentDirectional.centerStart,
            child: Text(
              '${'numberOfAllowedStops'.tr} 3',
              style: AppTextTheme.darkRed700(size: 14),
            ),
          ),
          SizedBox(height: AppSize.getHeight(100)),
          Row(
            children: [
              Expanded(
                child: CustomPrimaryButton(
                  title: 'cancel'.tr,
                  onTap: () {
                    Get.back();
                  },
                ),
              ),
              SizedBox(width: AppSize.getWidth(10)),
              Expanded(
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
                      builder: (_) => const SelectCountOfDaysBottomSheet(),
                    );
                  },
                ),
              ),
            ],
          ),
          SizedBox(height: AppSize.getHeight(32)),
        ],
      ),
    );
  }
}
