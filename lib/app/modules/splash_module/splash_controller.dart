import 'package:get/get.dart';
import 'package:pea_chat/app/middleware/auth_controller.dart';
/**
 * GetX Template Generator - fb.com/htngu.99
 * */

class SplashController extends GetxController {
  AuthController authController = Get.find();
  @override
  void onInit() {
    Future.delayed(const Duration(seconds: 1), () async {
      init();
    });

    // TODO: implement onInit
    super.onInit();
  }

  void init() async {
    //change language
    // Utils.getStringObject('langCode').then((value) {
    //   if (value != null && value != Get.deviceLocale!.languageCode) {
    //     AppTranslations.changeLocale(value);
    //   }
    // });

    authController.initMiddleWare();
  }
}
