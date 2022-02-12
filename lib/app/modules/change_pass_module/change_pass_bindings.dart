import 'package:pea_chat/app/modules/change_pass_module/change_pass_controller.dart';
import 'package:get/get.dart';
/**
 * GetX Template Generator - fb.com/htngu.99
 * */

class ChangePassBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ChangePassController());
  }
}