import 'dart:async';
import 'dart:io';

import 'package:dio/dio.dart' as dio;
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:pea_chat/app/common/custom_exception.dart';
import 'package:pea_chat/app/data/model/group_response.dart';
import 'package:pea_chat/app/data/model/message_response.dart';
import 'package:pea_chat/app/data/model/user.dart';
import 'package:pea_chat/app/data/provider/local/session.dart';
import 'package:pea_chat/app/data/provider/remote/api.dart';
import 'package:pea_chat/app/modules/home_module/home_controller.dart';
import 'package:pea_chat/app/modules/landing_module/landing_controller.dart';
import 'package:pea_chat/app/modules/landing_module/sub_module/video_call_module/video_call_controller.dart';
import 'package:pea_chat/app/services/notification_service.dart';
import 'package:pea_chat/app/utils/utils.dart';
/**
 * GetX Template Generator - fb.com/htngu.99
 * */

class ChatController extends GetxController {
  var showEmoji = false.obs;
  var emojiHeight = (0.0).obs;
  var inputTextController = TextEditingController();

  var messageFocus = FocusNode();

  var currentGroup = GroupResponse().obs;

  var listMessage = <MessageResponse>[].obs;
  var listMember = <User>[].obs;

  VideoCallController callController = Get.find();

  late int id;

  StreamSubscription? _subscription;

  var listMessageController = ScrollController();

  final LandingController _landingController = Get.find();
  final HomeController _homeController = Get.find();

  @override
  void onInit() {
    // TODO: implement onInit
    fetchData();
    readMessage();

    _subscription = _landingController.messageController.stream.listen((event) {
      if (id == event.group!.id!) {
        if (event.author!.id != Session.instance.user!.id) {
          listMessage.insert(0, event);
          readMessage();
        }
      } else {
        NotificationService().show(
            event.id!, event.author!.name!, event.textMessage!.text!,
            payload: event.group!.id!.toString());
      }
    });
    listMessageController.addListener(() {
      if (listMessageController.position.pixels >=
          listMessageController.position.maxScrollExtent) {
        fetchMessage(lastMessage: listMessage.last.id! - 1);
      }
    });
    super.onInit();
  }

  void readMessage() {
    Api.instance.readMessage(
        bearToken: Session.instance.tokenResp!.accessToken, groupId: id);
  }

  void fetchData() {
    id = int.parse(Get.parameters['id']!);

    readMessage();

    listMessage.value = [];
    Api.instance
        .groupInfo(
      id: id,
      bearToken: Session.instance.tokenResp!.accessToken,
    )
        .then((value) {
      fetchMemberList();

      if (value != null) {
        currentGroup.value = value.result!;
        if (value.result!.latestMessage != null) {
          fetchMessage(lastMessage: value.result!.latestMessage!.id!);
        }
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

  fetchMessage({required int lastMessage, int size = 35}) {
    var params = {'groupId': id, 'latestMessageId': lastMessage, 'size': size};
    Api.instance
        .getMessage(
            bearToken: Session.instance.tokenResp!.accessToken, params: params)
        .then((value) {
      listMessage.addAll(value!.result!);
    }).catchError((onError) {
      if (onError is CustomException) {
        CustomException e = onError;
        Utils.showToast(e.message, Get.context!);
      } else {
        Utils.showToast('Some thing wrong', Get.context!);
      }
    });
  }

  fetchMemberList() {
    Api.instance
        .groupMember(
            bearToken: Session.instance.tokenResp!.accessToken, groupId: id)
        .then((value) {
      listMember.addAll(value!.result!);
    }).catchError((onError) {
      if (onError is CustomException) {
        CustomException e = onError;
        Utils.showToast(e.message, Get.context!);
      } else {
        Utils.showToast('Some thing wrong', Get.context!);
      }
    });
  }

  void sendMessage() {
    if (inputTextController.text.isNotEmpty) {
      var data = {
        'groupId': id,
        'uuid': currentGroup.value.uuid,
        'text': inputTextController.text,
      };
      inputTextController.clear();
      Api.instance
          .sendText(
              bearToken: Session.instance.tokenResp!.accessToken, data: data)
          .then((value) {
        listMessage.insert(0, value!.result!);
        _homeController.fetchGroupList();
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

  void sendMedia(File image) async {
    var formData = dio.FormData();
    formData.fields.add(MapEntry('groupId', id.toString()));
    formData.fields.add(MapEntry('uuid', currentGroup.value.uuid.toString()));

    formData.files.add(MapEntry(
        'media',
        await dio.MultipartFile.fromFile(
          image.path,
        )));

    Api.instance
        .sendMedia(
            bearToken: Session.instance.tokenResp!.accessToken, data: formData)
        .then((value) {
      listMessage.insert(0, value!.result!);
      _homeController.fetchGroupList();
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
