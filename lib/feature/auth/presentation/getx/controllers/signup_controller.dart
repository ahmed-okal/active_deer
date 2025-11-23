import 'package:active_deer/core/routes/app_pages.dart';
import 'package:active_deer/feature/auth/presentation/getx/controllers/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'date_picker_controller.dart';

class SignUpController extends GetxController {
  final AuthController authController = Get.find<AuthController>();
  final DatePickerController datePickerController =
      Get.find<DatePickerController>();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController idNumberController = TextEditingController();

  final RxBool obscurePasswordText = true.obs;
  final RxBool obscureConfirmPasswordText = true.obs;
  final RxBool isAgree = false.obs;

  final RxBool isLoading = false.obs;

  void togglePasswordVisibility() {
    obscurePasswordText.value = !obscurePasswordText.value;
  }

  void toggleConfirmPasswordVisibility() {
    obscureConfirmPasswordText.value = !obscureConfirmPasswordText.value;
  }

  void toggleAgree() {
    isAgree.value = !isAgree.value;
  }

  // Validation and submit methods
  bool validateForm() {
    final formValid = formKey.currentState?.validate() ?? false;

    // Validate birth date
    datePickerController.validateBirthDate();
    final birthDateValid = !datePickerController.hasError;

    return formValid && birthDateValid;
  }

  void submitSignUp() {
    if (validateForm()) {
      Get.toNamed(Routes.home);
    }
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    nameController.dispose();
    phoneController.dispose();
    idNumberController.dispose();
    super.onClose();
  }
}
