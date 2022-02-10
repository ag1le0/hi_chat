import 'dart:async';
import 'dart:developer';

import 'package:dart_amqp/dart_amqp.dart';
import 'package:get/get.dart';
import 'package:pea_chat/app/common/response/notify_response.dart';
import 'package:pea_chat/app/data/model/friend_request_response.dart';
import 'package:pea_chat/app/data/model/message_response.dart';
import 'package:pea_chat/app/data/model/user.dart';
import 'package:pea_chat/app/data/provider/local/session.dart';
import 'package:pea_chat/app/data/provider/remote/api.dart';
import 'package:pea_chat/app/modules/landing_module/sub_module/video_call_module/video_call_controller.dart';
import 'package:pea_chat/app/routes/app_pages.dart';
import 'package:pea_chat/app/services/notification_service.dart';
import 'package:pea_chat/app/utils/utils.dart';
/**
 * GetX Template Generator - fb.com/htngu.99
 * */

class LandingController extends GetxController {
  var mainIndex = 0.obs;

  var client = Client();

  var notifyController = StreamController<NotifyResponse>.broadcast();
  var messageController = StreamController<MessageResponse>.broadcast();

  StreamSubscription? notifySubcription;
  StreamSubscription? messageSubcription;

  VideoCallController videoCallController =
      Get.isRegistered<VideoCallController>()
          ? Get.find()
          : Get.put(VideoCallController());

  @override
  void onInit() {
    initVideoCallReceive();
    initRabbit();
    _listenNotify();
    super.onInit();
  }

  initVideoCallReceive() {
    videoCallController.init();
  }

  _listenNotify() {
    messageController.stream.listen((event) {
      if ((Get.currentRoute == Routes.LANDING && mainIndex.value != 0) ||
          (Get.currentRoute != Routes.CHAT &&
              Get.currentRoute != Routes.LANDING)) {
        if (event.author!.id != Session.instance.user!.id) {
          NotificationService().show(
              event.id!, event.author!.name!, event.textMessage!.text!,
              payload: event.group!.id!.toString());
        }
      }
    });
    notifyController.stream.listen((event) {
      NotificationService().show(100, 'HiChat', event.title ?? '');
    });
  }

  initRabbit() async {
    client.settings.authProvider =
        const AmqPlainAuthenticator('sa', 'Foxconn168!!');
    client.settings.host = Api.hostClear;
    client.settings.port = 5672;

    Channel channel = await client.channel();

    var udid = await Utils.getUDID();

    Api.instance.registerChannel(
        bearToken: Session.instance.tokenResp!.accessToken,
        data: {'deviceCode': udid}).then((value) async {
      log("CHANNEL: ###### " + value!.result!.toJson().toString());
      Queue messageChannel =
          await channel.queue(value.result!.messageChannelName!, durable: true);

      Queue notifyChannel =
          await channel.queue(value.result!.notifyChannelName!, durable: true);

      Consumer notifyConsumer = await notifyChannel.consume();
      Consumer messageConsumer = await messageChannel.consume();

      messageSubcription = messageConsumer.listen((event) {
        var data = MessageResponse.fromJson(
            event.payloadAsJson as Map<String, dynamic>);
        messageController.sink.add(data);
      });

      notifySubcription = notifyConsumer.listen((event) {
        NotifyResponse<Object?> data;
        data = NotifyResponse.fromJson(
            event.payloadAsJson as Map<String, dynamic>, (body) {
          try {
            return FriendRequestResponse.fromJson(body as Map<String, dynamic>);
          } catch (ex) {
            try {
              return User.fromJson(body as Map<String, dynamic>);
            } catch (ex1) {
              return null;
            }
          }
        });

        notifyController.sink.add(data);
      });
    }).catchError((error) {
      log(error.toString());
    });
  }

  @override
  void onClose() {
    notifySubcription?.cancel();
    messageSubcription?.cancel();
    // TODO: implement onClose
    super.onClose();
  }
}
