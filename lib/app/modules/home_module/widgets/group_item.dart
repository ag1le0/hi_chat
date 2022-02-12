import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pea_chat/app/common/view/avatar.dart';
import 'package:pea_chat/app/data/model/group_response.dart';
import 'package:pea_chat/app/modules/home_module/widgets/dot.dart';
import 'package:pea_chat/app/routes/app_pages.dart';
import 'package:pea_chat/app/utils/extension.dart';
import 'package:pea_chat/app/utils/time_ago.dart';

class GroupItem extends StatelessWidget {
  GroupItem({Key? key, required this.value}) : super(key: key);

  final Rx<GroupResponse> value;

  @override
  Widget build(BuildContext context) {
    return Obx(() => Visibility(
          visible: value.value.messageNumber! > 0 ||
              value.value.type == GroupType.NORMAL,
          child: InkWell(
            onTap: () {
              Get.toNamed(Routes.CHAT + '/${value.value.id!}');
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
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 0),
                      child: Container(
                        height: double.infinity,
                        width: double.infinity,
                        clipBehavior: Clip.antiAlias,
                        decoration: BoxDecoration(
                            // border: Border.all(color: Colors.white, width: 2.5),
                            // borderRadius: BorderRadius.circular(30),
                            ),
                        child: value.value.type == GroupType.FRIEND
                            ? Avatar(
                                media: value.value.avatar,
                              )
                            : Avatar.group(
                                media: value.value.avatar,
                              ),
                      )),
                  SizedBox(
                    width: 6,
                  ),
                  Expanded(
                    child: Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Text(
                            (value.value.name == null ||
                                    value.value.type == GroupType.NORMAL &&
                                        value.value.name!.isEmpty)
                                ? 'No name group'
                                : value.value.name!,
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
                                  (value.value.latestMessage != null)
                                      ? value.value.latestMessage!
                                                  .textMessage !=
                                              null
                                          ? value.value.latestMessage!
                                              .textMessage!.text!
                                          : value.value.latestMessage!
                                                      .mediaMessage !=
                                                  null
                                              ? '[Hình ảnh]'
                                              : ''
                                      : value.value.type == GroupType.NORMAL
                                          ? '[New Group]'
                                          : '',
                                  maxLines: 1,
                                  style: TextStyle(
                                      overflow: TextOverflow.ellipsis,
                                      fontSize: 14,
                                      color:
                                          value.value.unreadMessageNumber == 0
                                              ? HexColor.fromHex('212226')
                                                  .withOpacity(.7)
                                              : HexColor.fromHex('212226'),
                                      fontWeight: FontWeight.w400),
                                )),
                                if (value.value.latestMessage != null) ...[
                                  Dot(
                                    color: value.value.unreadMessageNumber == 0
                                        ? HexColor.fromHex('212226')
                                            .withOpacity(.7)
                                        : HexColor.fromHex('212226'),
                                  ),
                                  Text(
                                    value.value.latestMessage != null
                                        ? TimeAgo.timeAgoSinceDate(value.value
                                            .latestMessage!.publishedTime!)
                                        : '',
                                    style: TextStyle(
                                        fontSize: 14,
                                        color:
                                            value.value.unreadMessageNumber == 0
                                                ? HexColor.fromHex('212226')
                                                    .withOpacity(.7)
                                                : HexColor.fromHex('212226'),
                                        fontWeight: FontWeight.w400),
                                  )
                                ],
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  value.value.unreadMessageNumber != 0
                      ? Container(
                          height: 20,
                          width: 20,
                          decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(10)),
                          child: Center(
                            child: Text(
                              value.value.unreadMessageNumber.toString(),
                              style:
                                  TextStyle(color: Colors.white, fontSize: 10),
                            ),
                          ),
                        )
                      : SizedBox()
                ],
              ),
            ),
          ),
        ));
  }
}
