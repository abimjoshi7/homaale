import 'package:flutter/material.dart';

class CustomModalSheetDrawerIcon extends StatelessWidget {
  final Color color;
  final double width;
  const CustomModalSheetDrawerIcon({
    super.key,
    this.color = const Color(0xffCED4DA),
    this.width = 0.2,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: FractionallySizedBox(
        widthFactor: width,
        child: Container(
          height: 4.5,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(5),
          ),
        ),
      ),
    );
  }
}
