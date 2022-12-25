import 'package:cipher/core/constants/dimensions.dart';
import 'package:cipher/features/onboarding/presentation/pages/onboarding.dart';
import 'package:cipher/features/sign_in/presentation/pages/sign_in_with_phone.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

class SplashPage extends StatefulWidget {
  static const routeName = "/splash-page";
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  late Widget theChild;

  Widget _buildSplash(BuildContext context) {
    BoxDecoration initialDecoration() => const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.contain,
            image: AssetImage(
              "assets/homaale-logo.png",
            ),
          ),
        );

    BoxDecoration endDecoration() => const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.contain,
            image: AssetImage(
              "assets/homaale_logo_title.png",
            ),
          ),
        );

    return Stack(
      children: [
        Image.asset("assets/splash_ellipse.png"),
        Positioned(
          left: MediaQueryHelper.theWidth(context) * 0.21,
          top: MediaQueryHelper.theHeight(context) * 0.14,
          child: TweenAnimationBuilder(
            tween: DecorationTween(
              begin: initialDecoration(),
              end: endDecoration(),
            ),
            duration: const Duration(seconds: 2),
            builder: (context, value, child) {
              return Center(
                child: Container(
                  height: 60,
                  width: 160,
                  decoration: value,
                ),
              );
            },
            curve: Curves.elasticIn,
            onEnd: () {
              Navigator.pushNamedAndRemoveUntil(
                  context, Onboarding.routeName, (route) => false);
            },
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    FlutterNativeSplash.remove();
    return Scaffold(
      body: Center(
        child: _buildSplash(context),
      ),
    );
  }
}
