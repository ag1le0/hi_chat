import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pea_chat/app/common/view/avatar.dart';
import 'package:pea_chat/app/modules/search_module/search_controller.dart';
import 'package:pea_chat/app/routes/app_pages.dart';
import 'package:pea_chat/app/utils/extension.dart';
/**
 * GetX Template Generator - fb.com/htngu.99
 * */

class SearchPage extends GetView<SearchController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(vertical: 5),
              height: 100,
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Row(
                  children: [
                    IconButton(
                      icon: Icon(
                        Icons.arrow_back,
                        color: HexColor.fromHex('5B5B7E'),
                      ),
                      onPressed: () {
                        Get.back();
                      },
                    ),
                    Expanded(
                      child: TextField(
                        focusNode: controller.tfUserSearchFocusNode,
                        controller: controller.tfUserSearchCtrl,
                        decoration: InputDecoration(
                            hintText: 'Username/name,...',
                            isDense: true,
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 8, horizontal: 8)),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
                child: CustomScrollView(
              slivers: [
                Obx(() => SliverList(
                      delegate: SliverChildListDelegate(
                          controller.userSearchList.map((event) {
                        return ListTile(
                          onTap: () {
                            Get.toNamed(Routes.USER + '/${event.id}');
                          },
                          title: Text(event.nickName!),
                          subtitle: Text(event.username!),
                          leading: Avatar(
                            media: event.avatar,
                            size: 50,
                          ),
                        );
                      }).toList()),
                    )),
              ],
            ))
          ],
        ),
      ),
    );
  }
}
