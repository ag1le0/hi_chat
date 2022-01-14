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
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text('Friend requests'),
          backgroundColor: Colors.white,
          foregroundColor: Colors.black87,
          elevation: .15,
          bottom: PreferredSize(
            preferredSize: Size(double.infinity, 50),
            child: TabBar(
              indicator: BoxDecoration(
                  border: Border(
                      bottom: BorderSide(
                          color: Colors.orange,
                          width: 1,
                          style: BorderStyle.solid))),
              unselectedLabelColor: Colors.grey,
              labelColor: Colors.black87,
              tabs: [
                Tab(
                  text: 'Receive',
                ),
                Tab(
                  text: 'Sent',
                ),
              ],
            ),
          ),
        ),
        body: TabBarView(
          children: [
            Obx(() => ListView(
                  children: controller.receiveFriendRequest
                      .map((element) => RequestItem(value: Rx(element)))
                      .toList(),
                )),
            Container(),
          ],
        ),
      ),
    );
  }
}
