import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pea_chat/app/common/view/avatar.dart';
import 'package:pea_chat/app/data/model/friend_request_response.dart';
import 'package:pea_chat/app/modules/friend_request_module/friend_request_controller.dart';
import 'package:pea_chat/app/utils/extension.dart';

class RequestItem extends GetWidget<FriendRequestController> {
  RequestItem({Key? key, required this.value}) : super(key: key);

  final Rx<FriendRequestResponse> value;

  @override
  Widget build(BuildContext context) {
    return Obx(() => InkWell(
          onTap: () {},
          child: Container(
            width: Get.width,
            height: 84,
            margin: EdgeInsets.symmetric(vertical: 8),
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                    height: 84,
                    width: 84,
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 0),
                    child: Container(
                      height: double.infinity,
                      width: double.infinity,
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(
                          // border: Border.all(color: Colors.white, width: 2.5),
                          // borderRadius: BorderRadius.circular(30),
                          ),
                      child: Avatar(
                        media: value.value.user!.avatar,
                      ),
                    )),
                SizedBox(
                  width: 6,
                ),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text(
                          value.value.user!.name!,
                          style: TextStyle(
                              fontSize: 17,
                              color: HexColor.fromHex('212226'),
                              fontWeight: FontWeight.w400),
                        ),
                        Expanded(
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              ElevatedButton(
                                onPressed: () {
                                  controller.acceptRequest(value.value.id!);
                                },
                                child: Text('Accept'),
                              ),
                              SizedBox(
                                width: 8,
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  controller.rejectRequest(value.value.id!);
                                },
                                child: Text('Reject'),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
