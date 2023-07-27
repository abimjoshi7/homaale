import 'package:cipher/core/app/app_observer.dart';
import 'package:cipher/core/app/cipher.dart';
import 'package:cipher/core/dio/dio_helper.dart';
import 'package:cipher/firebase_options.dart';
import 'package:cipher/locator.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';

void main() async {
  final widgetsBinding = WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  FlutterNativeSplash.preserve(
    widgetsBinding: widgetsBinding,
  );

  Bloc.observer = AppObserver();

  DioHelper.init();

  // initialize locator
  await init();

  runApp(const Cipher());
}

//TODO: no bookings after 3 times
//TODO: Service booking event validation(dates other than event cna be selected)
//TODO: edit portfolio

// 48823444-3b3c-4022-95d9-7aa5d332abac
// 93e06ed2-fec1-4c56-9233-56b24db773a9
