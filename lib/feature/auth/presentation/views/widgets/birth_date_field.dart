import 'package:active_deer/feature/auth/presentation/getx/controllers/date_picker_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../../../../core/theme/app_text_theme.dart';
import '../../../../../core/utils/app_assets.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/size_config.dart';

class BirthDateField extends GetView<DatePickerController> {
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
              height: AppSize.getHeight(40),
              padding: EdgeInsets.symmetric(
                horizontal: AppSize.getWidth(14),
                vertical: AppSize.getHeight(8),
              ),
              decoration: BoxDecoration(
                border: Border.all(
                  color: controller.hasError
                      ? AppColors.red
                      : AppColors.primary,
                  width: AppSize.getWidth(1.5),
                ),
                borderRadius: BorderRadius.circular(6.77),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    controller.selectedBirthDate.value != null
                        ? controller.formattedBirthDate
                        : 'selectBirthDate'.tr,
                    style: AppTextTheme.primary600(size: 12).copyWith(
                      color: controller.selectedBirthDate.value != null
                          ? AppColors.primary
                          : AppColors.darkGrey,
                    ),
                    textAlign: TextAlign.right,
                  ),
                  SvgPicture.asset(
                    AppAssets.date,
                    height: AppSize.getHeight(27),
                    width: AppSize.getWidth(27),
                    colorFilter: ColorFilter.mode(
                      AppColors.primary,
                      BlendMode.srcIn,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        // Error text display
        SizedBox(
          height: AppSize.getHeight(16),
          child: Obx(
            () => controller.hasError
                ? Padding(
                    padding: EdgeInsets.only(top: AppSize.getHeight(2)),
                    child: Text(
                      controller.errorMessage.value,
                      style: AppTextTheme.secondary400(size: 10).copyWith(
                        color: AppColors.red,
                        height: 1.0,
                        fontWeight: FontWeight.w400,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  )
                : const SizedBox.shrink(),
          ),
        ),
      ],
    );
  }
}
