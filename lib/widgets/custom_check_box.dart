import 'package:cipher/core/constants/constants.dart';
import 'package:flutter/material.dart';

class CustomCheckBox extends StatelessWidget {
  const CustomCheckBox({
    Key? key,
    this.isChecked = false,
    required this.onTap,
    this.boxColor = kColorSecondary,
  }) : super(key: key);
  final bool isChecked;
  final VoidCallback onTap;
  final Color boxColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 22,
        width: 22,
        decoration: BoxDecoration(
          color: boxColor,
          borderRadius: BorderRadius.circular(4),
        ),
        child: isChecked == false
            ? null
            : const Icon(
                Icons.done,
                size: 15,
                color: Colors.white,
              ),
      ),
    );
  }
}
