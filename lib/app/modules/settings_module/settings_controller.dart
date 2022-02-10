import 'dart:developer';
import 'dart:io';

import 'package:get/get.dart';
import 'package:pea_chat/app/data/provider/local/session.dart';
import 'package:pea_chat/app/data/provider/remote/api.dart';
import 'package:pea_chat/app/modules/landing_module/landing_controller.dart';
import 'package:pea_chat/app/routes/app_pages.dart';
import 'package:pea_chat/app/utils/utils.dart';
/**
 * GetX Template Generator - fb.com/htngu.99
 * */

class SettingsController extends GetxController {
  final LandingController _landingController = Get.find();

  void logout() {
    Utils.showLoadingDialog();
    Future.delayed(const Duration(seconds: 1)).then((value) {
      _landingController.notifyController.close();
      _landingController.messageController.close();
      _landingController.client.close();

      if (_landingController.notifySubcription != null) {
        _landingController.notifySubcription!.cancel();
      }
      if (_landingController.messageSubcription != null) {
        _landingController.messageSubcription!.cancel();
      }
      Api.instance.unregisterChannel(
          bearToken: Session.instance.tokenResp!.accessToken,
          data: {
            'deviceCode': '9cb1d4fad4254f099f03c05ebc04476b'
          }).then((value) async {});
      Get.back();
      Get.offAllNamed(Routes.LOGIN);
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
      });
    }).catchError((onError) {
      log(onError.toString());
    });
  }
}
