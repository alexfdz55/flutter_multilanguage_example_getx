import 'package:flutter_multilanguage_example_getx/src/services/localization_service.dart';
import 'package:get/state_manager.dart';

class HomeController extends GetxController {
  Rx<String> language = ''.obs;

  @override
  void onInit() {
    language.value = LocalizationService().getCurrentLang();
    super.onInit();
  }
}
