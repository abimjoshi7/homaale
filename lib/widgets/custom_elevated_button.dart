import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({
    Key? key,
    required this.callback,
    this.label = "",
    this.mainColor = const Color(0xff3D3F7D),
    this.textColor = Colors.white,
  }) : super(key: key);

  final VoidCallback callback;
  final String label;
  final Color mainColor;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: callback,
      child: Container(
        height: 48,
        width: 366,
        decoration: BoxDecoration(
            color: const Color(0xff3D3F7D),
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: const Color(0xff3D3F7D))),
        child: Center(
            child: Text(
          label,
          style: TextStyle(color: textColor),
        )),
      ),
    );
  }
}
