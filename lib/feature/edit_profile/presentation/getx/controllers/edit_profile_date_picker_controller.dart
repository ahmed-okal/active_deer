import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../core/utils/app_validation.dart';

class EditProfileDatePickerController extends GetxController {
  final Rx<DateTime?> selectedBirthDate = Rx<DateTime?>(null);
  final RxString errorMessage = ''.obs;

  void selectBirthDate(BuildContext context) async {
    final DateTime now = DateTime.now();
    final DateTime hundredYearsAgo = DateTime(
      now.year - 100,
      now.month,
      now.day,
    );
    final DateTime eighteenYearsAgo = DateTime(
      now.year - 18,
      now.month,
      now.day,
    );

    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedBirthDate.value ?? eighteenYearsAgo,
      firstDate: hundredYearsAgo,
      lastDate: now,
      locale: Get.locale,
    );

    if (picked != null) {
      selectedBirthDate.value = picked;
      // Clear error when user selects a date
      errorMessage.value = '';
      // Validate the selected date
      validateBirthDate();
    }
  }

  void validateBirthDate() {
    final error = AppValidation.birthDate(selectedBirthDate.value);
    errorMessage.value = error ?? '';
  }

  bool get hasError => errorMessage.value.isNotEmpty;

  String get formattedBirthDate {
    if (selectedBirthDate.value == null) return '';
    final date = selectedBirthDate.value!;
    return '${date.day.toString().padLeft(2, '0')}/${date.month.toString().padLeft(2, '0')}/${date.year}';
  }
}
