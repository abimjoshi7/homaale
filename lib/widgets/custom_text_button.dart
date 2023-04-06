import 'package:flutter/material.dart';

class CustomTextButton extends StatelessWidget {
  const CustomTextButton({
    super.key,
    required this.text,
    required this.voidCallback,
    this.style,
  });
  final TextStyle? style;
  final String text;
  final VoidCallback voidCallback;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: voidCallback,
      child: Text(
        text,
        style: style ??
            const TextStyle(
              color: Color(0xff3d3f7d),
              fontWeight: FontWeight.w400,
            ),
      ),
    );
  }
}
