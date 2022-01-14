import 'package:pea_chat/app/modules/video_call_module/video_call_controller.dart';
import 'package:get/get.dart';
/**
 * GetX Template Generator - fb.com/htngu.99
 * */

class VideoCallBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => VideoCallController());
  }
}