import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reqres/app/modules/home/providers/auth_provider.dart';
import 'package:reqres/app/modules/home/providers/users_provider.dart';
import 'package:reqres/app/modules/home/users_model.dart';
import 'package:reqres/main.dart';

class HomeController extends GetxController {
  final count = 0.obs;
  var users = <User>[].obs;
  var loading = false.obs;
  UsersProvider _usersProvider = Get.find();
  final ConfigReader configReader = Get.find();
  late AuthProvider authProvider;
  final TextEditingController usename = TextEditingController();
  final TextEditingController password = TextEditingController();
  @override
  void onInit() {
    super.onInit();
    final AuthProvider authProvider = AuthProvider(configReader.getApiKey);
    getUsers();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;

  getUsers() async {
    var user_data = await _usersProvider.getUsers();
    users(user_data!.data != null ? user_data.data : []);
  }

  void register() async {
    loading.toggle();

    try {
      var resp = await authProvider.signup(usename.text, password.text);
      loading.toggle();
      Get.rawSnackbar(
          message: "Login Successful", backgroundColor: Colors.green);
      print(resp.error);
    } on ServerExeption catch (e) {
      loading.toggle();
      switch (e.message) {
        case "INVALID_EMAIL":
          Get.rawSnackbar(message: "Email address is badly formatted.");

          break;

        case "WEAK_PASSWORD":
          Get.rawSnackbar(message: "Password should be at least 6 characters.");
          break;
        case "WEAK_PASSWORD":
          Get.rawSnackbar(message: "Password should be at least 6 characters.");
          break;
        default:
      }
    } catch (e) {
      loading.toggle();
      print(e);
    }
  }

  void login() async {
    loading.toggle();
    try {
      var resp = await authProvider.login(usename.text, password.text);
      loading.toggle();
      Get.rawSnackbar(
          message: "Login Successful", backgroundColor: Colors.green);
    } on ServerExeption catch (e) {
      loading(false);
      switch (e.message) {
        case "INVALID_EMAIL":
          Get.rawSnackbar(message: "Email address is badly formatted.");
          break;

        case "WEAK_PASSWORD":
          Get.rawSnackbar(message: "Password should be at least 6 characters.");
          break;
        case "EMAIL_NOT_FOUND":
          Get.rawSnackbar(message: "User not registered.");
          break;
        case "INVALID_PASSWORD":
          Get.rawSnackbar(message: "Credentials do not match.");
          break;
        default:
      }
    } catch (e) {}
  }
}

class HomeRepository {
  final HomeApi api;

  HomeRepository(this.api);

  getAll() {
    return api.getAll();
  }

  // getId(id) {
  //   return api.getId(id);
  // }

  // delete(id) {
  //   return api.delete(id);
  // }

  // edit(obj) {
  //   return api.edit(obj);
  // }

  // add(obj) {
  //   return api.add(obj);
  // }
}

class HomeApi extends GetConnect {
  @override
  void onInit() {
    // All request will pass to jsonEncode so Users.fromJson()
    httpClient.defaultDecoder = (map) => UsersResponse.fromJson;
    httpClient.baseUrl = 'https://reqres.in/';
  }

  getAll() {}
}
