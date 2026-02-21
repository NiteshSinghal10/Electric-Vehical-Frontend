import 'package:get/get.dart';
import 'translations/en_translations.dart';
import 'translations/hi_translations.dart';

class AppTranslations extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
    'en_US': EnglishTranslations.translations,
    'hi_IN': HindiTranslations.translations,
  };
}
