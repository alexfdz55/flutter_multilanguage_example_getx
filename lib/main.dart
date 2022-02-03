import 'package:flutter/material.dart';
import 'package:flutter_multilanguage_example_getx/src/pages/home_page.dart';
import 'package:flutter_multilanguage_example_getx/src/services/localization_service.dart';
import 'package:flutter_multilanguage_example_getx/src/share_prefs/storage_prefs.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = new StoragePrefs();
  await prefs.initPrefs();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Multilanguage App',
      debugShowCheckedModeBanner: false,
      translations: LocalizationService(), // your translations
      locale: LocalizationService()
          .getCurrentLocale(), // translations will be displayed in that locale
      fallbackLocale: Locale(
        'es',
        'ES',
      ), // specify the fallback locale in case an invalid locale is selected.
      home: HomePage(),
    );
  }
}
