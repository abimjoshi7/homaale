// ignore_for_file: depend_on_referenced_packages

import 'dart:developer';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/data/latest.dart' as tz;

class LocalNotificationService {
  static final FlutterLocalNotificationsPlugin _notificationsPlugin = FlutterLocalNotificationsPlugin();

  static void initialize(BuildContext context) async {
    const AndroidInitializationSettings androidInitializationSettings =
        AndroidInitializationSettings("@mipmap/launcher_icon");

    const DarwinInitializationSettings darwinInitializationSettings = DarwinInitializationSettings(
      defaultPresentAlert: false,
      defaultPresentBadge: false,
      defaultPresentSound: false,
    );

    InitializationSettings initializationSettings = const InitializationSettings(
      android: androidInitializationSettings,
      iOS: darwinInitializationSettings,
    );

    // *** Initialize timezone here ***
    tz.initializeTimeZones();

    await _notificationsPlugin.initialize(
      initializationSettings,
    );
  }

  Future<void> onSelectNotification(String? payload) async {}

  static const channelId = "1";
  static const AndroidNotificationDetails _androidNotificationDetails = AndroidNotificationDetails(
    channelId,
    "localNotification",
    channelDescription: "This channel is responsible for all the local notifications",
    playSound: true,
    priority: Priority.high,
    importance: Importance.high,
  );

  static const DarwinNotificationDetails _darwinNotificationDetails =
      DarwinNotificationDetails(presentSound: true, presentAlert: true, presentBadge: true, sound: 'default.wav');

  static void display(RemoteMessage message) async {
    try {
      final id = DateTime.now().millisecondsSinceEpoch ~/ 1000;

      const NotificationDetails notificationDetails = NotificationDetails(       
        android: _androidNotificationDetails,
        iOS: _darwinNotificationDetails,
      );

      await _notificationsPlugin.show(
        id,
        message.notification!.title,
        message.notification!.body,
        notificationDetails,
        payload: message.data["route"].toString(),
      );
    } on Exception catch (e) {
      log("$e");
    }
  }
}