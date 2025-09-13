import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../core/routes/app_pages.dart';
import '../../../../core/theme/app_text_theme.dart';
import '../../../../core/utils/app_assets.dart';
import '../../../../core/utils/app_padding.dart';
import '../../../../core/utils/app_validation.dart';
import '../../../../core/utils/size_config.dart';
import '../../../../core/widgets/custom_primary_button.dart';
import '../getx/controllers/create_new_password_controller.dart';
import 'widgets/auth_field.dart';
import 'widgets/auth_sliver_app_bar.dart';

class CreateNewPasswordView extends GetView<CreateNewPasswordController> {
  const CreateNewPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Builder(
        builder: (context) {
          final isKeyboardOpen = MediaQuery.of(context).viewInsets.bottom > 0;

          return isKeyboardOpen
              ? const SizedBox.shrink()
              : Padding(
                  padding: EdgeInsetsDirectional.only(
                    bottom: AppSize.getHeight(130),
                    start: AppSize.getWidth(20),
                    end: AppSize.getWidth(20),
                  ),
                  child: CustomPrimaryButton(
                    title: 'next'.tr,
                    onTap: () {
                      Get.toNamed(Routes.passwordSuccess);
                    },
                  ),
                );
        },
      ),
      body: SafeArea(
        top: false,
        child: CustomScrollView(
          slivers: <Widget>[
            AuthSliverAppBar(),
            SliverToBoxAdapter(
              child: Padding(
                padding: AppPadding.horizontalPadding20,
                child: Column(
                  children: [
                    SizedBox(height: AppSize.getHeight(12)),
                    Center(
                      child: Text(
                        'resetPassword'.tr,
                        style: AppTextTheme.primary800(size: 20),
                      ),
                    ),
                    Center(
                      child: Text(
                        'createNewPasswordToRecoverYourAccount'.tr,
                        style: AppTextTheme.primary600(size: 16),
                      ),
                    ),
                    SizedBox(height: AppSize.getHeight(30)),
                    Obx(
                      () => AuthField(
                        hintText: '******'.tr,
                        title: 'password'.tr,
                        controller: controller.passwordController,
                        isObscure: true,
                        validator: (value) => AppValidation.password(value),
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
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.visiblePassword,
                      ),
                    ),
                    SizedBox(height: AppSize.getHeight(14)),
                    Obx(
                      () => AuthField(
                        hintText: '******'.tr,
                        title: 'confirmPassword'.tr,
                        controller: controller.confirmPasswordController,
                        isObscure: true,
                        validator: (value) => AppValidation.confirmPassword(
                          value,
                          controller.passwordController.text,
                        ),
                        suffixIcon: Padding(
                          padding: AppPadding.suffixPadding,
                          child: InkWell(
                            onTap: controller.toggleConfirmPasswordVisibility,
                            child: SvgPicture.asset(
                              height: AppSize.getHeight(24),
                              width: AppSize.getWidth(24),
                              controller.obscureConfirmPasswordText.value
                                  ? AppAssets.eyeOff
                                  : AppAssets.eyeOn,
                            ),
                          ),
                        ),
                        textInputAction: TextInputAction.done,
                        keyboardType: TextInputType.visiblePassword,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
