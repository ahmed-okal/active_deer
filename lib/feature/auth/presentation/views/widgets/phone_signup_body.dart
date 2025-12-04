import 'package:active_deer/core/widgets/custom_primary_button.dart';
import 'package:active_deer/feature/auth/presentation/getx/controllers/auth_controller.dart';
import 'package:active_deer/feature/auth/presentation/views/widgets/auth_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../../../../../core/routes/app_pages.dart';
import '../../../../../core/theme/app_text_theme.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_padding.dart';
import '../../../../../core/utils/app_validation.dart';
import '../../../../../core/utils/size_config.dart';

class PhoneSignUpBody extends GetView<AuthController> {
  const PhoneSignUpBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppPadding.horizontalPadding20,
      child: Form(
        key: controller.signUpController.phoneFormKey,
        child: Column(
          spacing: AppSize.getHeight(10),
          children: [
            AuthField(
              title: 'phoneNumber'.tr,
              hintText: 'enterPhoneNumber'.tr,
              controller: controller.signUpController.phoneController,
              isObscure: false,
              validator: (value) => AppValidation.phoneNumber(value),
              keyboardType: TextInputType.phone,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              textInputAction: TextInputAction.next,
            ),
            SizedBox(height: AppSize.getHeight(230)),
            Obx(
              () => CustomPrimaryButton(
                title: 'signUp'.tr,
                onTap: () {
                  Get.toNamed(
                    Routes.enterPin,
                    arguments: {
                      'phone': controller.signUpController.phoneController.text,
                      'flow': 'signUp',
                    },
                  );
                },
                isLoading: controller.signUpController.isLoading.value,
              ),
            ),
            SizedBox(height: AppSize.getHeight(10)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'alreadyHaveAnAccount'.tr,
                  style: AppTextTheme.primary600(size: 13),
                ),
                InkWell(
                  onTap: () {
                    controller.changePage(0);
                  },
                  child: Text(
                    ' ${'login'.tr}',
                    style: AppTextTheme.primary800(size: 13).copyWith(
                      decorationColor: AppColors.primary,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: AppSize.getHeight(70)),
          ],
        ),
      ),
    );
  }
}
