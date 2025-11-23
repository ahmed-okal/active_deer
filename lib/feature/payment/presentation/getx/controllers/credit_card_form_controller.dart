import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../core/utils/app_validation.dart';
import '../../../../../core/widgets/failed_snack_bar.dart';
import '../../../domain/entities/card_token_request.dart';

class CreditCardFormController extends GetxController {
  final RxString cardNumber = ''.obs;
  final RxString expiryDate = ''.obs;
  final RxString cardHolderName = ''.obs;
  final RxString cvvCode = ''.obs;
  final RxBool showBackView = false.obs;

  final TextEditingController cardNumberController = TextEditingController();
  final TextEditingController expiryDateController = TextEditingController();
  final TextEditingController cardHolderController = TextEditingController();
  final TextEditingController cvvController = TextEditingController();

  final FocusNode cardNumberFocus = FocusNode();
  final FocusNode expiryDateFocus = FocusNode();
  final FocusNode cardHolderFocus = FocusNode();
  final FocusNode cvvFocus = FocusNode();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  // Save card option
  final RxBool saveCard = false.obs;

  @override
  void onInit() {
    super.onInit();
    setupListeners();
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

  void setupListeners() {
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

  void formatCardNumber(String value) {
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

    cardNumberController.value = TextEditingValue(
      text: result,
      selection: TextSelection.collapsed(offset: result.length),
    );

    cardNumber.value = result;
  }

  void formatExpiryDate(String value) {
    String formatted = value.replaceAll('/', '');
    if (formatted.length > 4) {
      formatted = formatted.substring(0, 4);
    }

    if (formatted.length >= 2) {
      formatted = '${formatted.substring(0, 2)}/${formatted.substring(2)}';
    }
    expiryDateController.value = TextEditingValue(
      text: formatted,
      selection: TextSelection.collapsed(offset: formatted.length),
    );
    expiryDate.value = formatted;
  }

  void updateCardHolderName(String value) {
    cardHolderName.value = value;
  }

  void updateCvv(String value) {
    cvvCode.value = value;
  }

  // Validate individual fields using AppValidation
  String? validateCardNumber() => AppValidation.cardNumber(cardNumber.value);
  String? validateExpiryDate() => AppValidation.expiryDate(expiryDate.value);
  String? validateCardHolderName() =>
      AppValidation.cardHolderName(cardHolderName.value);
  String? validateCvv() => AppValidation.cvv(cvvCode.value);

  // Validate entire form
  bool validateForm() {
    final validationResults = AppValidation.validateCreditCardForm(
      cardNumber: cardNumber.value,
      expiryDate: expiryDate.value,
      cardHolderName: cardHolderName.value,
      cvvCode: cvvCode.value,
    );

    // Check if any field has validation errors
    for (final entry in validationResults.entries) {
      if (entry.value != null) {
        failedSnaskBar(entry.value!);
        return false;
      }
    }

    return true;
  }

  // Get validation errors for UI display
  Map<String, String?> getValidationErrors() {
    return AppValidation.validateCreditCardForm(
      cardNumber: cardNumber.value,
      expiryDate: expiryDate.value,
      cardHolderName: cardHolderName.value,
      cvvCode: cvvCode.value,
    );
  }

  // Toggle save card option
  void toggleSaveCard() {
    saveCard.value = !saveCard.value;
  }

  // Create card token request from current form data
  CardTokenRequest createCardTokenRequest() {
  final expiryParts = expiryDate.value.split('/');
  String month = expiryParts.isNotEmpty ? expiryParts[0] : '';
  String year = expiryParts.length > 1 ? expiryParts[1] : '';

  // normalize year to two digits if user entered 2027 -> 27
  if (year.length == 4) {
    year = year.substring(2);
  }

  return CardTokenRequest(
    cardNumber: cardNumber.value.replaceAll(' ', ''),
    expiryMonth: month.padLeft(2, '0'),
    expiryYear: year.padLeft(2, '0'),
    cvv: cvvCode.value,
    holderName: cardHolderName.value.trim(),
  );
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

  Map<String, String> getCardData() {
    return {
      'cardNumber': cardNumber.value.replaceAll(' ', ''),
      'expiryDate': expiryDate.value,
      'cardHolderName': cardHolderName.value,
      'cvvCode': cvvCode.value,
    };
  }
}
