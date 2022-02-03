import 'package:flutter/material.dart';
import 'package:flutter_multilanguage_example_getx/src/share_prefs/storage_prefs.dart';
import 'package:get/get.dart';

import 'lang/es_ES.dart';
import 'lang/en_US.dart';
import 'lang/bt_BR.dart';

class LocalizationService extends Translations {
  final prefs = StoragePrefs();
  // Default locale
  static final locale = Locale('es', 'ES');

  // fallbackLocale saves the day when the locale gets in trouble
  static final fallbackLocale = Locale('es', 'ES');

  // Supported languages
  // Needs to be same order with locales
  static final langs = ['Español', 'English', 'Portugués'];

  // Supported locales
  // Needs to be same order with langs
  static final locales = [
    Locale('es', 'ES'),
    Locale('en', 'US'),
    Locale('pt', 'BR'),
  ];

  // Keys and their translations
  // Translations are separated maps in `lang` file
  @override
  Map<String, Map<String, String>> get keys => {
        'es_ES': esES, // lang/hi_IN.dart
        'en_US': enUS, // lang/en_us.dart
        'pt_BR': btBR, // lang/ar_AE.dart
      };

  // Gets locale from language, and updates the locale
  void changeLocale(String lang) {
    final locale = getLocaleFromLanguage(lang);

    prefs.language = lang;

    Get.updateLocale(locale!);
  }

  // Finds language in `langs` list and returns it as Locale
  Locale? getLocaleFromLanguage(String lang) {
    for (int i = 0; i < langs.length; i++) {
      if (lang == langs[i]) return locales[i];
    }
    return Get.locale;
  }

  Locale getCurrentLocale() {
    Locale defaultLocale;

    if (prefs.language != '') {
      final locale =
          LocalizationService().getLocaleFromLanguage(prefs.language);

      defaultLocale = locale!;
    } else {
      defaultLocale = Locale(
        'es',
        'ES',
      );
    }

    return defaultLocale;
  }

  String getCurrentLang() {
    return prefs.language != '' ? prefs.language : "Español";
  }
}
