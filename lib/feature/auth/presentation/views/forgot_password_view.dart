import 'package:active_deer/core/utils/app_padding.dart';
import 'package:active_deer/core/widgets/custom_primary_button.dart';
import 'package:active_deer/feature/auth/presentation/views/widgets/auth_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../../core/routes/app_pages.dart';
import '../../../../core/theme/app_text_theme.dart';
import '../../../../core/utils/app_validation.dart';
import '../../../../core/utils/size_config.dart';
import '../getx/controllers/forgot_password_controller.dart';
import 'widgets/auth_sliver_app_bar.dart';

class ForgotPasswordView extends GetView<ForgotPasswordController> {
  const ForgotPasswordView({super.key});

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
                      if (controller.validateForm()) {
                        Get.toNamed(Routes.enterPin);
                      }
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
                        'forgotPassword'.tr,
                        style: AppTextTheme.primary800(size: 20),
                      ),
                    ),
                    Center(
                      child: Text(
                        'dontWorryEnterYourPhoneNumber'.tr,
                        style: AppTextTheme.primary600(size: 16),
                      ),
                    ),
                    SizedBox(height: AppSize.getHeight(42)),
                    Form(
                      key: controller.formKey,
                      child: AuthField(
                        title: 'phoneNumber'.tr,
                        hintText: 'enterPhoneNumber'.tr,
                        controller: controller.phoneController,
                        isObscure: false,
                        validator: (value) => AppValidation.phoneNumber(value),
                        textInputAction: TextInputAction.done,
                        keyboardType: TextInputType.phone,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                        ],
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
