import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pea_chat/app/common/custom_exception.dart';
import 'package:pea_chat/app/common/view/avatar.dart';
import 'package:pea_chat/app/data/model/user.dart';
import 'package:pea_chat/app/data/provider/local/session.dart';
import 'package:pea_chat/app/data/provider/remote/api.dart';
import 'package:pea_chat/app/routes/app_pages.dart';
import 'package:pea_chat/app/utils/extension.dart';
import 'package:pea_chat/app/utils/utils.dart';
import 'package:pea_chat/res.dart';

class ContactItem extends StatelessWidget {
  ContactItem({Key? key, required this.value}) : super(key: key);

  final Rx<User> value;

  @override
  Widget build(BuildContext context) {
    return Obx(() => InkWell(
          onTap: () {
            Api.instance
                .createFriendChatRoom(
                    bearToken: Session.instance.tokenResp!.accessToken,
                    idFriend: value.value.id)
                .then((value) {
              Get.toNamed(Routes.CHAT + '/${value!.result!.id!}');
            }).catchError((onError) {
              if (onError is CustomException) {
                CustomException e = onError;
                Utils.showToast(e.message, Get.context!);
              } else {
                Utils.showToast('Some thing wrong', Get.context!);
              }
            });
          },
          child: Container(
            width: Get.width,
            height: 84,
            margin: EdgeInsets.symmetric(vertical: 8),
            padding: EdgeInsets.fromLTRB(0, 10, 10, 10),
            decoration: BoxDecoration(
                border: Border.all(
                    color: HexColor.fromHex('DEDEDE').withOpacity(.70),
                    width: 1),
                borderRadius: BorderRadius.circular(15)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: 84,
                  width: 84,
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 0),
                  child: true
                      ? Container(
                          height: double.infinity,
                          width: double.infinity,
                          clipBehavior: Clip.antiAlias,
                          decoration: BoxDecoration(
                              // border: Border.all(color: Colors.white, width: 2.5),
                              // borderRadius: BorderRadius.circular(30),
                              ),
                          child: Avatar(
                            media: value.value.avatar,
                          ),
                        )
                      : Stack(
                          children: [
                            Positioned(
                                top: 0,
                                right: 0,
                                child: Container(
                                  height: 40,
                                  width: 40,
                                  clipBehavior: Clip.antiAlias,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Colors.white, width: 2.5),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Image.asset(
                                    Res.icon_user,
                                    fit: BoxFit.fitWidth,
                                  ),
                                )),
                            Positioned(
                                bottom: 0,
                                left: 0,
                                child: Container(
                                  height: 40,
                                  width: 40,
                                  clipBehavior: Clip.antiAlias,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Colors.white, width: 2.5),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Image.asset(
                                    Res.icon_user,
                                    fit: BoxFit.fitWidth,
                                  ),
                                )),
                          ],
                        ),
                ),
                SizedBox(
                  width: 6,
                ),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                        //     border: Border(
                        //         bottom: BorderSide(
                        //   width: 1,
                        //   color: Colors.black.withOpacity(.03),
                        // ))
                        ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text(
                          value.value.nickName!,
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
                              Flexible(
                                  child: Text(
                                value.value.username!,
                                maxLines: 1,
                                style: TextStyle(
                                    overflow: TextOverflow.ellipsis,
                                    fontSize: 14,
                                    color: HexColor.fromHex('212226')
                                        .withOpacity(.7),
                                    fontWeight: FontWeight.w400),
                              )),
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
