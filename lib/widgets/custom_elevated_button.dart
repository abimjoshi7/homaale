import 'package:cipher/core/constants/constants.dart';
import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({
    super.key,
    required this.callback,
    this.label = '',
    this.mainColor = kColorPrimary,
    this.textColor = Colors.white,
    this.borderColor = Colors.transparent,
    this.theHeight = 48,
    this.theWidth = 366,
    this.borderRadius,
  });

  final VoidCallback callback;
  final String label;
  final Color mainColor;
  final Color textColor;
  final Color borderColor;
  final double theHeight;
  final double theWidth;
  final double? borderRadius;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: callback,
      child: Container(
        height: theHeight,
        width: theWidth,
        decoration: BoxDecoration(
          color: mainColor,
          borderRadius: BorderRadius.circular(borderRadius ?? 10),
          border: Border.all(color: borderColor),
        ),
        child: Center(
          child: Text(
            label,
            style:
                // Theme.of(context).textTheme.bodySmall
                TextStyle(color: textColor),
          ),
        ),
      ),
    );
  }
}
