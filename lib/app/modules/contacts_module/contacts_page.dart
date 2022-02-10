import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:pea_chat/app/common/view/search_widget.dart';
import 'package:pea_chat/app/modules/contacts_module/contacts_controller.dart';
import 'package:pea_chat/app/modules/contacts_module/widgets/contact_item.dart';
import 'package:pea_chat/app/routes/app_pages.dart';
import 'package:pea_chat/app/utils/extension.dart';
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
            padding: EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(vertical: 5),
                  height: 70,
                  child: Stack(
                    children: [
                      Positioned(
                        bottom: 0,
                        left: 0,
                        right: 0,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              'Contacts',
                              style: TextStyle(
                                  color: HexColor.fromHex('0F1828'),
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                            Spacer(),
                            // IconButton(
                            //   onPressed: () {},
                            //   icon: Icon(FontAwesomeIcons.qrcode),
                            //   color: HexColor.fromHex('0F1828'),
                            //   iconSize: 17,
                            // ),
                            GestureDetector(
                              onTap: () {
                                Get.toNamed(Routes.ADD_FRIEND);
                              },
                              child: Icon(
                                Icons.group_add_rounded,
                                color: HexColor.fromHex('0F1828'),
                                size: 24,
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                    child: CustomScrollView(
                  slivers: [
                    SliverToBoxAdapter(
                      child: SizedBox(
                        height: 15,
                      ),
                    ),
                    SliverToBoxAdapter(
                      child: SearchWidget(),
                    ),
                    SliverToBoxAdapter(
                      child: SizedBox(
                        height: 10,
                      ),
                    ),
                    if (controller.addFriendRequestNumber.value != 0)
                      SliverToBoxAdapter(
                        child: GestureDetector(
                          onTap: () {
                            Get.toNamed(Routes.FRIEND_REQUEST);
                          },
                          child: ListTile(
                            title: Row(
                              children: [
                                Text('Friend requests'),
                                Spacer(),
                                Obx(() => Container(
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
                                    ))
                              ],
                            ),
                            leading: Icon(FontAwesomeIcons.userFriends),
                          ),
                        ),
                      ),
                    SliverToBoxAdapter(
                      child: Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 10, vertical: 15),
                          child: Obx(() => Text(
                                '${controller.listFriend.length} Contatcts Available',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 15),
                              ))),
                    ),
                    Obx(
                      () => SliverList(
                          delegate: SliverChildListDelegate(
                        controller.listFriend
                            .map((element) => ContactItem(
                                  value: Rx(element),
                                ))
                            .toList(),
                      )),
                    ),
                  ],
                )),
              ],
            ),
          )),
    );
  }
}
