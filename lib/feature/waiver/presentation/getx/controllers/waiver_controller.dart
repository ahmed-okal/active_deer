import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WaiverController extends GetxController {
  final formKey = GlobalKey<FormState>();

  // Text controllers for form fields
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneOrIdController = TextEditingController();
  final TextEditingController reasonController = TextEditingController();

  bool validateForm() {
    final form = formKey.currentState;
    if (form == null) return false;
    return form.validate();
  }

  @override
  void onClose() {
    nameController.dispose();
    phoneOrIdController.dispose();
    reasonController.dispose();
    super.onClose();
  }
}
