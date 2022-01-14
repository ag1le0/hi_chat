import 'package:get/get.dart';
import 'package:pea_chat/app/modules/contacts_module/contacts_controller.dart';
/**
 * GetX Template Generator - fb.com/htngu.99
 * */

class ContactsBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ContactsController());
  }
}
