import 'package:flutter/material.dart';
import 'package:flutter_multilanguage_example_getx/src/pages/home_controller.dart';
import 'package:flutter_multilanguage_example_getx/src/services/localization_service.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  final _ = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter Multilanguage Example Getx"),
        backgroundColor: Colors.indigo,
        centerTitle: true,
      ),
      body: Center(
        child: Obx(() => _selectLanguage()),
      ),
    );
  }

  Widget _selectLanguage() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "hello_title".tr,
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Language",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Text("       "),
            new DropdownButton<String>(
              items: LocalizationService.langs.map((String value) {
                return new DropdownMenuItem<String>(
                  value: value,
                  child: new Text(value),
                );
              }).toList(),
              value: _.language.value,
              underline: Container(color: Colors.transparent),
              isExpanded: false,
              onChanged: (newVal) {
                _.language.value = newVal!;
                LocalizationService().changeLocale(newVal);
              },
            ),
          ],
        )
      ],
    );
  }
}
