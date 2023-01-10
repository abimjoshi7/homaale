import 'package:cipher/core/app/root.dart';
import 'package:cipher/core/cache/cache_helper.dart';
import 'package:cipher/core/constants/dimensions.dart';
import 'package:cipher/core/constants/strings.dart';
import 'package:cipher/features/onboarding/presentation/pages/onboarding.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});
  static const routeName = '/splash-page';

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  Future<void> inititalLogCheck() async {
    await CacheHelper.getCachedString(kAccessTokenP).then(
      (x) {
        if (x != null) {
          setState(() {
            theChild = const Root();
          });
        } else {
          setState(() {
            theChild = _buildSplash(context);
          });
        }
      },
    );
  }

  @override
  void initState() {
    theChild = const SizedBox.shrink();
    inititalLogCheck();
    super.initState();
  }

  late Widget theChild;

  Widget _buildSplash(BuildContext context) {
    BoxDecoration initialDecoration() => const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.contain,
            image: AssetImage(
              'assets/homaale-logo.png',
            ),
          ),
        );

    BoxDecoration endDecoration() => const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.contain,
            image: AssetImage(
              'assets/homaale_logo_title.png',
            ),
          ),
        );

    return Stack(
      children: [
        Image.asset('assets/splash_ellipse.png'),
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
                context,
                Onboarding.routeName,
                (route) => false,
              );
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
        child: theChild,
      ),
    );
  }
}
