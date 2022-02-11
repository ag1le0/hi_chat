import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:pea_chat/app/common/custom_exception.dart';
import 'package:pea_chat/app/data/model/friend_request_response.dart';
import 'package:pea_chat/app/data/model/user.dart';
import 'package:pea_chat/app/data/provider/local/session.dart';
import 'package:pea_chat/app/data/provider/remote/api.dart';
import 'package:pea_chat/app/modules/landing_module/landing_controller.dart';
import 'package:pea_chat/app/utils/utils.dart';
/**
 * GetX Template Generator - fb.com/htngu.99
 * */

class ContactsController extends GetxController {
  var pageController = PageController();
  var listFriend = <User>[].obs;
  var addFriendRequestNumber = 0.obs;
  LandingController _landingController = Get.find();

  @override
  void onInit() {
    _fetchListFriend();
    _fetchAddFriendRequest();

    _landingController.notifyController.stream.listen((event) {
      if (event.body is User) {
        _fetchListFriend();
      }
      if (event.body is FriendRequestResponse) {
        _fetchAddFriendRequest();
      }
    });

    // TODO: implement onInit
    super.onInit();
  }

  _fetchAddFriendRequest() {
    Api.instance
        .addFriendRequestNumber(
      bearToken: Session.instance.tokenResp!.accessToken,
    )
        .then((value) {
      if (value != null && value.result != null) {
        addFriendRequestNumber.value = value.result!;
      }
    }).catchError((onError) {
      if (onError is CustomException) {
        CustomException e = onError;
        Utils.showToast(e.message, Get.context!);
      } else {
        Utils.showToast('Some thing wrong', Get.context!);
      }
    });
  }

  _fetchListFriend() {
    Api.instance
        .getFriendList(bearToken: Session.instance.tokenResp!.accessToken)
        .then((value) {
      if (value != null && value.result != null) {
        listFriend.assignAll(value.result!);
      }
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
