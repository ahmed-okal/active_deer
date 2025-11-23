import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../core/theme/app_text_theme.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_padding.dart';
import '../../../../../core/utils/size_config.dart';
import '../../../../../core/widgets/bottom_sheet_title.dart';
import '../../../../../core/widgets/custom_primary_button.dart';
import 'select_count_of_days_bottom_sheet.dart';
import 'stop_subscription_success_bottom_sheet.dart';

class ConfirmSuspensionBottomSheet extends StatelessWidget {
  const ConfirmSuspensionBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppPadding.allPadding20,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          BottomSheetTitle(title: 'stopSubscription'.tr),
          SizedBox(height: AppSize.getHeight(12)),
          Align(
            alignment: AlignmentDirectional.centerStart,
            child: RichText(
              text: TextSpan(
                style: AppTextTheme.primary600(size: 14),
                children: [
                  TextSpan(text: '${'yourSubscriptionWillBeStoppedat'.tr} '),
                  TextSpan(text: '['),
                  TextSpan(
                    text: 'premiumSubscription'.tr,
                    style: AppTextTheme.primary700(size: 14),
                  ),
                  TextSpan(text: '] '),
                  TextSpan(text: '${'for'.tr} '),
                  TextSpan(text: '5', style: AppTextTheme.primary700(size: 14)),
                  TextSpan(text: ' ${'day'.tr} '),
                  TextSpan(text: '${'startedFrom'.tr} '),
                  TextSpan(
                    text: '[29/4/2025]',
                    style: AppTextTheme.primary700(size: 14),
                  ),
                  TextSpan(text: ' ${'until'.tr} '),
                  TextSpan(
                    text: '[3/5/2025]',
                    style: AppTextTheme.primary700(size: 14),
                  ),
                  TextSpan(
                    text:
                        '\n${'noDaysWillBeDeductedFromYourSubscriptionDuringThisPeriod'.tr}',
                    style: AppTextTheme.primary600(size: 14),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: AppSize.getHeight(100)),
          Row(
            children: [
              Expanded(
                child: CustomPrimaryButton(
                  title: 'editStopDuration'.tr,
                  onTap: () {
                    Get.back();
                    Future.delayed(
                      Duration.zero,
                      () => showModalBottomSheet(
                        context: Get.context!,
                        isScrollControlled: false,
                        backgroundColor: AppColors.background,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(20),
                          ),
                        ),
                        builder: (_) {
                          return const SelectCountOfDaysBottomSheet();
                        },
                      ),
                    );
                  },
                ),
              ),
              SizedBox(width: AppSize.getWidth(10)),
              Expanded(
                child: CustomPrimaryButton(
                  title: 'confirmStopping'.tr,
                  onTap: () {
                    Get.back();
                    Future.delayed(
                      Duration.zero,
                      () => showModalBottomSheet(
                        context: Get.context!,
                        isScrollControlled: false,
                        backgroundColor: AppColors.background,
                        isDismissible: false,
                        enableDrag: false,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(20),
                          ),
                        ),
                        builder: (_) => StopSubscriptionSuccessBottomSheet(
                          onFinished: () {
                            Get.back();
                          },
                        ),
                      ),
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
