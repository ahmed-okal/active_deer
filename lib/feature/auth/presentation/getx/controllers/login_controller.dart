import 'package:active_deer/feature/auth/data/models/log_in_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../core/errors/exceptions.dart';
import '../../../../../core/errors/failure.dart';
import '../../../../../core/routes/app_pages.dart';
import '../../../../../core/services/cash_data_source.dart';
import '../../../../../core/utils/constants.dart';
import '../../../../../core/widgets/failed_snack_bar.dart';
import '../../../domain/entities/log_in_entity.dart';
import '../../../domain/use_case/log_in_use_case.dart';

class LoginController extends GetxController {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final LogInUseCase logInUseCase;
  final CashDataSource cashDataSource = Get.put(CashDataSource());
  LogInModel logInModel = LogInModel();

  LoginController(this.logInUseCase);

  final RxBool isLoading = false.obs;

  Future<void> logIn() async {
    isLoading.value = true;
    final result = await logInUseCase.call(
      logInEntity: LogInEntity(
        tenantId: AppConstants.tenantId,
        companyId: AppConstants.companyId,
        branchId: AppConstants.branchId,
        loading: isLoading,
        phoneNumber: phoneController.text,
        password: passwordController.text,
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
        logInModel = data;
        submitLogin();
      },
    );
  }

  final RxBool obscureText = true.obs;
  void togglePasswordVisibility() {
    obscureText.value = !obscureText.value;
  }

  bool validateForm() {
    return formKey.currentState?.validate() ?? false;
  }

  void submitLogin() {
    if (validateForm()) {
      Get.offAllNamed(Routes.home);
    }
  }
}
