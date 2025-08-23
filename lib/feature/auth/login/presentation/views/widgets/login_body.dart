import 'package:active_deer/feature/auth/login/presentation/views/widgets/auth_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../../../core/theme/app_text_theme.dart';
import '../../../../../../core/utils/app_assets.dart';
import '../../../../../../core/utils/app_colors.dart';
import '../../../../../../core/utils/app_padding.dart';
import '../../../../../../core/utils/app_validation.dart';
import '../../../../../../core/utils/size_config.dart';
import '../../../../../../core/widgets/custom_primary_button.dart';
import '../../getx/controllers/login_controller.dart';

class LoginBody extends GetView<LoginController> {
  const LoginBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppPadding.horizontalPadding,
      child: Column(
        children: [
          AuthField(
            hintText: 'enterPhoneNumberMembership'.tr,
            title: 'phoneNumberMebership'.tr,
            controller: controller.phoneController,
            isObscure: false,
            validator: AppValidation.phoneOrId,
          ),
          SizedBox(height: AppSize.getHeight(9)),
          Obx(
            () => AuthField(
              hintText: '******'.tr,
              style: AppTextTheme.primary700(size: 18),
              title: 'password'.tr,
              controller: controller.passwordController,
              isObscure: controller.obscureText.value,
              validator: AppValidation.name,
              suffixIcon: Padding(
                padding: AppPadding.suffixPadding,
                child: InkWell(
                  onTap: controller.togglePasswordVisibility,
                  child: SvgPicture.asset(
                    height: AppSize.getHeight(24),
                    width: AppSize.getWidth(24),
                    controller.obscureText.value
                        ? AppAssets.eyeOff
                        : AppAssets.eyeOn,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: AppSize.getHeight(10)),
          Align(
            alignment: AlignmentDirectional.centerEnd,
            child: Text(
              'forgotPassword'.tr,
              style: AppTextTheme.primary700(size: 12).copyWith(
                decoration: TextDecoration.underline,
                decorationColor: AppColors.primary,
              ),
            ),
          ),
          SizedBox(height: AppSize.getHeight(105)),
          CustomPrimaryButton(title: 'login'.tr, onTap: () {}),
          SizedBox(height: AppSize.getHeight(10)),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'dontHaveAnAccount'.tr,
                style: AppTextTheme.primary600(size: 13),
              ),
              InkWell(
                onTap: () {
                  controller.authController.changePage(1);
                },
                child: Text(
                  ' ${'signUp'.tr}',
                  style: AppTextTheme.primary700(size: 13).copyWith(
                    decoration: TextDecoration.underline,
                    decorationColor: AppColors.primary,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: AppSize.getHeight(10)),
        ],
      ),
    );
  }
}
