import 'dart:async';
import 'dart:developer';

import 'package:dart_amqp/dart_amqp.dart';
import 'package:get/get.dart';
import 'package:pea_chat/app/data/model/message_response.dart';
import 'package:pea_chat/app/data/provider/local/session.dart';
import 'package:pea_chat/app/data/provider/remote/api.dart';
import 'package:pea_chat/app/utils/utils.dart';
/**
 * GetX Template Generator - fb.com/htngu.99
 * */

class LandingController extends GetxController {
  var mainIndex = 0.obs;

  var client = Client();

  var notifyController = StreamController<MessageResponse>.broadcast();
  var messageController = StreamController<MessageResponse>.broadcast();

  StreamSubscription? notifySubcription;
  StreamSubscription? messageSubcription;

  @override
  void onInit() {
    initRabbit();
    super.onInit();
  }

  initRabbit() async {
    client.settings.authProvider =
        const AmqPlainAuthenticator('admin', 'Foxconn168!!');
    client.settings.host = 'http://10.10.1.14';
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
        var data = MessageResponse.fromJson(
            event.payloadAsJson as Map<String, dynamic>);
        notifyController.sink.add(data);
      });
    });
  }
}
