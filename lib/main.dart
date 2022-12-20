import 'package:cipher/features/sign_in/presentation/pages/sign_in_page.dart';
import 'package:cipher/features/splash/presentation/pages/splash_page.dart';
import 'package:cipher/route_service.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const Cipher());
}

class Cipher extends StatelessWidget {
  const Cipher({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: SignInPage.routeName,
      onGenerateRoute: (settings) => RouteService.onGenerate(settings),
    );
  }
}
