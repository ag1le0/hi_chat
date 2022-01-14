import 'package:get/get.dart';
import 'package:pea_chat/app/modules/contacts_module/contacts_controller.dart';
import 'package:pea_chat/app/modules/home_module/home_controller.dart';
import 'package:pea_chat/app/modules/landing_module/landing_controller.dart';
import 'package:pea_chat/app/modules/settings_module/settings_controller.dart';
/**
 * GetX Template Generator - fb.com/htngu.99
 * */

class LandingBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LandingController());
    Get.lazyPut(() => HomeController());
    Get.lazyPut(() => ContactsController());
    Get.lazyPut(() => SettingsController());
  }
}
