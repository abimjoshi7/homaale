import 'package:cipher/core/app/root.dart';
import 'package:cipher/features/onboarding/presentation/pages/onboarding.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});
  static const routeName = '/splash-page';

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  Future<void> inititalLogCheck() async {
    const isLogged = false;
    if (isLogged == true) {
      setState(() {
        theChild = const Root();
      });
    } else {
      setState(() {
        theChild = _buildSplash(context);
      });
    }
  }

  @override
  void initState() {
    theChild = const SizedBox.shrink();
    Future.delayed(
      const Duration(
        milliseconds: 500,
      ),
      () async => setState(
        () {
          inititalLogCheck();
        },
      ),
    );
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

    return Scaffold(
      body: Center(
        child: Stack(
          children: [
            Image.asset('assets/splash_ellipse.png'),
            Positioned(
              left: 100,
              top: 120,
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
                curve: Curves.bounceIn,
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
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    FlutterNativeSplash.remove();
    return theChild;
  }
}
