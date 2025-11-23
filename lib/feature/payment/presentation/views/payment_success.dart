import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../../../core/routes/app_pages.dart';
import '../../../../core/widgets/success_page.dart';

class PaymentSuccessView extends StatelessWidget {
  const PaymentSuccessView({super.key});

  @override
  Widget build(BuildContext context) {
    return SuccessPage(
      message: 'paymentSuccess'.tr,
      onFinishNavigation: () {
        Get.offAllNamed(Routes.home);
      },
    );
  }
}
