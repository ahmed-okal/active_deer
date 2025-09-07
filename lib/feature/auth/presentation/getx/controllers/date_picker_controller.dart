import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DatePickerController extends GetxController {
  final Rx<DateTime?> selectedBirthDate = Rx<DateTime?>(null);

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
    }
  }

  String get formattedBirthDate {
    if (selectedBirthDate.value == null) return '';
    final date = selectedBirthDate.value!;
    return '${date.day.toString().padLeft(2, '0')}/${date.month.toString().padLeft(2, '0')}/${date.year}';
  }
}
