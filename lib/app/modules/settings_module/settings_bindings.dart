import 'package:get/get.dart';
import 'package:pea_chat/app/modules/settings_module/settings_controller.dart';
/**
 * GetX Template Generator - fb.com/htngu.99
 * */

class SettingsBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SettingsController());
  }
}
