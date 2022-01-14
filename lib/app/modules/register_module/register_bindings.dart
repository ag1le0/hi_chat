import 'package:get/get.dart';
import 'package:pea_chat/app/modules/register_module/register_controller.dart';
/**
 * GetX Template Generator - fb.com/htngu.99
 * */

class RegisterBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => RegisterController());
  }
}
