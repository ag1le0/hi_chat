import 'package:get/get.dart';
import 'package:pea_chat/app/modules/chat_module/chat_controller.dart';
/**
 * GetX Template Generator - fb.com/htngu.99
 * */

class ChatBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ChatController());
  }
}
