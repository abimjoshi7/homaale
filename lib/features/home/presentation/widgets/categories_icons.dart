import 'package:cipher/core/constants/constants.dart';
import 'package:flutter/material.dart';

class CategoriesIcons extends StatelessWidget {
  const CategoriesIcons({
    super.key,
    this.color = Colors.black,
    this.data = '',
    this.child,
  });
  final Color color;
  final String data;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          height: 48,
          width: 48,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: color,
          ),
          child: child,
        ),
        kHeight10,
        Text(
          data,
          style: const TextStyle(
            color: Color(0xff3d3f7d),
            fontSize: 12,
            fontWeight: FontWeight.w400,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
