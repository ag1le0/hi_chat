import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_webrtc/flutter_webrtc.dart';
import 'package:get/get.dart';
import 'package:pea_chat/app/utils/extension.dart';
import 'package:pea_chat/res.dart';

import '../video_call_controller.dart';

class OfferCall extends GetWidget<VideoCallController> {
  const OfferCall({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        child: Scaffold(
          backgroundColor: HexColor.fromHex('0D1E30'),
          body: Stack(
            children: [
              Positioned.fill(
                  child: Opacity(
                opacity: .9,
                child: Obx(() => controller.localVideoReady.value
                    ? RTCVideoView(
                        controller.localRenderer,
                        objectFit:
                            RTCVideoViewObjectFit.RTCVideoViewObjectFitCover,
                      )
                    : const Center(
                        child: CupertinoActivityIndicator(),
                      )),
              )),
              Positioned.fill(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: [
                          Text(
                            'Calling...',
                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: 21,
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Text(
                            'Huong Huong',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 32,
                            ),
                          ),
                        ],
                      ),
                      Container(
                        height: 200,
                        width: 200,
                        clipBehavior: Clip.antiAlias,
                        decoration: BoxDecoration(
                            color: Colors.deepOrangeAccent.withOpacity(.15),
                            borderRadius: BorderRadius.circular(100)),
                        child: Center(
                          child: Container(
                            height: 140,
                            width: 140,
                            clipBehavior: Clip.antiAlias,
                            decoration: BoxDecoration(
                                color: Colors.deepOrangeAccent.withOpacity(.25),
                                borderRadius: BorderRadius.circular(70)),
                            child: Center(
                              child: Container(
                                height: 100,
                                width: 100,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50)),
                                clipBehavior: Clip.antiAlias,
                                child: Image.asset(
                                  Res.avt,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
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
        ),
        onWillPop: null);
  }
}
