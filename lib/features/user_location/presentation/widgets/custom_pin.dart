import 'package:flutter/material.dart';

class CustomPin extends StatelessWidget {
  const CustomPin({super.key, required this.isDragged});
  final bool isDragged;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: 135.0,
        width: 160.0,
        child: Stack(
          alignment: Alignment.topCenter,
          children: <Widget>[
            Visibility(
              visible: !isDragged,
              child: Image.asset(
                "assets/logos/pin-msg-alt.png",
                width: 160.0,
                height: 55.0,
                fit: BoxFit.cover,
                filterQuality: FilterQuality.high,
                // height: 40.0,
              ),
            ),
            Positioned(
              top: 45.0,
              child: Image.asset(
                "assets/logos/map-pin-alt.png",
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
