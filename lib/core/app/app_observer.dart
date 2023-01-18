// ignore_for_file: strict_raw_type, lines_longer_than_80_chars

import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';

class AppObserver implements BlocObserver {
  @override
  void onChange(BlocBase bloc, Change change) {
    log('Current State: ${change.currentState}, Next State: ${change.nextState}');
  }

  @override
  void onClose(BlocBase bloc) {
    log('Bloc closed!');
  }

  @override
  void onCreate(BlocBase bloc) {
    log('Bloc created!');
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    log('Error: ${error.toString()}');
  }

  @override
  void onEvent(Bloc bloc, Object? event) {
    log('Event called: ${event.toString()}');
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    log('Transition current: ${transition.currentState}, Transition next: ${transition.nextState.toString()}');
  }
}
