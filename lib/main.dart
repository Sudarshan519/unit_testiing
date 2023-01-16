import 'dart:convert';
import 'dart:io';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:reqres/app/routes/app_pages.dart';

void main() {
  runApp(
    GetMaterialApp(
      title: "Application",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    ),
  );
  appInit();
}

appInit() async {
  final ConfigReader configReader = ConfigReader();
  await configReader.init();
  Get.put(configReader);
}

class ConfigReader {
  Map<String, dynamic>? config;
  parseJsonFromAssets(String assetsPath) async {
    print('--- Parse json from: $assetsPath');
    rootBundle.loadString(assetsPath).then((jsonStr) {
      print(jsonStr);
      config = jsonDecode(jsonStr);
    });
  }

  String get getApiKey => config!['API_KEY'];
  init() {
    parseJsonFromAssets("config/app_config.json");
  }
}
