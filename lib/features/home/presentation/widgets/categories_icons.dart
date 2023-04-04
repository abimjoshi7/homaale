import 'package:cipher/core/constants/constants.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';

class CategoriesIcons extends StatelessWidget {
  const CategoriesIcons({
    super.key,
    this.color = Colors.black,
    this.data = '',
    this.child,
    this.onTap,
  });
  final Color color;
  final String data;
  final Widget? child;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Flexible(
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: color,
              ),
              child: Center(child: child),
            ),
          ),
          kHeight5,
          Flexible(
            child: AutoSizeText(
              data,
              style: const TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w400,
              ),
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
