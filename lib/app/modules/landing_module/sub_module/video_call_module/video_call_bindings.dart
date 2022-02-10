import 'package:get/get.dart';
import 'package:pea_chat/app/modules/landing_module/sub_module/video_call_module/video_call_controller.dart';
/**
 * GetX Template Generator - fb.com/htngu.99
 * */

class VideoCallBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => VideoCallController());
  }
}
