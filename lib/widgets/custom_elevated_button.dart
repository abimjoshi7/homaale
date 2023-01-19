import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({
    super.key,
    required this.callback,
    this.label = '',
    this.mainColor = const Color(0xff3D3F7D),
    this.textColor = Colors.white,
    this.borderColor = const Color(0xff3D3F7D),
  });

  final VoidCallback callback;
  final String label;
  final Color mainColor;
  final Color textColor;
  final Color borderColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: callback,
      child: Container(
        height: 48,
        width: 366,
        decoration: BoxDecoration(
          color: mainColor,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: borderColor),
        ),
        child: Center(
          child: Text(
            label,
            style: TextStyle(color: textColor),
          ),
        ),
      ),
    );
  }
}
