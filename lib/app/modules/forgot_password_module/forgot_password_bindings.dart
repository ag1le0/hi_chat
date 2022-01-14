import 'package:get/get.dart';
import 'package:pea_chat/app/modules/forgot_password_module/forgot_password_controller.dart';
/**
 * GetX Template Generator - fb.com/htngu.99
 * */

class ForgotPasswordBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ForgotPasswordController());
  }
}
