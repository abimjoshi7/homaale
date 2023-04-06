import 'package:cipher/core/constants/constants.dart';
import 'package:dependencies/dependencies.dart';
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
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          iconData,
          color: color,
          size: size,
        ),
        addHorizontalSpace(
          5,
        ),
        Flexible(
          child: AutoSizeText(
            label,
            maxFontSize: 12,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}
