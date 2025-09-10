import 'package:get/get.dart';

class AppValidation {
  // Email validation
  static String? email(String? value) {
    if (value == null || value.isEmpty) {
      return 'emailIsRequired'.tr;
    }
    if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
      return 'emailIsNotValid'.tr;
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
}
