import 'package:active_deer/core/routes/app_pages.dart';
import 'package:active_deer/feature/auth/data/models/sign_up_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../core/errors/exceptions.dart';
import '../../../../../core/errors/failure.dart';
import '../../../../../core/services/cash_data_source.dart';
import '../../../../../core/utils/constants.dart';
import '../../../../../core/widgets/failed_snack_bar.dart';
import '../../../domain/entities/sign_up_entity.dart';
import '../../../domain/use_case/sign_up_use_case.dart';
import 'date_picker_controller.dart';

class SignUpController extends GetxController {
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
  final CashDataSource cashDataSource = Get.put(CashDataSource());

  final SignUpUseCase signUpUseCase;
  SignUpModel signUpModel = SignUpModel();

  SignUpController(this.signUpUseCase);

  Future<void> signUp() async {
    isLoading.value = true;
    final result = await signUpUseCase.call(
      SignUpEntity(
        tenantId: AppConstants.tenantId,
        companyId: AppConstants.companyId,
        branchId: AppConstants.branchId,
        loading: isLoading,
        username: emailController.text.split('@')[0],
        name: nameController.text,
        email: emailController.text,
        mobile: phoneController.text,
        password: passwordController.text,
        idNumber: idNumberController.text,
        dateOfBirth: datePickerController.formattedBirthDate,
        role: AppConstants.role,
      ),
    );
    result.fold(
      (failure) {
        String errorMessage;
        if (failure is ServerFailure) {
          errorMessage = failure.message;
        } else if (failure is AppExceptions) {
          errorMessage = failure.message;
        } else {
          errorMessage = 'somethingWentWrongPleaseTryAgainLater'.tr;
        }

        failedSnaskBar(errorMessage);
      },
      (data) {
        signUpModel = data;
        Get.toNamed(Routes.home);
      },
    );
  }

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

  void submitSignUp() async {
    if (validateForm()) {
      await signUp();
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
