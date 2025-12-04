import 'package:active_deer/feature/auth/data/models/forget_password_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../domain/entities/forget_password_entity.dart';
import '../../../domain/use_case/forget_password_use_case.dart';

class ForgotPasswordController extends GetxController {
  final TextEditingController phoneController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final RxBool isLoading = false.obs;
  ForgetPasswordModel? forgetPasswordModel = ForgetPasswordModel();
  final ForgetPasswordUseCase forgetPasswordUseCase;

  ForgotPasswordController(this.forgetPasswordUseCase);

  Future<void> forgotPassword() async {
    if (!validateForm()) return;
    isLoading.value = true;
    final result = await forgetPasswordUseCase.call(
      forgetPasswordEntity: ForgetPasswordEntity(
        mobile: phoneController.text,
        loading: isLoading,
      ),
    );
    result.fold(
      (failure) {
        isLoading.value = false;
      },
      (data) {
        isLoading.value = false;
        forgetPasswordModel = data;
      },
    );
  }

  bool validateForm() {
    return formKey.currentState?.validate() ?? false;
  }
}
