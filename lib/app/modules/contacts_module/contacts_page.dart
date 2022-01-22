import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:pea_chat/app/data/provider/local/session.dart';
import 'package:pea_chat/app/data/provider/remote/api.dart';
import 'package:pea_chat/app/modules/contacts_module/contacts_controller.dart';
import 'package:pea_chat/app/modules/home_module/widgets/action_icon.dart';
import 'package:pea_chat/app/routes/app_pages.dart';
/**
 * GetX Template Generator - fb.com/htngu.99
 * */

class ContactsPage extends GetView<ContactsController> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.white,
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(vertical: 5),
                  height: 70,
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        'Friends',
                        style: TextStyle(
                            fontSize: 32, fontWeight: FontWeight.w700),
                      ),
                      Spacer(),
                      GestureDetector(
                        child: ActionIcon(icon: FontAwesomeIcons.search),
                        onTap: () {
                          Get.toNamed(Routes.SEARCH);
                        },
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      GestureDetector(
                          onTap: () {
                            Get.toNamed(Routes.ADD_FRIEND);
                          },
                          child: ActionIcon(icon: FontAwesomeIcons.userPlus)),
                    ],
                  ),
                ),
                Expanded(
                    child: Column(
                  children: [
                    Expanded(
                      child: ListView(
                        children: [
                          GestureDetector(
                            onTap: () {
                              Get.toNamed(Routes.FRIEND_REQUEST);
                            },
                            child: ListTile(
                              title: Row(
                                children: [
                                  Text('Friend requests'),
                                  Spacer(),
                                  Obx(() => controller
                                              .addFriendRequestNumber.value !=
                                          0
                                      ? Container(
                                          height: 20,
                                          width: 20,
                                          decoration: BoxDecoration(
                                              color: Colors.red,
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                          child: Center(
                                            child: Text(
                                              controller
                                                  .addFriendRequestNumber.value
                                                  .toString(),
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 12),
                                            ),
                                          ),
                                        )
                                      : SizedBox())
                                ],
                              ),
                              leading: Icon(FontAwesomeIcons.userFriends),
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 15),
                                  child: Obx(() => Text(
                                        'Friend (${controller.listFriend.length})',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ))),
                              Obx(() => ListView(
                                  shrinkWrap: true,
                                  physics: NeverScrollableScrollPhysics(),
                                  children: controller.listFriend
                                      .map((element) => Column(
                                            children: [
                                              GestureDetector(
                                                onTap: () {
                                                  Api.instance
                                                      .createFriendChatRoom(
                                                          bearToken: Session
                                                              .instance
                                                              .tokenResp!
                                                              .accessToken,
                                                          idFriend: element.id)
                                                      .then((value) {
                                                    Get.toNamed(Routes.CHAT +
                                                        '/${value!.result!.id!}');
                                                  });
                                                },
                                                child: ListTile(
                                                  leading: SizedBox(
                                                    height: 40,
                                                    width: 40,
                                                    child: ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              50),
                                                      clipBehavior:
                                                          Clip.antiAlias,
                                                      child: CachedNetworkImage(
                                                        fit: BoxFit.cover,
                                                        imageUrl: Api.host +
                                                            ((element.avatar !=
                                                                    null)
                                                                ? element
                                                                    .avatar!
                                                                    .thumbUrl!
                                                                : '/peachat/assets/dist/img/default-user-avatar.jpg'),
                                                        httpHeaders: {
                                                          'Authorization':
                                                              'Bearer' +
                                                                  Session
                                                                      .instance
                                                                      .tokenResp!
                                                                      .accessToken!
                                                        },
                                                        errorWidget: (ctx, url,
                                                                error) =>
                                                            CachedNetworkImage(
                                                          imageUrl:
                                                              '${Api.host}/peachat/assets/dist/img/default-user-avatar.jpg',
                                                          errorWidget:
                                                              (_, __, ___) =>
                                                                  SizedBox(),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  title: Text(element.name!),
                                                ),
                                              ),
                                              Divider(
                                                thickness: .7,
                                              )
                                            ],
                                          ))
                                      .toList())),
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ))
              ],
            ),
          )),
    );
  }
}
