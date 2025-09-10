import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/routes/app_pages.dart';
import '../../../../core/widgets/success_page.dart';

class BookingSuccessPage extends StatelessWidget {
  const BookingSuccessPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SuccessPage(
      message: 'bookingSuccess'.tr,
      onFinishNavigation: () {
        Get.offAllNamed(Routes.home);
      },
    );
  }
}
