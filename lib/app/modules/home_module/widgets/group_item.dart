import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pea_chat/app/data/model/group_response.dart';
import 'package:pea_chat/app/data/provider/local/session.dart';
import 'package:pea_chat/app/modules/home_module/widgets/dot.dart';
import 'package:pea_chat/app/routes/app_pages.dart';
import 'package:pea_chat/app/utils/extension.dart';
import 'package:pea_chat/app/utils/time_ago.dart';
import 'package:pea_chat/res.dart';

class GroupItem extends StatelessWidget {
  GroupItem({Key? key, required this.value}) : super(key: key);

  final Rx<GroupResponse> value;

  @override
  Widget build(BuildContext context) {
    return Obx(() => Visibility(
          visible: value.value.latestMessage != null,
          child: InkWell(
            onTap: () {
              value.value.unreadMessageNumber = 0;
              value.refresh();
              Get.toNamed(Routes.CHAT + '/${value.value.id!}');
            },
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
                    child: true
                        ? Container(
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
                                    ((value.value.avatar != null)
                                        ? value.value.avatar!.thumbUrl!
                                        : '/peachat/assets/dist/img/default-user-avatar.jpg'),
                                httpHeaders: {
                                  'Authorization': 'Bearer ' +
                                      Session.instance.tokenResp!.accessToken!,
                                },
                                errorWidget: (ctx, url, error) =>
                                    CachedNetworkImage(
                                  imageUrl:
                                      'https://10.224.81.70:6443/peachat/assets/dist/img/default-user-avatar.jpg',
                                  errorWidget: (_, __, ___) => SizedBox(),
                                ),
                              ),
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
                            value.value.name!,
                            style: TextStyle(
                                fontSize: 17,
                                color: value.value.unreadMessageNumber == 0
                                    ? HexColor.fromHex('212226').withOpacity(.7)
                                    : HexColor.fromHex('212226'),
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
