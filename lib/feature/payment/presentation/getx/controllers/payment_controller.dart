import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'payment_processing_controller.dart';

class PaymentController extends GetxController {
  // ------------------- Observables -------------------
  final cardNumber = ''.obs;
  final expiryDate = ''.obs;
  final cardHolderName = ''.obs;
  final cvvCode = ''.obs;
  final showBackView = false.obs;

  // Payment processing controller
  late final PaymentProcessingController _paymentProcessingController;

  // ------------------- Text Controllers -------------------
  final cardNumberController = TextEditingController();
  final expiryDateController = TextEditingController();
  final cardHolderController = TextEditingController();
  final cvvController = TextEditingController();

  // ------------------- Focus Nodes -------------------
  final cardNumberFocus = FocusNode();
  final expiryDateFocus = FocusNode();
  final cardHolderFocus = FocusNode();
  final cvvFocus = FocusNode();

  final formKey = GlobalKey<FormState>();

  @override
  void onInit() {
    super.onInit();
    _paymentProcessingController = Get.find<PaymentProcessingController>();
    _setupListeners();
  }

  @override
  void onClose() {
    cardNumberController.dispose();
    expiryDateController.dispose();
    cardHolderController.dispose();
    cvvController.dispose();

    cardNumberFocus.dispose();
    expiryDateFocus.dispose();
    cardHolderFocus.dispose();
    cvvFocus.dispose();
    super.onClose();
  }

  void _setupListeners() {
    // Text controller listeners to update observables
    cardNumberController.addListener(() {
      cardNumber.value = cardNumberController.text;
    });

    expiryDateController.addListener(() {
      expiryDate.value = expiryDateController.text;
    });

    cardHolderController.addListener(() {
      cardHolderName.value = cardHolderController.text;
    });

    cvvController.addListener(() {
      cvvCode.value = cvvController.text;
    });

    // Focus listeners
    cvvFocus.addListener(() {
      showBackView.value = cvvFocus.hasFocus;
    });
  }

  // ------------------- Payment Processing -------------------
  Future<void> processPayment() async {
    if (!validateForm()) {
      return;
    }

    final cardData = getCardData();
    await _paymentProcessingController.processPayment(cardData);
  }

  // ------------------- Form Utils -------------------
  void updateCardNumber(String value) {
    // Format card number with spaces
    String formatted = value.replaceAll(' ', '');
    if (formatted.length > 16) {
      formatted = formatted.substring(0, 16);
    }

    String result = '';
    for (int i = 0; i < formatted.length; i++) {
      if (i > 0 && i % 4 == 0) {
        result += ' ';
      }
      result += formatted[i];
    }

    cardNumber.value = result;

    // Update controller without triggering listener
    if (cardNumberController.text != result) {
      cardNumberController.value = TextEditingValue(
        text: result,
        selection: TextSelection.collapsed(offset: result.length),
      );
    }
  }

  void updateExpiryDate(String value) {
    // Format expiry date as MM/YY
    String formatted = value.replaceAll('/', '');
    if (formatted.length > 4) {
      formatted = formatted.substring(0, 4);
    }

    if (formatted.length >= 2) {
      formatted = '${formatted.substring(0, 2)}/${formatted.substring(2)}';
    }

    expiryDate.value = formatted;

    // Update controller without triggering listener
    if (expiryDateController.text != formatted) {
      expiryDateController.value = TextEditingValue(
        text: formatted,
        selection: TextSelection.collapsed(offset: formatted.length),
      );
    }
  }

  void updateCardHolderName(String value) {
    // Convert to uppercase for card display
    String uppercaseValue = value.toUpperCase();
    cardHolderName.value = uppercaseValue;

    // Update controller without triggering listener
    if (cardHolderController.text != uppercaseValue) {
      cardHolderController.value = TextEditingValue(
        text: uppercaseValue,
        selection: TextSelection.collapsed(offset: uppercaseValue.length),
      );
    }
  }

  void updateCvv(String value) {
    cvvCode.value = value;
    showBackView.value = value.isNotEmpty;
  }

  bool validateForm() => formKey.currentState?.validate() ?? false;

  Map<String, String> getCardData() {
    return {
      'cardNumber': cardNumber.value.replaceAll(' ', ''),
      'expiryDate': expiryDate.value,
      'cardHolderName': cardHolderName.value,
      'cvvCode': cvvCode.value,
    };
  }

  void clearForm() {
    cardNumberController.clear();
    expiryDateController.clear();
    cardHolderController.clear();
    cvvController.clear();

    cardNumber.value = '';
    expiryDate.value = '';
    cardHolderName.value = '';
    cvvCode.value = '';
    showBackView.value = false;
  }

  // ------------------- Getters for Payment Processing -------------------
  RxBool get isLoading => _paymentProcessingController.isLoading;
  RxDouble get amount => _paymentProcessingController.amount;
  RxString get description => _paymentProcessingController.description;

  Map<String, dynamic> get paymentSummary =>
      _paymentProcessingController.getPaymentSummary();
}
