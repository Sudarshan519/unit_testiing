import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:reqres/main.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  final formKey = GlobalKey<FormState>();
  // parseJsonFromAssets(String assetsPath) async {
  // print('--- Parse json from: $assetsPath');
  // rootBundle.loadString(assetsPath).then((jsonStr) {
  //   jsonDecode(jsonStr);
  //   print(jsonStr);
  // });
  // }

  @override
  Widget build(BuildContext context) {
    // final ConfigReader configReader = Get.find();
    // print(configReader.config);
    return Scaffold(
      appBar: AppBar(
        title: Text('HomeView'),
        centerTitle: false,
        actions: [],
      ),
      body: Column(children: [
        Expanded(
          child: Obx(
            () => controller.users.isEmpty
                ? Center(child: CircularProgressIndicator())
                : ListView.builder(
                    itemCount: controller.users.length,
                    itemBuilder: (_, i) => ListTile(
                      leading: CircleAvatar(
                          backgroundImage:
                              NetworkImage(controller.users[i].avatar!)),
                      title: Text(controller.users[i].firstName!),
                    ),
                  ),
          ),
        ),
        Obx(() => controller.loading.isTrue
            ? CircularProgressIndicator()
            : SizedBox()),
        Form(
          key: formKey,
          child: Column(
            children: [
              TextFormField(
                controller: controller.usename,
                validator: (v) {
                  if (GetUtils.isBlank(v)!) return 'Name cannot be empty';
                },
              ),
              TextFormField(
                controller: controller.password,
                validator: (v) {
                  if (GetUtils.isBlank(v)!) return 'Job cannot be empty';
                },
              ),
              ElevatedButton(
                  onPressed: () {
                    // if (formKey.currentState!.validate())
                    {
                      controller.register();
                    }
                  },
                  child: Text("Signup"))
            ],
          ),
        )
      ]),
    );
  }
}
