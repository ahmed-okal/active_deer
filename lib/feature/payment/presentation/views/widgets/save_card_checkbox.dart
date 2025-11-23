import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/theme/app_text_theme.dart';
import '../../../../../core/utils/size_config.dart';
import '../../getx/controllers/credit_card_form_controller.dart';

class SaveCardCheckbox extends GetView<CreditCardFormController> {
  const SaveCardCheckbox({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        margin: EdgeInsets.symmetric(vertical: AppSize.getHeight(16)),
        child: Row(
          children: [
            SizedBox(
              width: AppSize.getWidth(24),
              height: AppSize.getHeight(24),
              child: Checkbox(
                value: controller.saveCard.value,
                onChanged: (value) => controller.toggleSaveCard(),
                activeColor: AppColors.primary,
                checkColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
            ),
            SizedBox(width: AppSize.getWidth(12)),
            Expanded(
              child: GestureDetector(
                onTap: () => controller.toggleSaveCard(),
                child: Text(
                  'saveCardForFuture'.tr,
                  style: AppTextTheme.primary500(
                    size: 14,
                  ).copyWith(color: Colors.grey.shade700),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
