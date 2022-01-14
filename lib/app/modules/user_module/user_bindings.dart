import 'package:get/get.dart';
import 'package:pea_chat/app/modules/user_module/user_controller.dart';
/**
 * GetX Template Generator - fb.com/htngu.99
 * */

class UserBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => UserController());
  }
}
