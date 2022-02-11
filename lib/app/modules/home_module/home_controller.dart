import 'dart:async';

import 'package:get/get.dart';
import 'package:pea_chat/app/common/custom_exception.dart';
import 'package:pea_chat/app/data/model/group_response.dart';
import 'package:pea_chat/app/data/provider/local/session.dart';
import 'package:pea_chat/app/data/provider/remote/api.dart';
import 'package:pea_chat/app/modules/landing_module/landing_controller.dart';
import 'package:pea_chat/app/utils/utils.dart';
/**
 * GetX Template Generator - fb.com/htngu.99
 * */

class HomeController extends GetxController {
  RxList<GroupResponse> groupList = <GroupResponse>[].obs;

  final LandingController _landingController = Get.find();

  StreamSubscription? _subscription;

  @override
  void onInit() {
    // TODO: implement onInit
    initData();
    super.onInit();
  }

  initData() {
    fetchGroupList();
    _subscription = _landingController.messageController.stream.listen((event) {
      fetchGroupList();
    });
  }

  fetchGroupList() {
    Api.instance
        .groupList(
      bearToken: Session.instance.tokenResp!.accessToken,
    )
        .then((value) {
      if (value!.size! > 0) {
        groupList.assignAll(value.result!);
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

  @override
  void onClose() {
    _subscription!.cancel();
    // TODO: implement dispose
    super.onClose();
  }
}
