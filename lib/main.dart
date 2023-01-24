import 'package:cipher/core/app/app_observer.dart';
import 'package:cipher/core/app/cipher.dart';
import 'package:cipher/core/cache/cache_helper.dart';
import 'package:cipher/core/dio/dio_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

void main() async {
  final widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  Bloc.observer = AppObserver();
  DioHelper.init();
  await CacheHelper.clearAllCachedData();
  runApp(
    const Cipher(),
  );
}


// TODO: ui show forgot password
// TODO: email, contact edit
// TODO: forgot password -> confirm-otp (Phone)
