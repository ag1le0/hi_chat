import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pea_chat/app/data/model/friend_request_response.dart';
import 'package:pea_chat/app/data/provider/local/session.dart';
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
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        clipBehavior: Clip.antiAlias,
                        child: CachedNetworkImage(
                          fit: BoxFit.cover,
                          imageUrl: 'https://10.224.81.70:6443' +
                              ((value.value.user!.avatar != null)
                                  ? value.value.user!.avatar!.thumbUrl!
                                  : '/peachat/assets/dist/img/default-user-avatar.jpg'),
                          httpHeaders: {
                            'Authorization': 'Bearer ' +
                                Session.instance.tokenResp!.accessToken!,
                          },
                          errorWidget: (ctx, url, error) => CachedNetworkImage(
                            imageUrl:
                                'https://10.224.81.70:6443/peachat/assets/dist/img/default-user-avatar.jpg',
                            errorWidget: (_, __, ___) => SizedBox(),
                          ),
                        ),
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
