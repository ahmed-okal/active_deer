import 'package:active_deer/core/utils/app_assets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../core/widgets/custom_primary_button.dart';
import '../../getx/controllers/payment_controller.dart';

class PaymentButton extends GetView<PaymentController> {
  const PaymentButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => CustomPrimaryButton(
        showIcon: true,
        icon: AppAssets.sar,
        title: '${'payNow'.tr} ${controller.amount.value.toStringAsFixed(2)}',
        isLoading: controller.isLoading.value,
        onTap: controller.isLoading.value ? null : controller.processPayment,
      ),
    );
  }
}
