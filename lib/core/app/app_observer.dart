// ignore_for_file: strict_raw_type, lines_longer_than_80_chars

import 'dart:developer';

import 'package:dependencies/dependencies.dart';

class AppObserver implements BlocObserver {
  @override
  void onChange(BlocBase bloc, Change change) {
    log('CURRENT: ${change.currentState}, NEXT: ${change.nextState}');
  }

  @override
  void onClose(BlocBase bloc) {
    log('BLOC CLOSED!');
  }

  @override
  void onCreate(BlocBase bloc) {
    log('BLOC CREATED! $bloc');
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    log('BLOC ERROR: $error');
  }

  @override
  void onEvent(Bloc bloc, Object? event) {
    log('EVENT: $event');
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    // log('Transition current: ${transition.currentState}, Transition next: ${transition.nextState}');
  }
}
