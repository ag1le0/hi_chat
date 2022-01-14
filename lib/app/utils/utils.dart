import 'package:flutter/material.dart';
import 'package:flutter_udid/flutter_udid.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Utils {
  static Future<SharedPreferences> initSharePre() async {
    final pref = await SharedPreferences.getInstance();
    return pref;
  }

  static void saveObject(String key, String value) async {
    final pref = await SharedPreferences.getInstance();
    pref.setString(key, value);
  }

  static Future<String?> getStringObject(String key) async {
    final pref = await SharedPreferences.getInstance();
    return pref.getString(key);
  }

  static Future<String> getUDID() async {
    String udid = await FlutterUdid.udid;
    return udid;
  }

  static Future<void> showToast(String message, BuildContext context) async {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM);
  }

  static Future<void> showLoadingDialog() async {
    showDialog(
      context: Get.overlayContext!,
      barrierDismissible: false,
      builder: (_) => WillPopScope(
        onWillPop: () async => false,
        child: const Center(
          child: SizedBox(
            width: 60,
            height: 60,
            child: CircularProgressIndicator(
              strokeWidth: 5,
            ),
          ),
        ),
      ),
    );
  }
}

String splitNameLetter(String name) {
  var split = name.trim().split(' ');
  return split.last.split('').first;
}
