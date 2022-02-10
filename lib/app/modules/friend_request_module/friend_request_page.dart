import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pea_chat/app/modules/friend_request_module/friend_request_controller.dart';
import 'package:pea_chat/app/modules/friend_request_module/widgets/request_item.dart';
/**
 * GetX Template Generator - fb.com/htngu.99
 * */

class FriendRequestPage extends GetView<FriendRequestController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Friend requests'),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black87,
        elevation: .15,
      ),
      body: Obx(() => ListView(
            children: controller.receiveFriendRequest
                .map((element) => RequestItem(value: Rx(element)))
                .toList(),
          )),
    );
  }
}
