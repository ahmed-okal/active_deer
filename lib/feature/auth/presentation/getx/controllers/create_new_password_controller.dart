import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreateNewPasswordController extends GetxController {
  final RxBool obscurePasswordText = true.obs;
  final RxBool obscureConfirmPasswordText = true.obs;
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  void togglePasswordVisibility() {
    obscurePasswordText.value = !obscurePasswordText.value;
  }

  void toggleConfirmPasswordVisibility() {
    obscureConfirmPasswordText.value = !obscureConfirmPasswordText.value;
  }
}
