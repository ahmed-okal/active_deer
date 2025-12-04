import 'package:get/get.dart';
import '../../../../core/services/language_service.dart';

class LanguageController extends GetxController {
  final LanguageService languageService = Get.find();

  void changeLanguage(String languageCode) {
    languageService.changeLanguage(languageCode);
  }
}