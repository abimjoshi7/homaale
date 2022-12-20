import 'package:flutter/material.dart';

class SplashPage extends StatelessWidget {
  static const routeName = "/splash-page";
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(
          children: [
            Container(
              height: 210.31,
              width: 250.5,
              decoration: BoxDecoration(
                color: Color(0xffECF3FF),
              ),
            ),
            Container(
              height: 59.87,
              width: 58,
              decoration: BoxDecoration(
                color: Color(0xffFFCA6A),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
