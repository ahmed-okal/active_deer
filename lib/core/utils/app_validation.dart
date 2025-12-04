import 'package:get/get.dart';

class AppValidation {
  // Email validation
  static String? email(String? value) {
    if (value == null || value.isEmpty) {
      return null;
    }
    if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
      return null;
    }
    return null;
  }

  // Strong password validation
  static String? password(String? value) {
    if (value == null || value.isEmpty) {
      return 'passwordIsRequired'.tr;
    }
    if (value.length < 8) {
      return 'passwordMustBe8Characters'.tr;
    }
    if (!RegExp(
      r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]',
    ).hasMatch(value)) {
      return 'passwordMustContainUpperLowerNumberSpecial'.tr;
    }
    return null;
  }

  // Simple password validation for login (less strict than signup)
  static String? enterPassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'passwordIsRequired'.tr;
    }
    if (value.length < 8) {
      return 'passwordMustBe8Characters'.tr;
    }
    return null;
  }

  // Confirm password validation
  static String? confirmPassword(String? value, String password) {
    if (value == null || value.isEmpty) {
      return 'confirmPasswordIsRequired'.tr;
    }
    if (value != password) {
      return 'passwordsDoNotMatch'.tr;
    }
    return null;
  }

  // Name validation
  static String? name(String? value) {
    if (value == null || value.isEmpty) {
      return 'nameIsRequired'.tr;
    }
    if (value.trim().length < 2) {
      return 'nameMustBe2Characters'.tr;
    }
    if (value.trim().length > 50) {
      return 'nameMustBeLessThan50Characters'.tr;
    }
    if (!RegExp(r'^[a-zA-Z\u0600-\u06FF\s]+$').hasMatch(value.trim())) {
      return 'nameCanOnlyContainLetters'.tr;
    }
    return null;
  }

  // Phone number validation (must start with + or 0, 10-13 digits total)
  static String? phoneNumber(String? value) {
    if (value == null || value.isEmpty) {
      return 'phoneNumberIsRequired'.tr;
    }

    // Remove spaces, dashes, and parentheses
    String cleanedPhone = value.replaceAll(RegExp(r'[\s\-\(\)]'), '');

    // Must start with + or 0
    if (!cleanedPhone.startsWith('+') && !cleanedPhone.startsWith('0')) {
      return 'phoneNumberMustStartWithPlusOr0'.tr;
    }

    // Check if it starts with +
    if (cleanedPhone.startsWith('+')) {
      // Format: +[country code][number] = 10-13 total digits
      if (!RegExp(r'^\+\d{9,12}$').hasMatch(cleanedPhone)) {
        return 'phoneNumberMustBe10to13Digits'.tr;
      }
    } else {
      // Starts with 0 - local format: 0[number] = 10-13 total digits
      if (!RegExp(r'^0\d{9,12}$').hasMatch(cleanedPhone)) {
        return 'phoneNumberMustBe10to13Digits'.tr;
      }
    }
    return null;
  }

  // ID number validation (12-16 digits)
  static String? idNumber(String? value) {
    if (value == null || value.isEmpty) {
      return 'idNumberIsRequired'.tr;
    }

    // Remove spaces and dashes
    String cleanedId = value.replaceAll(RegExp(r'[\s\-]'), '');

    // Basic validation: should be numeric and specific length (12-16 digits)
    if (!RegExp(r'^\d{12,16}$').hasMatch(cleanedId)) {
      return 'idNumberMustBe12to16Digits'.tr;
    }

    // Additional validation: check if all digits are the same (invalid ID)
    if (RegExp(r'^(\d)\1*$').hasMatch(cleanedId)) {
      return 'idNumberCannotBeAllSameDigits'.tr;
    }

    return null;
  }

  // Phone number and ID number validation combined
  static String? phoneOrId(String? value) {
    if (value == null || value.isEmpty) {
      return 'phoneOrIdIsRequired'.tr;
    }

    // Remove spaces, dashes, and parentheses
    String cleanedValue = value.replaceAll(RegExp(r'[\s\-\(\)]'), '');

    // Check if it's a phone number (starts with + or 0)
    if (cleanedValue.startsWith('+') || cleanedValue.startsWith('0')) {
      // Validate as phone number
      if (cleanedValue.startsWith('+')) {
        if (!RegExp(r'^\+\d{9,12}$').hasMatch(cleanedValue)) {
          return 'phoneNumberMustBe10to13Digits'.tr;
        }
      } else {
        if (!RegExp(r'^0\d{9,12}$').hasMatch(cleanedValue)) {
          return 'phoneNumberMustBe10to13Digits'.tr;
        }
      }
      return null;
    }

    // Otherwise, validate as ID number (12-16 digits)
    if (!RegExp(r'^\d{12,16}$').hasMatch(cleanedValue)) {
      return 'phoneOrIdNotValid'.tr;
    }

    // Check if all digits are the same (invalid ID)
    if (RegExp(r'^(\d)\1*$').hasMatch(cleanedValue)) {
      return 'idNumberCannotBeAllSameDigits'.tr;
    }

    return null;
  }

  // Birth date validation
  static String? birthDate(DateTime? value) {
    if (value == null) {
      return 'birthDateIsRequired'.tr;
    }

    final DateTime now = DateTime.now();
    final DateTime eighteenYearsAgo = DateTime(
      now.year - 18,
      now.month,
      now.day,
    );

    // Check if user is at least 18 years old
    if (value.isAfter(eighteenYearsAgo)) {
      return 'mustBe18OrOlder'.tr;
    }

    // Check if date is not in the future
    if (value.isAfter(now)) {
      return 'birthDateCannotBeFuture'.tr;
    }

    return null;
  }

  // PIN validation (6 digits)
  static String? pin(String? value) {
    if (value == null || value.isEmpty) {
      return 'pinIsRequired'.tr;
    }
    if (!RegExp(r'^\d+$').hasMatch(value)) {
      return 'pinMustBeNumeric'.tr;
    }
    if (value.length != 6) {
      return 'pinMustBe6Digits'.tr;
    }
    return null;
  }

  // Generic field validation
  static String? required(String? value) {
    if (value == null || value.isEmpty) {
      return 'fieldIsRequired'.tr;
    }
    return null;
  }

  // ===== CREDIT CARD VALIDATION METHODS =====

  // Credit card number validation
  static String? cardNumber(String? value) {
    if (value == null || value.isEmpty) {
      return 'cardNumberIsRequired'.tr;
    }

    // Remove spaces for validation
    String cleanedNumber = value.replaceAll(' ', '');

    // Check if it contains only digits
    if (!RegExp(r'^\d+$').hasMatch(cleanedNumber)) {
      return 'cardNumberMustBeNumeric'.tr;
    }

    // Check length (most cards are 16 digits, some are 13-19)
    if (cleanedNumber.length < 13 || cleanedNumber.length > 19) {
      return 'cardNumberMustBe13to19Digits'.tr;
    }

    // Basic Luhn algorithm check for card number validity
    if (!_isValidLuhn(cleanedNumber)) {
      return 'cardNumberIsNotValid'.tr;
    }

    return null;
  }

  // Credit card expiry date validation
  static String? expiryDate(String? value) {
    if (value == null || value.isEmpty) {
      return 'expiryDateIsRequired'.tr;
    }

    // Check format MM/YY
    if (!RegExp(r'^\d{2}/\d{2}$').hasMatch(value)) {
      return 'expiryDateMustBeMMYY'.tr;
    }

    final parts = value.split('/');
    final month = int.tryParse(parts[0]);
    final year = int.tryParse(parts[1]);

    if (month == null || year == null) {
      return 'expiryDateIsNotValid'.tr;
    }

    // Validate month (01-12)
    if (month < 1 || month > 12) {
      return 'expiryMonthMustBe01to12'.tr;
    }

    // Validate year (not in the past)
    final currentYear = DateTime.now().year % 100; // Get last 2 digits
    final currentMonth = DateTime.now().month;

    if (year < currentYear || (year == currentYear && month < currentMonth)) {
      return 'expiryDateCannotBePast'.tr;
    }

    return null;
  }

  // Credit card holder name validation
  static String? cardHolderName(String? value) {
    if (value == null || value.isEmpty) {
      return 'cardHolderNameIsRequired'.tr;
    }

    if (value.trim().length < 2) {
      return 'cardHolderNameMustBe2Characters'.tr;
    }

    if (value.trim().length > 50) {
      return 'cardHolderNameMustBeLessThan50Characters'.tr;
    }

    // Allow letters, spaces, hyphens, and apostrophes
    if (!RegExp(r"^[a-zA-Z\u0600-\u06FF\s\-']+$").hasMatch(value.trim())) {
      return 'cardHolderNameCanOnlyContainLetters'.tr;
    }

    return null;
  }

  // CVV validation
  static String? cvv(String? value) {
    if (value == null || value.isEmpty) {
      return 'cvvIsRequired'.tr;
    }

    // Check if it contains only digits
    if (!RegExp(r'^\d+$').hasMatch(value)) {
      return 'cvvMustBeNumeric'.tr;
    }

    // Check length (3 or 4 digits)
    if (value.length < 3 || value.length > 4) {
      return 'cvvMustBe3or4Digits'.tr;
    }

    return null;
  }

  // Complete credit card form validation
  static Map<String, String?> validateCreditCardForm({
    required String cardNumber,
    required String expiryDate,
    required String cardHolderName,
    required String cvvCode,
  }) {
    return {
      'cardNumber': AppValidation.cardNumber(cardNumber),
      'expiryDate': AppValidation.expiryDate(expiryDate),
      'cardHolderName': AppValidation.cardHolderName(cardHolderName),
      'cvv': AppValidation.cvv(cvvCode),
    };
  }

  // Helper method for Luhn algorithm validation
  static bool _isValidLuhn(String cardNumber) {
    int sum = 0;
    bool alternate = false;

    // Process digits from right to left
    for (int i = cardNumber.length - 1; i >= 0; i--) {
      int digit = int.parse(cardNumber[i]);

      if (alternate) {
        digit *= 2;
        if (digit > 9) {
          digit = (digit % 10) + 1;
        }
      }

      sum += digit;
      alternate = !alternate;
    }

    return sum % 10 == 0;
  }
}
