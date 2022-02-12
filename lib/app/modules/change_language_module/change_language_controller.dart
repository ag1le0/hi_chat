import 'package:get/get.dart';
import 'package:pea_chat/app/translations/app_translations.dart';
/**
 * GetX Template Generator - fb.com/htngu.99
 * */

class ChangeLanguageController extends GetxController {
  var langeSelect = ''.obs;

  var langeList = AppTranslations.langs;
  void changeLanguage() {
    AppTranslations.changeLocale(langeSelect.value);
    Get.back();
  }
}
