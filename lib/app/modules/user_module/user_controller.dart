import 'dart:developer';

import 'package:get/get.dart';
import 'package:pea_chat/app/common/custom_exception.dart';
import 'package:pea_chat/app/data/model/user.dart';
import 'package:pea_chat/app/data/provider/local/session.dart';
import 'package:pea_chat/app/data/provider/remote/api.dart';
import 'package:pea_chat/app/utils/utils.dart';
/**
 * GetX Template Generator - fb.com/htngu.99
 * */

class UserController extends GetxController {
  late int idUser;
  var user = User().obs;

  @override
  void onInit() {
    idUser = int.parse(Get.parameters['idUser'].toString());

    Api.instance
        .getUserInfo(
            id: idUser, bearToken: Session.instance.tokenResp!.accessToken)
        .then((value) {
      user.value = value!.result!;
    }).catchError((onError) {
      if (onError is CustomException) {
        CustomException e = onError;
        Utils.showToast(e.message, Get.context!);
      } else {
        Utils.showToast('Some thing wrong', Get.context!);
      }
    });
    // TODO: implement onInit
    super.onInit();
  }

  sendAddFriendRequest() {
    Api.instance
        .sendAddFriendRequest(
            friendId: idUser,
            bearToken: Session.instance.tokenResp!.accessToken)
        .then((value) {})
        .catchError((error) {
      log(error.toString());
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
