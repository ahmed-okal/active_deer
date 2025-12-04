import 'package:active_deer/core/widgets/loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../getx/controllers/payment_controller.dart';
import 'widgets/payment_view_body.dart';

class PaymentView extends GetView<PaymentController> {
  const PaymentView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => controller.isLoading.value
            ? const Center(child: LoadingWidget())
            : const PaymentViewBody(),
      ),
    );
  }
}
