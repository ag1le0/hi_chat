import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
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
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      // CircleAvatar(
                      //   child: Image.asset(
                      //     Res.icon_user,
                      //     fit: BoxFit.fill,
                      //   ),
                      // ),
                      // SizedBox(
                      //   width: 15,
                      // ),
                      Text(
                        'Chats',
                        style: TextStyle(
                            color: HexColor.fromHex('0F1828'),
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                      Spacer(),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(FontAwesomeIcons.qrcode),
                        color: HexColor.fromHex('0F1828'),
                        iconSize: 17,
                      ),
                      IconButton(
                        onPressed: () {
                          Get.toNamed(Routes.CREATE_CHAT);
                        },
                        icon: Icon(
                          FontAwesomeIcons.solidEdit,
                          color: HexColor.fromHex('0F1828'),
                        ),
                        iconSize: 17,
                      )
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
                      child: GestureDetector(
                        onTap: () {
                          Get.toNamed(Routes.SEARCH);
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 15),
                          height: 48,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              color: HexColor.fromHex('F5F8FC'),
                              borderRadius: BorderRadius.circular(10)),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.search,
                                color: HexColor.fromHex('949BA5'),
                                size: 24,
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              Text(
                                'Tìm kiếm',
                                style: TextStyle(
                                  color: HexColor.fromHex('949BA5'),
                                  fontSize: 15,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
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
