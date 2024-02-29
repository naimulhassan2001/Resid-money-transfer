import 'dart:math';

import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';

import '../core/app_route/app_route.dart';

class NotificationService {
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();


  Future<void> initLocalNotification() async {
    var androidInitializationSettings =
        const AndroidInitializationSettings("@mipmap/ic_launcher");
    var iosInitializationSettings = const DarwinInitializationSettings();

    var initializationSettings = InitializationSettings(
        android: androidInitializationSettings, iOS: iosInitializationSettings);

    await flutterLocalNotificationsPlugin.initialize(initializationSettings,
        onDidReceiveNotificationResponse: (payload) {
      print("Route") ;
      Get.toNamed(AppRoute.notification) ;
        });
  }



  Future<void> showNotification(dynamic message) async {

    AndroidNotificationChannel channel = AndroidNotificationChannel(
        Random.secure().nextInt(10000).toString(),
        "High Importance Notification",
        importance: Importance.max);

    AndroidNotificationDetails androidNotificationDetails =
    AndroidNotificationDetails(channel.id, channel.name,
        channelDescription: "your channel Description",
        importance: Importance.high,
        priority: Priority.high,
        ticker: "ticker");

    DarwinNotificationDetails darwinNotificationDetails =
    const DarwinNotificationDetails(
        presentAlert: true,
        presentBadge: true,
        presentSound: true);

    NotificationDetails notificationDetails = NotificationDetails(
        android: androidNotificationDetails, iOS: darwinNotificationDetails);

    Future.delayed(Duration.zero, () {
      flutterLocalNotificationsPlugin.show(
          0,
          message["type"],
          message["message"],
          notificationDetails);
    });
  }



}
