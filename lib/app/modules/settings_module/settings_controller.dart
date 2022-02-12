import 'dart:io';

import 'package:get/get.dart';
import 'package:pea_chat/app/common/custom_exception.dart';
import 'package:pea_chat/app/data/model/media_data.dart';
import 'package:pea_chat/app/data/provider/local/session.dart';
import 'package:pea_chat/app/data/provider/remote/api.dart';
import 'package:pea_chat/app/middleware/auth_controller.dart';
import 'package:pea_chat/app/modules/landing_module/landing_controller.dart';
import 'package:pea_chat/app/utils/utils.dart';
/**
 * GetX Template Generator - fb.com/htngu.99
 * */

class SettingsController extends GetxController {
  final LandingController _landingController = Get.find();
  AuthController authController = Get.find();

  Rx<MediaResponse?> avatar = Rx(null);

  @override
  void onInit() {
    avatar.value = Session.instance.user!.avatar;
    // TODO: implement onInit
    super.onInit();
  }

  void logout() {
    Utils.showLoadingDialog();
    Future.delayed(const Duration(seconds: 1)).then((value) async {
      _landingController.notifyController.close();
      _landingController.messageController.close();
      _landingController.client.close();

      if (_landingController.notifySubcription != null) {
        _landingController.notifySubcription!.cancel();
      }
      if (_landingController.messageSubcription != null) {
        _landingController.messageSubcription!.cancel();
      }

      String udid = await Utils.getUDID();

      Api.instance.unregisterChannel(
          bearToken: Session.instance.tokenResp!.accessToken,
          param: {'deviceCode': udid}).then((value) async {});

      Session.instance.user = null;
      Session.instance.tokenResp = null;
      var pref = await Utils.initSharePre();
      pref.clear();
      authController.initMiddleWare();
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

  void uploadAvatar(File image) {
    Api.instance
        .uploadAvatar(
            bearToken: Session.instance.tokenResp!.accessToken, file: image)
        .then((value) {
      Api.instance
          .getLoginInfo(
        bearToken: Session.instance.tokenResp!.accessToken,
      )
          .then((value) {
        Session.instance.user = value?.result;
        avatar.value = Session.instance.user!.avatar;
        Utils.showToast('Upload Success!', Get.context!);
      });
    }).catchError((onError) {
      if (onError is CustomException) {
        CustomException e = onError;
        Utils.showToast(e.message, Get.context!);
      } else {
        Utils.showToast('Some thing wrong', Get.context!);
      }
    });
  }
}
