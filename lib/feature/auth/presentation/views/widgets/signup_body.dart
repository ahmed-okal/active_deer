import 'package:active_deer/core/widgets/custom_primary_button.dart';
import 'package:active_deer/feature/auth/presentation/getx/controllers/auth_controller.dart';
import 'package:active_deer/feature/auth/presentation/views/widgets/auth_field.dart';
import 'package:active_deer/feature/auth/presentation/views/widgets/birth_date_field.dart';
import 'package:active_deer/feature/auth/presentation/views/widgets/terms_andconditions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../../../../core/theme/app_text_theme.dart';
import '../../../../../core/utils/app_assets.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_padding.dart';
import '../../../../../core/utils/app_validation.dart';
import '../../../../../core/utils/size_config.dart';

class SignUpBody extends GetView<AuthController> {
  const SignUpBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppPadding.horizontalPadding20,
      child: Form(
        key: controller.signUpController.formKey,
        child: Column(
          spacing: AppSize.getHeight(10),
          children: [
            AuthField(
              hintText: 'enterFullName'.tr,
              title: 'name'.tr,
              controller: controller.signUpController.nameController,
              isObscure: false,
              validator: (value) => AppValidation.name(value),
              keyboardType: TextInputType.name,
              textInputAction: TextInputAction.next,
            ),
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
            AuthField(
              hintText: 'mail'.tr,
              title: 'enterMail'.tr,
              controller: controller.signUpController.emailController,
              isObscure: false,
              validator: (value) => AppValidation.email(value),
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.next,
            ),
            AuthField(
              hintText: 'enterIdNumber'.tr,
              title: 'idNumber'.tr,
              controller: controller.signUpController.idNumberController,
              isObscure: false,
              validator: (value) => AppValidation.idNumber(value),
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.numberWithOptions(signed: false),
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            ),
            const BirthDateField(),
            Obx(
              () => AuthField(
                hintText: '******'.tr,
                title: 'password'.tr,
                controller: controller.signUpController.passwordController,
                isObscure:
                    controller.signUpController.obscurePasswordText.value,
                validator: (value) => AppValidation.password(value),
                suffixIcon: Padding(
                  padding: AppPadding.suffixPadding,
                  child: InkWell(
                    onTap: controller.signUpController.togglePasswordVisibility,
                    child: SvgPicture.asset(
                      height: AppSize.getHeight(24),
                      width: AppSize.getWidth(24),
                      controller.signUpController.obscurePasswordText.value
                          ? AppAssets.eyeOff
                          : AppAssets.eyeOn,
                    ),
                  ),
                ),
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.visiblePassword,
              ),
            ),
            Obx(
              () => AuthField(
                hintText: '******'.tr,
                title: 'confirmPassword'.tr,
                controller:
                    controller.signUpController.confirmPasswordController,
                isObscure: controller
                    .signUpController
                    .obscureConfirmPasswordText
                    .value,
                validator: (value) => AppValidation.confirmPassword(
                  value,
                  controller.signUpController.passwordController.text,
                ),
                suffixIcon: Padding(
                  padding: AppPadding.suffixPadding,
                  child: InkWell(
                    onTap: controller
                        .signUpController
                        .toggleConfirmPasswordVisibility,
                    child: SvgPicture.asset(
                      height: AppSize.getHeight(24),
                      width: AppSize.getWidth(24),
                      controller
                              .signUpController
                              .obscureConfirmPasswordText
                              .value
                          ? AppAssets.eyeOff
                          : AppAssets.eyeOn,
                    ),
                  ),
                ),
                textInputAction: TextInputAction.done,
                keyboardType: TextInputType.visiblePassword,
              ),
            ),
            const TermsAndConditions(),
            SizedBox(height: AppSize.getHeight(70)),
            Obx(
              () => CustomPrimaryButton(
                title: 'signUp'.tr,
                onTap: controller.signUpController.submitSignUp,
                isLoading: controller.signUpController.isLoading.value,
                isEnable: controller.signUpController.isAgree.value,
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
