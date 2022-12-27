import 'package:flutter/material.dart';

class CustomTextButton extends StatelessWidget {
  const CustomTextButton({
    Key? key,
    required this.text,
    required this.voidCallback,
  }) : super(key: key);

  final String text;
  final VoidCallback voidCallback;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: voidCallback,
      child: Text(
        text,
        style: TextStyle(color: Color(0xff3d3f7d), fontWeight: FontWeight.w400),
      ),
    );
  }
}
