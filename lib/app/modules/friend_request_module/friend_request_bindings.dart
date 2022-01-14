import 'package:get/get.dart';
import 'package:pea_chat/app/modules/friend_request_module/friend_request_controller.dart';
/**
 * GetX Template Generator - fb.com/htngu.99
 * */

class FriendRequestBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => FriendRequestController());
  }
}
