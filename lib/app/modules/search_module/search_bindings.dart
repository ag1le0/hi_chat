import 'package:get/get.dart';
import 'package:pea_chat/app/modules/search_module/search_controller.dart';
/**
 * GetX Template Generator - fb.com/htngu.99
 * */

class SearchBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SearchController());
  }
}
