import 'dart:developer';

import 'package:get/get.dart';
import 'package:pea_chat/app/data/model/friend_request_response.dart';
import 'package:pea_chat/app/data/provider/local/session.dart';
import 'package:pea_chat/app/data/provider/remote/api.dart';
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
    });
  }

  void rejectRequest(int id) {
    Api.instance
        .rejectFriendRequest(
            requestId: id, bearToken: Session.instance.tokenResp!.accessToken)
        .then((value) {
      log(value!.toJson((value) => value).toString());
    });
  }
}
