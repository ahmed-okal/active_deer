import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreateNewPasswordController extends GetxController {
  final RxBool obscurePasswordText = true.obs;
  final RxBool obscureConfirmPasswordText = true.obs;
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  bool validateForm() {
    return formKey.currentState?.validate() ?? false;
  }

  void togglePasswordVisibility() {
    obscurePasswordText.value = !obscurePasswordText.value;
  }

  void toggleConfirmPasswordVisibility() {
    obscureConfirmPasswordText.value = !obscureConfirmPasswordText.value;
  }
}
