import 'package:active_deer/feature/auth/presentation/getx/controllers/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../core/routes/app_pages.dart';

class LoginController extends GetxController {
  final AuthController authController = Get.find<AuthController>();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final RxBool obscureText = true.obs;
  void togglePasswordVisibility() {
    obscureText.value = !obscureText.value;
  }

  // Validation and submit methods
  bool validateForm() {
    return formKey.currentState?.validate() ?? false;
  }

  void submitLogin() {
    if (validateForm()) {
      Get.offAllNamed(Routes.home);
    }
  }

  @override
  void onClose() {
    phoneController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}
