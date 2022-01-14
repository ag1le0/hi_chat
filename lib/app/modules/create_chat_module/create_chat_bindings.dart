import 'package:get/get.dart';
import 'package:pea_chat/app/modules/create_chat_module/create_chat_controller.dart';
/**
 * GetX Template Generator - fb.com/htngu.99
 * */

class CreateChatBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CreateChatController());
  }
}
