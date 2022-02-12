import 'package:pea_chat/app/modules/change_language_module/change_language_controller.dart';
import 'package:get/get.dart';
/**
 * GetX Template Generator - fb.com/htngu.99
 * */

class ChangeLanguageBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ChangeLanguageController());
  }
}