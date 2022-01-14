import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:pea_chat/app/data/model/user.dart';
import 'package:pea_chat/app/data/provider/local/session.dart';
import 'package:pea_chat/app/data/provider/remote/api.dart';
/**
 * GetX Template Generator - fb.com/htngu.99
 * */

class ContactsController extends GetxController {
  var pageController = PageController();
  var listFriend = <User>[].obs;
  var addFriendRequestNumber = 0.obs;

  @override
  void onInit() {
    Api.instance
        .getFriendList(bearToken: Session.instance.tokenResp!.accessToken)
        .then((value) {
      if (value != null && value.result != null) {
        listFriend.assignAll(value.result!);
      }
    });

    Api.instance
        .addFriendRequestNumber(
      bearToken: Session.instance.tokenResp!.accessToken,
    )
        .then((value) {
      if (value != null && value.result != null) {
        addFriendRequestNumber.value = value.result!;
      }
    });
    // TODO: implement onInit
    super.onInit();
  }
}
