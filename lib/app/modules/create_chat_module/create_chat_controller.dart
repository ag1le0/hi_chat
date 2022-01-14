import 'dart:io';

import 'package:dio/dio.dart' as dio;
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:gmo_media_picker/media_picker.dart';
import 'package:pea_chat/app/data/model/user.dart';
import 'package:pea_chat/app/data/provider/local/session.dart';
import 'package:pea_chat/app/data/provider/remote/api.dart';
/**
 * GetX Template Generator - fb.com/htngu.99
 * */

class CreateChatController extends GetxController {
  var listContacts = <User>[].obs;
  var listContactsFilter = <User>[].obs;
  var listGroupMembers = <User>[].obs;

  var searchController = TextEditingController(text: '');
  var groupNameCtrl = TextEditingController();

  Rx<File?> groupAvt = Rx(null);

  @override
  void onInit() {
    searchController.addListener(() {
      listContactsFilter.assignAll(listContacts.where((p0) =>
          (p0.name! + p0.username! + p0.nickName!)
              .toLowerCase()
              .contains(searchController.text.toLowerCase())));
    });
    Api.instance
        .getFriendList(bearToken: Session.instance.tokenResp!.accessToken)
        .then((value) {
      if (value != null && value.result != null) {
        listContacts.assignAll(value.result!);
        listContactsFilter.assignAll(value.result!);
      }
    });

    // TODO: implement onInit
    super.onInit();
  }

  fileSelected(AssetEntity asset) async {
    File? image = await asset.file;
    if (image != null) {
      groupAvt.value = image;
    }
  }

  createGroup() async {
    var data = dio.FormData();

    data.fields.add(MapEntry('name', groupNameCtrl.text));
    for (var element in listGroupMembers) {
      data.fields.add(MapEntry('memberIdList', element.id!.toString()));
    }
    data.files.add(MapEntry(
        'avatar', await dio.MultipartFile.fromFile(groupAvt.value!.path)));
    Api.instance
        .createGroup(
          bearToken: Session.instance.tokenResp!.accessToken,
          data: data,
        )
        .then((value) {});
  }
}
