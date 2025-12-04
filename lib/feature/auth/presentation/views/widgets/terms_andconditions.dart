import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../core/routes/app_pages.dart';
import '../../../../../core/theme/app_text_theme.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/size_config.dart';
import '../../getx/controllers/signup_controller.dart';

class TermsAndConditions extends GetView<SignUpController> {
  const TermsAndConditions({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Obx(
          () => SizedBox(
            width: AppSize.getWidth(24),
            height: AppSize.getHeight(24),
            child: Transform.scale(
              scale: 1.1,
              child: Checkbox(
                checkColor: AppColors.background,
                fillColor: WidgetStateProperty.all(
                  controller.isAgree.value
                      ? AppColors.primary
                      : AppColors.background,
                ),
                activeColor: AppColors.background,
                value: controller.isAgree.value,
                onChanged: (value) {
                  controller.toggleAgree();
                },
              ),
            ),
          ),
        ),
        Text('iAgreeToAll'.tr, style: AppTextTheme.primary500(size: 12)),
        InkWell(
          onTap: () {
            Get.toNamed(Routes.termsAndConditions);
          },
          child: Text(
            ' ${'termsAndConditions'.tr}',
            style: AppTextTheme.primary800(size: 12).copyWith(
              decorationColor: AppColors.primary,
              decoration: TextDecoration.underline,
            ),
          ),
        ),
      ],
    );
  }
}
