import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_navigation/src/root/internacionalization.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:pea_chat/app/utils/utils.dart';

import '../../app/translations/en_US/en_us_translations.dart';
import '../../app/translations/vi_VN/vi_vn_translations.dart';
/**
 * GetX Template Generator - fb.com/htngu.99
 * */

class AppTranslations extends Translations {
  static Locale? locale = _getLocaleFromLanguage();
  static final fallbackLocale = Locale('en', 'US');

  static final langCodes = [
    'en',
    'vi',
    //'zh',
  ];

  static final locales = [
    Locale('en', 'US'),
    Locale('vi', 'VN'),
    //Locale('zh', 'CN'),
  ];

  static final langs = LinkedHashMap.from({
    'en': 'English',
    'vi': 'Tiếng Việt',
    //'zh': 'Chinese',
  });

  static void changeLocale(String langCode) {
    locale = _getLocaleFromLanguage(langCode: langCode);
    Utils.saveObject('langCode', langCode);
    return Get.updateLocale(locale!);
  }

  @override
  // TODO: implement keys
  Map<String, Map<String, String>> get keys => {
        'en_US': enUs,
        'vi_VN': viVn,
        //'zh_CN': zhCN,
      };

  static Locale? _getLocaleFromLanguage({String? langCode}) {
    var lang = langCode ?? Get.deviceLocale!.languageCode;
    for (int i = 0; i < langCodes.length; i++) {
      if (lang == langCodes[i]) return locales[i];
    }
    return Get.locale;
  }
}
