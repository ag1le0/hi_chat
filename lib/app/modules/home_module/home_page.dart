import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pea_chat/app/common/view/search_widget.dart';
import 'package:pea_chat/app/modules/home_module/home_controller.dart';
import 'package:pea_chat/app/modules/home_module/widgets/group_item.dart';
import 'package:pea_chat/app/routes/app_pages.dart';
import 'package:pea_chat/app/utils/extension.dart';
import 'package:pea_chat/res.dart';
/**
 * GetX Template Generator - fb.com/htngu.99
 * */

class HomePage extends GetView<HomeController> {
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
                        child: Image.asset(
                          Res.home_icon,
                          height: 47,
                          width: 63,
                        ),
                        top: 5,
                        left: 33,
                      ),
                      Positioned(
                        bottom: 0,
                        left: 0,
                        right: 0,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              'Chats',
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
                                Get.toNamed(Routes.CREATE_CHAT);
                              },
                              child: Icon(
                                Icons.messenger_outline,
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
                    Obx(
                      () => SliverList(
                          delegate: SliverChildListDelegate(
                        controller.groupList.map((event) {
                          return GroupItem(
                            key: UniqueKey(),
                            value: Rx(event),
                          );
                        }).toList(),
                      )),
                    ),
                  ],
                ))
              ],
            ),
          )),
    );
  }
}

class ChatItem extends StatelessWidget {
  const ChatItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 46,
      width: double.infinity,
      child: Row(
        children: [
          CircleAvatar(
            radius: 20,
            child: Image.asset(Res.icon_google),
          )
        ],
      ),
    );
  }
}
