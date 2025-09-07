import 'package:active_deer/feature/auth/presentation/getx/controllers/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final AuthController authController = Get.find<AuthController>();

  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final RxBool obscureText = true.obs;
  void togglePasswordVisibility() {
    obscureText.value = !obscureText.value;
  }
}
