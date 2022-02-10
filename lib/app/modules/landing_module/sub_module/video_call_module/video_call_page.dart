import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pea_chat/app/modules/landing_module/sub_module/video_call_module/utils/signaling.dart';
import 'package:pea_chat/app/modules/landing_module/sub_module/video_call_module/video_call_controller.dart';
import 'package:pea_chat/app/modules/landing_module/sub_module/video_call_module/widgets/in_call.dart';
import 'package:pea_chat/app/modules/landing_module/sub_module/video_call_module/widgets/offer_call.dart';
import 'package:pea_chat/app/modules/landing_module/sub_module/video_call_module/widgets/ring_ring.dart';
/**
 * GetX Template Generator - fb.com/htngu.99
 * */

class VideoCallPage extends GetView<VideoCallController> {
  const VideoCallPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() => _buildMain());
  }

  Widget _buildMain() {
    switch (controller.callState) {
      case CallState.CallStateNew:
        return OfferCall();
      case CallState.CallStateRinging:
        return RingRing();
      case CallState.CallStateConnected:
        return InCall();
      default:
        return _buildList();
    }
  }

  Widget _buildList() {
    return Scaffold(
      appBar: AppBar(
        title: Text('Call app'),
      ),
      body: Obx(() => ListView.builder(
          shrinkWrap: true,
          padding: const EdgeInsets.all(0.0),
          itemCount: (controller.peers.length),
          itemBuilder: (context, i) {
            return _buildRow(context, controller.peers[i]);
          })),
    );
  }

  _buildRow(context, peer) {
    var self = (peer['id'] == controller.selfId);
    return ListBody(children: <Widget>[
      ListTile(
        title: Text(self
            ? peer['name'] + ', ID: ${peer['id']} ' + ' [Your self]'
            : peer['name'] + ', ID: ${peer['id']} '),
        onTap: () {
          if (!self) controller.invitePeer(peer['id']);
        },
        subtitle: Text('[' + peer['user_agent'] + ']'),
      ),
      Divider()
    ]);
  }
}
