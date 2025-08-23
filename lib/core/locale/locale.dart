import 'package:get/get.dart';
import 'ar_translations.dart';
import 'en_translations.dart';

class MyLocale implements Translations {
  final ArTranslations _arTranslations = ArTranslations();
  final EnTranslations _enTranslations = EnTranslations();

  @override
  Map<String, Map<String, String>> get keys {
    Map<String, Map<String, String>> allTranslations = {};

    // Add Arabic translations
    allTranslations.addAll(_arTranslations.keys);

    // Add English translations
    allTranslations.addAll(_enTranslations.keys);

    return allTranslations;
  }
}
