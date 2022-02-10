import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:pea_chat/app/common/view/avatar.dart';
import 'package:pea_chat/app/data/model/message_response.dart';
import 'package:pea_chat/app/data/provider/local/session.dart';
import 'package:pea_chat/app/data/provider/remote/api.dart';
import 'package:pea_chat/app/modules/chat_module/chat_page.dart';
import 'package:pea_chat/app/modules/chat_module/widgets/image_full_screen.dart';
import 'package:pea_chat/app/utils/extension.dart';
import 'package:pea_chat/app/utils/time_ago.dart';

class ChatItemView extends StatelessWidget {
  ChatItemView(
      {Key? key, required this.messageResponse, required this.sequence})
      : super(key: key) {
    isMe = messageResponse.author!.id == Session.instance.user!.id;
  }

  final MessageResponse messageResponse;
  final MessSequence sequence;
  late final bool isMe;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        right: 8.0,
        left: 8.0,
        bottom: (sequence == MessSequence.endMessage ||
                sequence == MessSequence.singleMessage ||
                sequence == MessSequence.startNewChatSingleMessage)
            ? 8
            : 1.5,
        top: (sequence == MessSequence.startMessage ||
                sequence == MessSequence.singleMessage ||
                sequence == MessSequence.startNewChatMessage ||
                sequence == MessSequence.startNewChatSingleMessage)
            ? 8
            : 1.5,
      ),
      child: Container(
        child: !isMe
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (sequence == MessSequence.startNewChatMessage ||
                      sequence == MessSequence.startNewChatSingleMessage) ...[
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 18.0),
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(TimeAgo.messageDateTime(
                            messageResponse.publishedTime!)),
                      ),
                    )
                  ],
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 35,
                        height: 35,
                        child: sequence == MessSequence.singleMessage ||
                                sequence == MessSequence.startMessage ||
                                sequence == MessSequence.startNewChatMessage ||
                                sequence ==
                                    MessSequence.startNewChatSingleMessage
                            ? Avatar(
                                media: messageResponse.author!.avatar,
                              )
                            : SizedBox(),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Flexible(
                        fit: FlexFit.loose,
                        child: ConstrainedBox(
                          constraints: BoxConstraints(
                              maxWidth: double.infinity, minWidth: 50),
                          child: Container(
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                topLeft:
                                    (sequence == MessSequence.middleMessage ||
                                            sequence == MessSequence.endMessage)
                                        ? Radius.circular(6)
                                        : Radius.circular(16),
                                topRight: Radius.circular(16),
                                bottomLeft: (sequence ==
                                            MessSequence.middleMessage ||
                                        sequence == MessSequence.startMessage ||
                                        sequence ==
                                            MessSequence.startNewChatMessage ||
                                        sequence ==
                                            MessSequence
                                                .startNewChatSingleMessage)
                                    ? Radius.circular(6)
                                    : Radius.circular(16),
                                bottomRight: Radius.circular(16),
                              ),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                if (sequence == MessSequence.singleMessage ||
                                    sequence == MessSequence.startMessage ||
                                    sequence ==
                                        MessSequence.startNewChatMessage ||
                                    sequence ==
                                        MessSequence
                                            .startNewChatSingleMessage) ...[
                                  Text(
                                    messageResponse.author!.name!,
                                    style: TextStyle(
                                        color: Colors.primaries[
                                            messageResponse.author!.id! %
                                                    Colors.primaries.length -
                                                1],
                                        fontSize: 10,
                                        fontWeight: FontWeight.w400),
                                  )
                                ],
                                if (messageResponse.textMessage != null)
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 4.0),
                                    child: Text(
                                      messageResponse.textMessage!.text!,
                                      softWrap: true,
                                      style: TextStyle(
                                          color: HexColor.fromHex('1B2B48'),
                                          height: 1.6,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ),
                                if (messageResponse.mediaMessage != null)
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 4.0),
                                    child: GestureDetector(
                                      onTap: () {
                                        Navigator.of(context).push(
                                          MaterialPageRoute(
                                            builder: (_) => ImageFullScreen(
                                              url: Api.host +
                                                  messageResponse.mediaMessage!
                                                      .media!.url!,
                                              header: {
                                                'Authorization': 'Bearer ' +
                                                    Session.instance.tokenResp!
                                                        .accessToken!
                                              },
                                            ),
                                          ),
                                        );
                                      },
                                      child: CachedNetworkImage(
                                        height: Get.height / 3,
                                        fit: BoxFit.fitHeight,
                                        imageUrl: Api.host +
                                            messageResponse
                                                .mediaMessage!.media!.url!,
                                        httpHeaders: {
                                          'Authorization': 'Bearer ' +
                                              Session.instance.tokenResp!
                                                  .accessToken!
                                        },
                                      ),
                                    ),
                                  ),
                                if (sequence == MessSequence.singleMessage ||
                                    sequence ==
                                        MessSequence
                                            .startNewChatSingleMessage ||
                                    sequence == MessSequence.endMessage) ...[
                                  Text(
                                    DateFormat('HH:mm')
                                        .format(messageResponse.publishedTime!),
                                    style: TextStyle(
                                        color: HexColor.fromHex('ADB5BD'),
                                        fontSize: 10,
                                        fontWeight: FontWeight.w400),
                                  )
                                ],
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 35,
                      ),
                    ],
                  )
                ],
              )
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (sequence == MessSequence.startNewChatMessage ||
                      sequence == MessSequence.startNewChatSingleMessage) ...[
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 18.0),
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(TimeAgo.messageDateTime(
                            messageResponse.publishedTime!)),
                      ),
                    )
                  ],
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      SizedBox(
                        width: 55,
                      ),
                      Flexible(
                        child: ConstrainedBox(
                            constraints: BoxConstraints(
                                maxWidth: double.infinity, minWidth: 50),
                            child: Container(
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  color: HexColor.fromHex('0AE4B0'),
                                  borderRadius: BorderRadius.only(
                                    topRight: (sequence ==
                                                MessSequence.middleMessage ||
                                            sequence == MessSequence.endMessage)
                                        ? Radius.circular(6)
                                        : Radius.circular(16),
                                    topLeft: Radius.circular(16),
                                    bottomRight: (sequence ==
                                                MessSequence.middleMessage ||
                                            sequence ==
                                                MessSequence.startMessage ||
                                            sequence ==
                                                MessSequence
                                                    .startNewChatMessage)
                                        ? Radius.circular(6)
                                        : Radius.circular(16),
                                    bottomLeft: Radius.circular(16),
                                  ),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    if (messageResponse.textMessage != null)
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 4.0),
                                        child: Text(
                                          messageResponse.textMessage!.text!,
                                          softWrap: true,
                                          style: TextStyle(
                                              color: HexColor.fromHex('FFFFFF'),
                                              height: 1.6,
                                              fontSize: 14,
                                              fontWeight: FontWeight.w400),
                                        ),
                                      ),
                                    if (messageResponse.mediaMessage != null)
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 4.0),
                                        child: GestureDetector(
                                          onTap: () {
                                            Navigator.of(context).push(
                                              MaterialPageRoute(
                                                builder: (_) => ImageFullScreen(
                                                  url: Api.host +
                                                      messageResponse
                                                          .mediaMessage!
                                                          .media!
                                                          .url!,
                                                  header: {
                                                    'Authorization': 'Bearer ' +
                                                        Session
                                                            .instance
                                                            .tokenResp!
                                                            .accessToken!
                                                  },
                                                ),
                                              ),
                                            );
                                          },
                                          child: CachedNetworkImage(
                                            height: Get.height / 3,
                                            fit: BoxFit.fitHeight,
                                            imageUrl: Api.host +
                                                messageResponse
                                                    .mediaMessage!.media!.url!,
                                            httpHeaders: {
                                              'Authorization': 'Bearer ' +
                                                  Session.instance.tokenResp!
                                                      .accessToken!
                                            },
                                            progressIndicatorBuilder:
                                                (context, url, progress) {
                                              return CupertinoActivityIndicator();
                                            },
                                          ),
                                        ),
                                      ),
                                    if (sequence ==
                                            MessSequence.singleMessage ||
                                        sequence ==
                                            MessSequence
                                                .startNewChatSingleMessage ||
                                        sequence ==
                                            MessSequence.endMessage) ...[
                                      Text(
                                        DateFormat('HH:mm').format(
                                            messageResponse.publishedTime!),
                                        style: TextStyle(
                                            color: HexColor.fromHex('FFFFFF'),
                                            fontSize: 10,
                                            fontWeight: FontWeight.w400),
                                      ),
                                    ],
                                  ],
                                ))),
                      ),
                      SizedBox(
                        width: 15,
                      )
                    ],
                  )
                ],
              ),
      ),
    );
  }
}
