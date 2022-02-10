import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_webrtc/flutter_webrtc.dart';
import 'package:get/get.dart';
import 'package:pea_chat/app/utils/extension.dart';

import '../video_call_controller.dart';

class InCall extends GetWidget<VideoCallController> {
  const InCall({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: Scaffold(
          backgroundColor: HexColor.fromHex('0D1E30'),
          body: OrientationBuilder(
            builder: (context, orientation) => Stack(
              children: [
                Positioned.fill(
                    child: Obx(() => controller.remoteVideoReady.value
                        ? RTCVideoView(
                            controller.remoteRenderer,
                            objectFit: RTCVideoViewObjectFit
                                .RTCVideoViewObjectFitCover,
                          )
                        : Container(
                            child: Center(
                              child: CupertinoActivityIndicator(),
                            ),
                          ))),
                Positioned(
                  right: 20.0,
                  top: 50.0,
                  child: Container(
                    width: orientation == Orientation.portrait ? 90.0 : 120.0,
                    height: orientation == Orientation.portrait ? 120.0 : 90.0,
                    child: Obx(() => controller.localVideoReady.value
                        ? RTCVideoView(
                            controller.localRenderer,
                            objectFit: RTCVideoViewObjectFit
                                .RTCVideoViewObjectFitCover,
                          )
                        : const Center(
                            child: CupertinoActivityIndicator(),
                          )),
                    decoration: const BoxDecoration(color: Colors.black54),
                  ),
                ),
                Positioned(
                  bottom: 50,
                  left: 20,
                  right: 20,
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            GestureDetector(
                              onTap: () {
                                controller.switchCamera();
                              },
                              child: Container(
                                height: 70,
                                width: 70,
                                clipBehavior: Clip.antiAlias,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(35),
                                    color: Colors.blueGrey.withOpacity(.9)),
                                child: Center(
                                  child: Icon(
                                    Icons.switch_camera_outlined,
                                    color: Colors.white,
                                    size: 32,
                                  ),
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                controller.hangUp();
                              },
                              child: Container(
                                height: 70,
                                width: 70,
                                clipBehavior: Clip.antiAlias,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(35),
                                  color: Colors.red.withOpacity(.9),
                                ),
                                child: Center(
                                  child: Icon(Icons.call,
                                      color: Colors.white, size: 32),
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                controller.muteMic();
                              },
                              child: Container(
                                height: 70,
                                width: 70,
                                clipBehavior: Clip.antiAlias,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(35),
                                    color: Colors.blueGrey.withOpacity(.9)),
                                child: Center(
                                  child: Obx(() => Icon(
                                        controller.micOff
                                            ? Icons.mic_off
                                            : Icons.mic,
                                        color: Colors.white,
                                        size: 32,
                                      )),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )),
      onWillPop: null,
    );
  }
}
