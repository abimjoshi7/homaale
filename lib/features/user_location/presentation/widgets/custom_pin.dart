import 'package:flutter/material.dart';

class CustomPin extends StatelessWidget {
  const CustomPin({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: 130.0,
        width: 150.0,
        child: Stack(
          alignment: Alignment.topCenter,
          children: <Widget>[
            Image.asset(
              "assets/logos/pin-msg.png",
              width: 149.0,
              height: 50.0,
              fit: BoxFit.cover,
              filterQuality: FilterQuality.high,
              // height: 40.0,
            ),
            Positioned(
              top: 45.0,
              child: Image.asset(
                "assets/logos/map-pin.png",
                filterQuality: FilterQuality.high,
                width: 40.0,
                height: 48.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
