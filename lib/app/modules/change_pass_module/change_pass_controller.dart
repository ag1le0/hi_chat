import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:pea_chat/app/common/custom_exception.dart';
import 'package:pea_chat/app/data/provider/local/session.dart';
import 'package:pea_chat/app/data/provider/remote/api.dart';
import 'package:pea_chat/app/utils/utils.dart';
/**
 * GetX Template Generator - fb.com/htngu.99
 * */

class ChangePassController extends GetxController {
  var cpFormKey = GlobalKey<FormState>();
  var cpOldPass = TextEditingController();
  var cpPass = TextEditingController();
  var cpCfPass = TextEditingController();

  var hidePass = true.obs;
  var hideOldPass = true.obs;

  void changePass() {
    Utils.showLoadingDialog();
    Api.instance
        .changePass(Session.instance.tokenResp!.accessToken!, cpOldPass.text,
            cpPass.text)
        .then((value) {
      if (value!.result == true) {
        Utils.showToast('Change password success!', Get.context!);
      } else {
        Utils.showToast('Change password fail!', Get.context!);
      }
      Get.back();
    }).catchError((onError) {
      if (onError is CustomException) {
        CustomException e = onError;
        Utils.showToast(e.message, Get.context!);
      } else {
        Utils.showToast('Some thing wrong', Get.context!);
      }
      Get.back();
    });
  }
}
