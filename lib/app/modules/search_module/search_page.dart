import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pea_chat/app/data/provider/local/session.dart';
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
      appBar: PreferredSize(
        preferredSize: AppBar().preferredSize,
        child: AppBar(
          title: TextField(
            focusNode: controller.tfUserSearchFocusNode,
            controller: controller.tfUserSearchCtrl,
            decoration: InputDecoration(
                hintText: 'ID card/Name,...',
                isDense: true,
                border: InputBorder.none,
                contentPadding:
                    EdgeInsets.symmetric(vertical: 8, horizontal: 8)),
          ),
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: HexColor.fromHex('5B5B7E'),
            ),
            onPressed: () {
              Get.back();
            },
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(32), topLeft: Radius.circular(32))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //search bar
            //CupertinoSearchTextField(),
            Expanded(
              child: Obx(() => ListView(
                    children: controller.userSearchList.map((event) {
                      return GestureDetector(
                        onTap: () {
                          Get.toNamed(Routes.USER + '/${event.id}');
                        },
                        child: ListTile(
                          title: Text(event.username! + ' - ' + event.name!),
                          leading: SizedBox(
                            width: 50,
                            height: 50,
                            child: CachedNetworkImage(
                              fit: BoxFit.cover,
                              imageUrl: 'https://10.224.81.70:6443' +
                                  ((event.avatar != null)
                                      ? event.avatar!.thumbUrl!
                                      : '/peachat/assets/dist/img/default-user-avatar.jpg'),
                              httpHeaders: {
                                'Authorization': 'Bearer ' +
                                    Session.instance.tokenResp!.accessToken!
                              },
                              errorWidget: (ctx, url, error) =>
                                  CachedNetworkImage(
                                imageUrl:
                                    'https://10.224.81.70:6443/peachat/assets/dist/img/default-user-avatar.jpg',
                                errorWidget: (_, __, ___) => SizedBox(),
                              ),
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
