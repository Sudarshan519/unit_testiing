import 'package:get/get.dart';

import 'package:reqres/app/modules/home/providers/users_provider.dart';

import '../controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UsersProvider>(() => UsersProvider());
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );
  }
}
