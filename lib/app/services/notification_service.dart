import 'package:flutter_local_notifications/flutter_local_notifications.dart';

const AndroidNotificationDetails androidPlatformChannelSpecifics =
    AndroidNotificationDetails(
        '1213', //Required for Android 8.0 or after
        'hheeh', //Required for Android 8.0 or after
        channelDescription: 'asjkadkjsjkda', //Required for Android 8.0 or after
        importance: Importance.max,
        priority: Priority.high);
const NotificationDetails platformChannelSpecifics =
    NotificationDetails(android: androidPlatformChannelSpecifics);

class NotificationService {
  static final NotificationService _notificationService =
      NotificationService._internal();

  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  factory NotificationService() {
    return _notificationService;
  }

  NotificationService._internal();

  Future<void> init() async {
    final AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('@drawable/img');

    // final IOSInitializationSettings initializationSettingsIOS =
    // IOSInitializationSettings(
    //   requestSoundPermission: false,
    //   requestBadgePermission: false,
    //   requestAlertPermission: false,
    //   onDidReceiveLocalNotification: onDidReceiveLocalNotification,
    // );

    final InitializationSettings initializationSettings =
        InitializationSettings(
            android: initializationSettingsAndroid, iOS: null, macOS: null);

    await flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      onSelectNotification: (payload) {},
    );
  }

  Future show(int id, String title, String message, {String? payload}) async {
    await flutterLocalNotificationsPlugin
        .show(id, title, message, platformChannelSpecifics, payload: payload);
  }

  Future selectNotification(String payload) async {
    //Handle notification tapped logic here
  }
}
