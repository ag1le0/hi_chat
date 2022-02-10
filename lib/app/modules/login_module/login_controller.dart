import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:pea_chat/app/common/custom_exception.dart';
import 'package:pea_chat/app/data/provider/local/session.dart';
import 'package:pea_chat/app/data/provider/remote/api.dart';
import 'package:pea_chat/app/routes/app_pages.dart';
import 'package:pea_chat/app/utils/ota_update.dart';
import 'package:pea_chat/app/utils/utils.dart';
/**
 * GetX Template Generator - fb.com/htngu.99
 * */

class LoginController extends GetxController {
  var usernameController = TextEditingController();
  var passwordController = TextEditingController();
  var hidePassword = true.obs;

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
      // isLoading(false);
      // log("data");/
      // log('isloading: $isLoading');
      // this.tokenResp = data;
      //String tokenPref = jsonEncode(data);
      // pref.setString(TOKEN_PREF, tokenPref);
      // _saveToken(tokenPref);
      //Utils.saveObject(TOKEN_PREF, tokenPref);
      Session.instance.tokenResp = data;
      String bearToken = data!.accessToken!;
      log("bearToken==$bearToken");

      // Get.toNamed(Routes.LOGIN_FIRST);
      // if (isConfirm) {
      //   pref!.setBool(CONFIRM_FINGER, true);
      //   Navigator.pop(context);
      // } else

      loginInfo(bearToken);
    }).catchError((onError) {
      Get.back();
      if (onError is CustomException) {
        CustomException e = onError;
        //Utils.showToast(e.message, Get.context!);
        // if (e is BadRequestException && e.message == 'PWD_EXPIRED') {
        //   Get.toNamed(Routes.CHANGE_PASS_EXP);
        // }
      } else {
        //Utils.showToast('Some thing wrong', Get.context!);
      }
      log(onError.toString());
    });
  }

  loginInfo(String bearToken) async {
    await Api.instance.getLoginInfo(bearToken: bearToken).then((value) {
      log(value!.toJson((value) => value.toJson()).toString());
      Session.instance.user = value.result;
      //String userPref = jsonEncode(value);
      // pref.setString(USER_INFO, jsonEncode(userInfo));
      // Utils.saveObject(USER_INFO, userPref);
      // Utils.showToast("Login Success", Get.context!);
      //Get.offAllNamed(Routes.LANDING, arguments: bearToken);
      Get.offAllNamed(Routes.LANDING);
    }).catchError((onError) {
      if (onError is CustomException) {
        CustomException e = onError;
        //   Utils.showToast(e.message, Get.context!);
      } else {
        //  Utils.showToast('Some thing wrong, can\'t login', Get.context!);
      }
      log(onError.toString());
      Get.back();
    });
    //authController.initMiddleWare();
  }

  void download() {
    OtaUpdate()
        .execute(
            "https://10.224.81.70:6443/fiistore/ws-data/images/OPPM/OPPM.apk")
        .listen((event) {
      log(event.toString());
    });
  }

  // Future<String> getUDID() async {
  //   udid.value = await FlutterUdid.udid;
  //   log('data: $udid');
  //   return udid.value;
  // }
}
