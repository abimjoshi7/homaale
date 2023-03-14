import 'package:cipher/core/app/app_observer.dart';
import 'package:cipher/core/app/cipher.dart';
import 'package:cipher/core/dio/dio_helper.dart';
import 'package:cipher/locator.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';

void main() async {
  final widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  Bloc.observer = AppObserver();
  DioHelper.init();
  // initialize locator
  init();
  runApp(
    const Cipher(),
  );
}


//TODO:
// * 1) Infinite,
// * 2) Search on Dropdownfield,
// * 3) location -> cipher
// * 4) location -> not updatable
// * 5) Complete Profile -> Interest Sorting
// * 6) Complete Profile -> Time of the day showing
// * 7) Complete Profile -> Country, city, language, currency mandatory field with initial value
// * 8) Complete Profile -> Designation -> Job Profile
// * 8) Complete Profile -> Visibility, Task Prefs (Not Mandatory)
// * 8) Complete Profile -> Designation -> Job Profile
