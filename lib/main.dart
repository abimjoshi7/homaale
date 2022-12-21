import 'package:cipher/app_bloc_observer.dart';
import 'package:cipher/features/sign_in/presentation/pages/sign_in_with_phone.dart';
import 'package:cipher/features/sign_up/presentation/bloc/sign_up_bloc.dart';
import 'package:cipher/features/splash/presentation/pages/splash_page.dart';
import 'package:cipher/route_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const Cipher());
}

class Cipher extends StatelessWidget {
  const Cipher({super.key});

  @override
  Widget build(BuildContext context) {
    Bloc.observer = AppBlocObserver();
    return MaterialApp(
      initialRoute: SignInWithPhone.routeName,
      onGenerateRoute: (settings) => RouteService.onGenerate(settings),
    );
  }
}
