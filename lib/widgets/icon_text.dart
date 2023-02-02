import 'package:cipher/core/constants/constants.dart';
import 'package:flutter/material.dart';

class IconText extends StatelessWidget {
  const IconText({
    super.key,
    required this.label,
    required this.iconData,
    this.size = 17,
    this.color = kColorPrimary,
  });

  final IconData iconData;
  final Color color;
  final double size;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5,),
      child: Row(
        children: [
          Icon(iconData, color: color, size: size,),
          kWidth10,
          Text(
            label,
          ),
        ],
      ),
    );
  }
}
