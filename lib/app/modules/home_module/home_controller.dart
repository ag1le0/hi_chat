import 'dart:async';

import 'package:get/get.dart';
import 'package:pea_chat/app/data/model/group_response.dart';
import 'package:pea_chat/app/data/provider/local/session.dart';
import 'package:pea_chat/app/data/provider/remote/api.dart';
import 'package:pea_chat/app/modules/landing_module/landing_controller.dart';
import 'package:pea_chat/app/routes/app_pages.dart';
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
    Api.instance
        .groupList(
      bearToken: Session.instance.tokenResp!.accessToken,
    )
        .then((value) {
      if (value!.size! > 0) {
        groupList.assignAll(value.result!);
      }
    });

    _subscription = _landingController.notifyController.stream.listen((event) {
      for (var element in groupList) {
        if (element.id == event.group!.id!) {
          if (Get.currentRoute == Routes.LANDING) {
            element.unreadMessageNumber = element.unreadMessageNumber! + 1;
          }
          element.latestMessage = event;

          groupList.insert(0, groupList.removeAt(groupList.indexOf(element)));
          //groupList.refresh();
          break;
        }
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
