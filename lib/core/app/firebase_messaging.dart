import 'dart:developer';
import 'package:cipher/core/constants/navigation_constants.dart';
import 'package:cipher/features/sign_in/presentation/pages/sign_in_page.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

import 'local_notification_service.dart';

class FirebaseAppMessaging {
  static initNotification(BuildContext context) async {
    late final FirebaseMessaging _messaging;
    LocalNotificationService.initialize(context);
    _messaging = FirebaseMessaging.instance;
// NotificationSettings settings = await _messaging.requestPermission(
//     alert: true,
//     badge: true,
//     provisional: false,
//     sound: true,
//   );

    await _messaging.setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );

    ///gives you the message on which user taps
    ///and it opened the app from terminated state
    _messaging.getInitialMessage().then((message) {
      log("FM initial message: ${message?.data}");
      if (message?.data != null) {
        Future.delayed(
          const Duration(milliseconds: 500),
          () {
            Navigator.pushNamed(navigationKey.currentState!.context, SignInPage.routeName);
          },
        );
      }
    });
    ///foreground work
    FirebaseMessaging.onMessage.listen((message) {
      LocalNotificationService.display(message);
    });

    ///When the app is in background but opened and user taps
    ///on the notification
    FirebaseMessaging.onMessageOpenedApp.listen((message) {
      log("FM on message opened: ${message.data}");
      if (message.data.isNotEmpty) {
        Future.delayed(
          const Duration(milliseconds: 500),
          () {
            Navigator.pushNamed(navigationKey.currentState!.context, SignInPage.routeName);
          },
        );
      }
    });
  }
}