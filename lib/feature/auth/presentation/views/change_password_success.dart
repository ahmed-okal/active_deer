import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/routes/app_pages.dart';
import '../../../../core/widgets/success_page.dart';

class PasswordChangeSuccessPage extends StatelessWidget {
  const PasswordChangeSuccessPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SuccessPage(
      message: 'passwordChangedSuccessfully'.tr,
      onFinishNavigation: () {
        Get.offAllNamed(Routes.home);
      },
    );
  }
}
