import 'dart:convert';
import 'dart:io';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:reqres/app/modules/home/controllers/home_controller.dart';
import 'package:reqres/app/modules/home/providers/auth_provider.dart';
import 'package:reqres/app/modules/home/providers/user_provider.dart';
import 'package:reqres/app/routes/app_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await appInit();
  runApp(
    GetMaterialApp(
      title: "Application",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      // initialBinding: InitialBindigns(),
    ),
  );
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
    await rootBundle.loadString(assetsPath).then((jsonStr) {
      config = jsonDecode(jsonStr);
    });
  }

  String get getApiKey => config?['API_KEY'];
  init() async {
    await parseJsonFromAssets("config/app_config.json");
  }
}

class InitialBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => UserProvider());

    Get.lazyPut(() => HomeController());
  }
}
