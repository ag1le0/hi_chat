import 'dart:developer';

import 'package:get/get.dart';
import 'package:pea_chat/app/common/custom_exception.dart';
import 'package:pea_chat/app/data/model/friend_request_response.dart';
import 'package:pea_chat/app/data/provider/local/session.dart';
import 'package:pea_chat/app/data/provider/remote/api.dart';
import 'package:pea_chat/app/utils/utils.dart';
/**
 * GetX Template Generator - fb.com/htngu.99
 * */

class FriendRequestController extends GetxController {
  var receiveFriendRequest = <FriendRequestResponse>[].obs;

  @override
  void onInit() {
    Api.instance
        .addFriendRequestList(
            bearToken: Session.instance.tokenResp!.accessToken)
        .then((value) {
      if (value != null && value.result != null) {
        receiveFriendRequest.assignAll(value.result!);
      }
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

  void acceptRequest(int id) {
    Api.instance
        .acceptFriendRequest(
            requestId: id, bearToken: Session.instance.tokenResp!.accessToken)
        .then((value) {
      log(value!.toJson((value) => value).toString());
    }).catchError((onError) {
      if (onError is CustomException) {
        CustomException e = onError;
        Utils.showToast(e.message, Get.context!);
      } else {
        Utils.showToast('Some thing wrong', Get.context!);
      }
    });
  }

  void rejectRequest(int id) {
    Api.instance
        .rejectFriendRequest(
            requestId: id, bearToken: Session.instance.tokenResp!.accessToken)
        .then((value) {
      log(value!.toJson((value) => value).toString());
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
