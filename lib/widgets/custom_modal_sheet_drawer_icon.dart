import 'package:flutter/material.dart';

class CustomModalSheetDrawerIcon extends StatelessWidget {
  const CustomModalSheetDrawerIcon({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: FractionallySizedBox(
        widthFactor: 0.1,
        child: Container(
          height: 3.5,
          decoration: BoxDecoration(
            color: const Color(0xffCED4DA),
            borderRadius: BorderRadius.circular(5),
          ),
        ),
      ),
    );
  }
}
