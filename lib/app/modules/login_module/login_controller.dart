import 'dart:convert';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:pea_chat/app/common/custom_exception.dart';
import 'package:pea_chat/app/data/provider/local/session.dart';
import 'package:pea_chat/app/data/provider/remote/api.dart';
import 'package:pea_chat/app/middleware/auth_controller.dart';
import 'package:pea_chat/app/utils/const.dart';
import 'package:pea_chat/app/utils/utils.dart';
/**
 * GetX Template Generator - fb.com/htngu.99
 * */

class LoginController extends GetxController {
  var usernameController = TextEditingController();
  var passwordController = TextEditingController();
  var hidePassword = true.obs;
  AuthController authController = Get.find();

  login(String username, String password) {
    Utils.showLoadingDialog();
    Api.instance
        .getToken(
            userName: username,
            password: password,
            mac: 'uuid',
            otp: '',
            grantType: 'password')
        .then((data) {
      String tokenPref = jsonEncode(data);
      Utils.saveObject(TOKEN_PREF, tokenPref);
      Session.instance.tokenResp = data;
      String bearToken = data!.accessToken!;
      log("bearToken==$bearToken");
      loginInfo(bearToken);
    }).catchError((onError) {
      Get.back();
      if (onError is CustomException) {
        CustomException e = onError;
        Utils.showToast(e.message, Get.context!);
      } else {
        Utils.showToast('Some thing wrong', Get.context!);
      }
    });
  }

  loginInfo(String bearToken) async {
    await Api.instance.getLoginInfo(bearToken: bearToken).then((value) {
      Session.instance.user = value!.result!;
      String userPref = jsonEncode(value.result!);
      Utils.saveObject(USER_INFO, userPref);
      Utils.showToast("Login Success", Get.context!);
      Get.back();
    }).catchError((onError) {
      Get.back();
      if (onError is CustomException) {
        CustomException e = onError;
        Utils.showToast(e.message, Get.context!);
      } else {
        Utils.showToast('Some thing wrong', Get.context!);
      }
    });
    authController.initMiddleWare();
  }
}
