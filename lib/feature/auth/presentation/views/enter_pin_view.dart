import 'package:active_deer/feature/auth/presentation/getx/controllers/enter_pin_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';

import '../../../../core/routes/app_pages.dart';
import '../../../../core/theme/app_text_theme.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_padding.dart';
import '../../../../core/utils/size_config.dart';
import '../../../../core/widgets/custom_primary_button.dart';
import 'widgets/auth_sliver_app_bar.dart';

class EnterPinView extends GetView<EnterPinController> {
  const EnterPinView({super.key});

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
                      Get.toNamed(Routes.createNewPassword);
                    },
                  ),
                );
        },
      ),
      body: CustomScrollView(
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
                      'enterPinCode'.tr,
                      style: AppTextTheme.primary800(size: 20),
                    ),
                  ),
                  Center(
                    child: Text(
                      'enterPinCodeThatWasSentToYourPhone'.tr,
                      style: AppTextTheme.primary600(size: 16),
                    ),
                  ),
                  SizedBox(height: AppSize.getHeight(42)),
                  Directionality(
                    textDirection: TextDirection.ltr,
                    child: Pinput(
                      autofocus: true,
                      obscureText: true,
                      showCursor: true,
                      obscuringWidget: Container(
                        height: AppSize.getHeight(14),
                        width: AppSize.getWidth(14),
                        decoration: BoxDecoration(
                          color: AppColors.primary,
                          shape: BoxShape.circle,
                        ),
                      ),
                      defaultPinTheme: PinTheme(
                        width: AppSize.getWidth(53),
                        height: AppSize.getHeight(50),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: AppColors.primary,
                            width: AppSize.getHeight(1.5),
                          ),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        textStyle: AppTextTheme.primary500(size: 24),
                      ),
                      length: 6,
                      forceErrorState: true,
                      pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
                      validator: (pin) {
                        if (pin == '000000') return null;
                        return 'invalidPinCode'.tr;
                      },
                    ),
                  ),
                  SizedBox(height: AppSize.getHeight(8)),
                  Obx(
                    () => Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              controller.resendMessage,
                              style: AppTextTheme.primary600(size: 13),
                            ),
                            if (controller.canResend)
                              InkWell(
                                onTap: controller.onResendCodeTapped,
                                child: Text(
                                  ' ${'resendCode'.tr}',
                                  style: AppTextTheme.primary700(size: 13)
                                      .copyWith(
                                        decoration: TextDecoration.underline,
                                        decorationColor: AppColors.primary,
                                      ),
                                ),
                              ),
                          ],
                        ),
                        if (controller.isTimerRunning.value)
                          Padding(
                            padding: EdgeInsets.only(top: AppSize.getHeight(8)),
                            child: Text(
                              '${'resendCodeIn'.tr} ${controller.formattedTime}',
                              style: AppTextTheme.primary600(size: 13),
                            ),
                          ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
