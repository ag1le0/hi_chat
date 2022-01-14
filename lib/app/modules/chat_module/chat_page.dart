import 'dart:io';

import 'package:camera_camera_2/camera_camera_2.dart';
import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_size/flutter_keyboard_size.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:gmo_media_picker/media_picker.dart';
import 'package:pea_chat/app/data/model/message_response.dart';
import 'package:pea_chat/app/modules/chat_module/chat_controller.dart';
import 'package:pea_chat/app/modules/chat_module/widgets/chat_item_view.dart';
import 'package:pea_chat/app/utils/extension.dart';
import 'package:pea_chat/app/utils/keyboard.dart';
/**
 * GetX Template Generator - fb.com/htngu.99
 * */

class ChatPage extends GetView<ChatController> {
  ChatPage({
    Key? key,
  }) : super(key: key) {
    controller.fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return KeyboardSizeProvider(
      child: WillPopScope(
        onWillPop: () async {
          if (controller.emojiHeight.value > 0) {
            KeyboardUtil.hideKeyboard(context);
            controller.emojiHeight.value = 0;
            return false;
          } else {
            return true;
          }
        },
        child: Scaffold(
          backgroundColor: HexColor.fromHex('F7F7FC'),
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            foregroundColor: Colors.black87,
            elevation: 0,
            leading: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: Icon(Icons.chevron_left),
            ),
            actions: [
              IconButton(
                onPressed: () {},
                icon: Icon(
                  FontAwesomeIcons.video,
                  color: Colors.blue.withOpacity(.8),
                  size: 18,
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(
                  FontAwesomeIcons.phoneAlt,
                  size: 18,
                  color: Colors.blue.withOpacity(.8),
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(
                  FontAwesomeIcons.infoCircle,
                  color: Colors.blue.withOpacity(.8),
                  size: 18,
                ),
              ),
            ],
            backgroundColor: Colors.white,
            title: Obx(() => Text(
                  controller.currentGroup.value.name ?? '',
                  style: TextStyle(fontSize: 15),
                )),
          ),
          body: Column(
            children: [
              Expanded(
                  child: Obx(() => ListView(
                        controller: controller.listMessageController,
                        reverse: true,
                        children: buildMessageList(),
                      ))),
              BottomSendNavigation(controller: controller)
            ],
          ),
        ),
      ),
    );
  }

  buildMessageList() {
    var list = <Widget>[];

    for (int i = 0; i < controller.listMessage.length; i++) {
      list.add(ChatItemView(
          messageResponse: controller.listMessage[i],
          sequence: getSequence(
            cur: getElement(controller.listMessage, i) as MessageResponse,
            pre: getElement(controller.listMessage, i + 1) != null
                ? getElement(controller.listMessage, i + 1) as MessageResponse
                : null,
            aft: getElement(controller.listMessage, i - 1) != null
                ? getElement(controller.listMessage, i - 1) as MessageResponse
                : null,
          )));
    }
    return list;

    // return controller.listMessage.map((element) {
    //   return ChatItemView(
    //     messageResponse: element,
    //   );
    // }).toList();
  }

  Object? getElement(List list, int index) {
    if (index < 0 || index >= list.length) {
      return null;
    }
    return list[index];
  }

  MessSequence getSequence(
      {MessageResponse? pre,
      required MessageResponse cur,
      MessageResponse? aft}) {
    if (pre == null || pre.publishedTime!.day != cur.publishedTime!.day) {
      if (aft == null) {
        return MessSequence.startNewChatSingleMessage;
      } else {
        return MessSequence.startNewChatMessage;
      }
    }
    if (aft == null || aft.publishedTime!.day != cur.publishedTime!.day) {
      if (pre.author!.id == cur.author!.id) {
        return MessSequence.endMessage;
      } else {
        return MessSequence.singleMessage;
      }
    }
    if (pre.author!.id != cur.author!.id) {
      if (cur.author!.id != aft.author!.id) {
        return MessSequence.singleMessage;
      } else {
        return MessSequence.startMessage;
      }
    } else {
      if (cur.author!.id == aft.author!.id) {
        return MessSequence.middleMessage;
      } else {
        return MessSequence.endMessage;
      }
    }
  }
}

enum MessSequence {
  startMessage,
  middleMessage,
  endMessage,
  singleMessage,
  startNewChatMessage,
  startNewChatSingleMessage
}

class BottomSendNavigation extends StatelessWidget {
  const BottomSendNavigation({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final ChatController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.only(left: 15, right: 15, bottom: 10, top: 5),
          color: Colors.white,
          width: double.infinity,
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisSize: MainAxisSize.max,
              children: [
                MediaQuery.of(context).viewInsets.bottom != 0
                    ? Container(
                        height: 35,
                        child: Row(
                          children: [
                            Container(
                              height: 24,
                              width: 45,
                              child: Center(
                                child: Icon(
                                  Icons.close,
                                  color: Colors.blue,
                                  size: 24,
                                ),
                              ),
                            )
                          ],
                        ),
                      )
                    : Container(
                        height: 35,
                        child: Row(
                          children: [
                            Container(
                              height: 24,
                              width: 45,
                              child: Center(
                                child: GestureDetector(
                                  onTap: () {
                                    Get.to(() => CameraCamera(
                                          onFile: (image) async {
                                            Get.back();
                                            if (image != null) {
                                              controller.sendMedia(image);
                                            }
                                          },
                                        ));
                                  },
                                  child: Icon(
                                    Icons.camera_alt,
                                    color: HexColor.fromHex('#0AE4B0'),
                                    size: 24,
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              height: 24,
                              width: 45,
                              child: Center(
                                child: GestureDetector(
                                  onTap: () {
                                    GmoMediaPicker.picker(
                                      context,
                                      isMulti: false,
                                      type: RequestType.image,
                                      isReview: true,
                                      singleCallback:
                                          (AssetEntity asset) async {
                                        File? image = await asset.file;
                                        if (image != null) {
                                          controller.sendMedia(image);
                                        }
                                      },
                                    );
                                  },
                                  child: Icon(
                                    Icons.image,
                                    color: HexColor.fromHex('#0AE4B0'),
                                    size: 24,
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              height: 24,
                              width: 45,
                              child: Center(
                                child: Icon(
                                  Icons.keyboard_voice,
                                  color: HexColor.fromHex('#0AE4B0'),
                                  size: 24,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 6.5),
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: HexColor.fromHex('F7F7FC'),
                        borderRadius: BorderRadius.circular(25)),
                    child: Row(
                      children: [
                        Expanded(
                          child: TextField(
                            focusNode: controller.messageFocus,
                            controller: controller.inputTextController,
                            decoration: InputDecoration(
                                hintText:
                                    MediaQuery.of(context).viewInsets.bottom ==
                                            0
                                        ? 'Aa'
                                        : 'Nhập tin nhắn',
                                border: InputBorder.none,
                                isDense: true,
                                contentPadding:
                                    EdgeInsets.symmetric(vertical: 10)),
                            maxLines: 5,
                            minLines: 1,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            if (controller.emojiHeight.value == 0.0) {
                              controller.emojiHeight.value = 300;
                            } else {
                              if (MediaQuery.of(context).viewInsets.bottom >
                                  0) {
                                KeyboardUtil.hideKeyboard(context);
                              } else {
                                controller.messageFocus.requestFocus();
                              }
                            }
                          },
                          child: Icon(
                            FontAwesomeIcons.solidSmile,
                            color: HexColor.fromHex('#0AE4B0'),
                            size: 18,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  height: 35,
                  child: Row(
                    children: [
                      Container(
                        height: 24,
                        width: 45,
                        child: Center(
                          child: GestureDetector(
                            onTap: () {
                              controller.sendMessage();
                            },
                            child: Icon(
                              Icons.send,
                              color: HexColor.fromHex('#0AE4B0'),
                              size: 24,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        Consumer<ScreenHeight>(builder: (context, value, child) {
          if (value.keyboardHeight > controller.emojiHeight.value) {
            controller.emojiHeight.value = value.keyboardHeight;
          }
          return Obx(() => AnimatedSize(
                duration: Duration(milliseconds: 100),
                child: SizedBox(
                  height: controller.emojiHeight.value,
                  child: EmojiPicker(
                    onEmojiSelected: (category, emoji) {
                      controller.inputTextController.text += emoji.emoji;
                    },
                    onBackspacePressed: () {},
                    config: Config(
                        columns: 7,
                        emojiSizeMax: 25 *
                            (Platform.isIOS
                                ? 1.30
                                : 1.0), // Issue: https://github.com/flutter/flutter/issues/28894
                        verticalSpacing: 0,
                        horizontalSpacing: 0,
                        initCategory: Category.RECENT,
                        bgColor: Color(0xFFF2F2F2),
                        indicatorColor: Colors.blue,
                        iconColor: Colors.grey,
                        iconColorSelected: Colors.blue,
                        progressIndicatorColor: Colors.blue,
                        showRecentsTab: true,
                        recentsLimit: 28,
                        noRecentsText: "No Recents",
                        noRecentsStyle: const TextStyle(
                            fontSize: 20, color: Colors.black26),
                        tabIndicatorAnimDuration: kTabScrollDuration,
                        categoryIcons: const CategoryIcons(),
                        buttonMode: ButtonMode.MATERIAL),
                  ),
                ),
              ));
        })
      ],
    );
  }
}
