import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:gmo_media_picker/media_picker.dart';
import 'package:pea_chat/app/data/provider/local/session.dart';
import 'package:pea_chat/app/modules/create_chat_module/create_chat_controller.dart';
import 'package:pea_chat/app/utils/extension.dart';
/**
 * GetX Template Generator - fb.com/htngu.99
 * */

class CreateChatPage extends GetView<CreateChatController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('New chatroom'),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black87,
        elevation: .15,
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 19),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {
                    controller.createGroup();
                  },
                  child: Container(
                    //width: ScreenUtil().setWidth(83),
                    height: 40,
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                        color: HexColor.fromHex('377CCE').withOpacity(.1),
                        borderRadius: BorderRadius.all(Radius.circular(8))),
                    child: Center(
                      child: Text(
                        'Create',
                        style: TextStyle(
                            color: HexColor.fromHex('377CCE'),
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            SizedBox(
              height: 50,
              width: double.infinity,
              child: Row(
                children: [
                  Container(
                    height: 50,
                    width: 50,
                    child: GestureDetector(
                      onTap: () {
                        GmoMediaPicker.picker(
                          context,
                          isMulti: false,
                          type: RequestType.image,
                          isReview: true,
                          singleCallback: controller.fileSelected,
                        );
                      },
                      child: Obx(() => controller.groupAvt.value == null
                          ? Icon(
                              FontAwesomeIcons.camera,
                              color: Colors.grey,
                            )
                          : Image.file(controller.groupAvt.value!)),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Expanded(
                      child: TextField(
                    controller: controller.groupNameCtrl,
                    decoration: InputDecoration(
                        hintText: 'Group name',
                        isDense: true,
                        contentPadding: EdgeInsets.symmetric(vertical: 8)),
                  ))
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 15),
              height: 35,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(.15),
                  borderRadius: BorderRadius.circular(17.5)),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    Icons.search,
                    color: Colors.grey,
                    size: 24,
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Expanded(
                    child: TextField(
                      controller: controller.searchController,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Search',
                          isDense: true,
                          contentPadding: EdgeInsets.symmetric(vertical: 8)),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Obx(
              () => controller.listGroupMembers.isNotEmpty
                  ? Column(
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 15),
                              child: Text(
                                'Selected (${controller.listGroupMembers.length})',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              )),
                        ),
                        SizedBox(
                            height: 80,
                            width: double.infinity,
                            child: ListView(
                              children: controller.listGroupMembers
                                  .map((element) => Padding(
                                        padding: const EdgeInsets.all(5),
                                        child: Column(
                                          children: [
                                            SizedBox(
                                              height: 50,
                                              width: 50,
                                              child: Stack(
                                                clipBehavior: Clip.antiAlias,
                                                children: [
                                                  Positioned.fill(
                                                    child: Container(
                                                      clipBehavior:
                                                          Clip.antiAlias,
                                                      decoration: BoxDecoration(
                                                        border: Border.all(
                                                            color: Colors.white,
                                                            width: 2.5),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(25),
                                                      ),
                                                      child: CachedNetworkImage(
                                                        fit: BoxFit.fill,
                                                        imageUrl: 'https://10.224.81.70:6443' +
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
                                                              'https://10.224.81.70:6443/peachat/assets/dist/img/default-user-avatar.jpg',
                                                          errorWidget:
                                                              (_, __, ___) =>
                                                                  SizedBox(),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Positioned(
                                                      right: 0,
                                                      top: 0,
                                                      child: GestureDetector(
                                                        onTap: () {
                                                          controller
                                                              .listContacts
                                                              .insert(
                                                                  0, element);
                                                          controller
                                                              .listContactsFilter
                                                              .insert(
                                                                  0, element);
                                                          controller
                                                              .listGroupMembers
                                                              .remove(element);
                                                        },
                                                        child: Container(
                                                          height: 15,
                                                          width: 15,
                                                          clipBehavior:
                                                              Clip.antiAlias,
                                                          decoration: BoxDecoration(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          7.5),
                                                              color: Colors
                                                                  .black54),
                                                          child: Center(
                                                            child: Icon(
                                                              FontAwesomeIcons
                                                                  .times,
                                                              color:
                                                                  Colors.white,
                                                              size: 10,
                                                            ),
                                                          ),
                                                        ),
                                                      ))
                                                ],
                                              ),
                                            ),
                                            Text(element.name!.split(' ').last),
                                          ],
                                        ),
                                      ))
                                  .toList(),
                              scrollDirection: Axis.horizontal,
                            ))
                      ],
                    )
                  : const SizedBox(),
            ),
            Expanded(
              child: Obx(() => Column(
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 10, vertical: 15),
                            child: Text(
                              'Contacts (${controller.listContacts.length})',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            )),
                      ),
                      Expanded(
                        child: ListView(
                            children: controller.listContactsFilter
                                .map((element) => Column(
                                      children: [
                                        GestureDetector(
                                          onTap: () {
                                            controller.listGroupMembers
                                                .add(element);
                                            controller.listContacts
                                                .remove(element);
                                            controller.listContactsFilter
                                                .remove(element);
                                          },
                                          child: ListTile(
                                            leading: SizedBox(
                                              height: 40,
                                              width: 40,
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(50),
                                                clipBehavior: Clip.antiAlias,
                                                child: CachedNetworkImage(
                                                  fit: BoxFit.cover,
                                                  imageUrl:
                                                      'https://10.224.81.70:6443' +
                                                          ((element.avatar !=
                                                                  null)
                                                              ? element.avatar!
                                                                  .thumbUrl!
                                                              : '/peachat/assets/dist/img/default-user-avatar.jpg'),
                                                  httpHeaders: {
                                                    'Authorization': 'Bearer' +
                                                        Session
                                                            .instance
                                                            .tokenResp!
                                                            .accessToken!
                                                  },
                                                  errorWidget:
                                                      (ctx, url, error) =>
                                                          CachedNetworkImage(
                                                    imageUrl:
                                                        'https://10.224.81.70:6443/peachat/assets/dist/img/default-user-avatar.jpg',
                                                    errorWidget: (_, __, ___) =>
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
                                .toList()),
                      ),
                    ],
                  )),
            )
          ],
        ),
      ),
    );
  }
}
