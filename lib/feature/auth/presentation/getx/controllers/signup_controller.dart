import 'package:active_deer/feature/auth/presentation/getx/controllers/auth_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController {
  final AuthController authController = Get.find<AuthController>();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController idNumberController = TextEditingController();

  final RxBool obscurePasswordText = true.obs;
  void togglePasswordVisibility() {
    obscurePasswordText.value = !obscurePasswordText.value;
  }

  final RxBool obscureConfirmPasswordText = true.obs;
  void toggleConfirmPasswordVisibility() {
    obscureConfirmPasswordText.value = !obscureConfirmPasswordText.value;
  }

  final RxBool isAgree = false.obs;
  void toggleAgree() {
    isAgree.value = !isAgree.value;
  }
}
