import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pea_chat/app/utils/extension.dart';

import '../../../../../../res.dart';
import '../video_call_controller.dart';

class RingRing extends GetWidget<VideoCallController> {
  const RingRing({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        child: Scaffold(
          backgroundColor: HexColor.fromHex('0D1E30'),
          body: Padding(
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
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
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      'Calling...',
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 27,
                      ),
                    ),
                  ],
                ),
                // Row(
                //   mainAxisSize: MainAxisSize.max,
                //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                //   children: [
                //     Container(
                //       height: 70,
                //       width: 70,
                //       clipBehavior: Clip.antiAlias,
                //       decoration: BoxDecoration(
                //           borderRadius: BorderRadius.circular(35),
                //           color: Colors.blueGrey.withOpacity(.9)),
                //       child: Center(
                //         child: Icon(
                //           Icons.camera_alt_outlined,
                //           color: Colors.white,
                //           size: 32,
                //         ),
                //       ),
                //     ),
                //     Container(
                //       height: 70,
                //       width: 70,
                //       clipBehavior: Clip.antiAlias,
                //       decoration: BoxDecoration(
                //           borderRadius: BorderRadius.circular(35),
                //           color: Colors.blueGrey.withOpacity(.9)),
                //       child: Center(
                //         child: Icon(
                //           Icons.camera_alt_outlined,
                //           color: Colors.white,
                //           size: 32,
                //         ),
                //       ),
                //     ),
                //     Container(
                //       height: 70,
                //       width: 70,
                //       clipBehavior: Clip.antiAlias,
                //       decoration: BoxDecoration(
                //           borderRadius: BorderRadius.circular(35),
                //           color: Colors.blueGrey.withOpacity(.9)),
                //       child: Center(
                //         child: Icon(
                //           Icons.camera_alt_outlined,
                //           color: Colors.white,
                //           size: 32,
                //         ),
                //       ),
                //     ),
                //   ],
                // ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                      onTap: () {
                        controller.hangUp();
                      },
                      child: Container(
                        height: 90,
                        width: 90,
                        clipBehavior: Clip.antiAlias,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(45),
                          color: Colors.red.withOpacity(.9),
                        ),
                        child: Center(
                          child:
                              Icon(Icons.call, color: Colors.white, size: 36),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    GestureDetector(
                      onTap: () {
                        controller.acceptCall();
                      },
                      child: Container(
                        height: 90,
                        width: 90,
                        clipBehavior: Clip.antiAlias,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(45),
                          color: Colors.green.withOpacity(.9),
                        ),
                        child: Center(
                          child:
                              Icon(Icons.call, color: Colors.white, size: 36),
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
        onWillPop: null);
  }
}
