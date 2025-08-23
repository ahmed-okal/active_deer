import 'package:active_deer/core/widgets/custom_primary_button.dart';
import 'package:active_deer/feature/auth/login/presentation/getx/controllers/signup_controller.dart';
import 'package:active_deer/feature/auth/login/presentation/views/widgets/auth_field.dart';
import 'package:active_deer/feature/auth/login/presentation/views/widgets/birth_date_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../../../../../core/theme/app_text_theme.dart';
import '../../../../../../core/utils/app_assets.dart';
import '../../../../../../core/utils/app_colors.dart';
import '../../../../../../core/utils/app_padding.dart';
import '../../../../../../core/utils/app_validation.dart';
import '../../../../../../core/utils/size_config.dart';

class SignUpBody extends GetView<SignUpController> {
  const SignUpBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppPadding.horizontalPadding,
      child: Column(
        spacing: AppSize.getHeight(10),
        children: [
          AuthField(
            hintText: 'enterFullName'.tr,
            title: 'name'.tr,
            controller: controller.nameController,
            isObscure: false,
          ),
          AuthField(
            hintText: 'phoneNumber'.tr,
            title: 'enterPhoneNumber'.tr,
            controller: controller.phoneController,
            isObscure: false,
          ),
          AuthField(
            hintText: 'mail'.tr,
            title: 'enterMail'.tr,
            controller: controller.emailController,
            isObscure: false,
          ),
          AuthField(
            hintText: 'enterIdNumber'.tr,
            title: 'idNumber'.tr,
            controller: controller.idNumberController,
            isObscure: true,
          ),
          const BirthDateField(),
          AuthField(
            hintText: '******'.tr,
            title: 'password'.tr,
            controller: controller.passwordController,
            isObscure: true,
            suffixIcon: Padding(
              padding: AppPadding.suffixPadding,
              child: InkWell(
                onTap: controller.togglePasswordVisibility,
                child: SvgPicture.asset(
                  height: AppSize.getHeight(24),
                  width: AppSize.getWidth(24),
                  controller.obscurePasswordText.value
                      ? AppAssets.eyeOff
                      : AppAssets.eyeOn,
                ),
              ),
            ),
            validator: AppValidation.password,
          ),
          AuthField(
            hintText: '******'.tr,
            title: 'confirmPassword'.tr,
            controller: controller.confirmPasswordController,
            isObscure: true,
            suffixIcon: Padding(
              padding: AppPadding.suffixPadding,
              child: InkWell(
                onTap: controller.togglePasswordVisibility,
                child: SvgPicture.asset(
                  height: AppSize.getHeight(24),
                  width: AppSize.getWidth(24),
                  controller.obscureConfirmPasswordText.value
                      ? AppAssets.eyeOff
                      : AppAssets.eyeOn,
                ),
              ),
            ),
          ),
          Row(
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
              Text(
                ' ${'termsAndConditions'.tr}',
                style: AppTextTheme.primary800(size: 12).copyWith(
                  decorationColor: AppColors.primary,
                  decoration: TextDecoration.underline,
                ),
              ),
            ],
          ),
          SizedBox(height: AppSize.getHeight(70)),
          CustomPrimaryButton(title: 'signUp'.tr, onTap: () {}),
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
                  controller.authController.changePage(0);
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
    );
  }
}
