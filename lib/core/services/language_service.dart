import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class LanguageService extends GetxController {
  final _box = GetStorage();
  final _key = 'language';

  // Make reactive language code public
  final RxString languageCode = 'en'.obs;

  @override
  void onInit() {
    super.onInit();
    // Initialize from storage on startup
    languageCode.value = _loadLanguageFromBox();
    // Set initial locale
    updateLocale();
  }

  /// Load language from storage
  String _loadLanguageFromBox() => _box.read(_key) ?? 'ar';

  /// Save language to storage
  void _saveLanguage(String langCode) {
    languageCode.value = langCode;
    _box.write(_key, langCode);
  }

  /// Update locale without changing the saved language
  void updateLocale() {
    Get.updateLocale(locale);
  }

  /// Get current locale
  Locale get locale {
    return languageCode.value == 'ar'
        ? const Locale('ar', 'EG')
        : const Locale('en', 'US');
  }

  /// Change app language
  void changeLanguage(String langCode) {
    _saveLanguage(langCode);
    updateLocale();
  }
}
