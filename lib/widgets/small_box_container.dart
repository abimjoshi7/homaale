import 'package:flutter/material.dart';

class SmallBoxContainer extends StatelessWidget {
  const SmallBoxContainer({
    Key? key,
    this.theHeight = 48,
    this.theWidth = 48,
    this.child,
  }) : super(key: key);

  final double theHeight;
  final double theWidth;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: theHeight,
      width: theWidth,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          border: Border.all(color: const Color(0xffCED4DA))),
      child: Center(child: child),
    );
  }
}
