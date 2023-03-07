import 'package:cipher/core/app/app_observer.dart';
import 'package:cipher/core/app/cipher.dart';
import 'package:cipher/core/dio/dio_helper.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';

void main() async {
  final widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  Bloc.observer = AppObserver();
  DioHelper.init();
  runApp(
    const Cipher(),
  );
}


//TODO: Hydrated, Infinite, Search on Dropdownfield, intial show NPR, center aligned customtoast
