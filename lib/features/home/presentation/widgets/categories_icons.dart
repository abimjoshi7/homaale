import 'package:cipher/core/constants/constants.dart';
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
      child: Padding(
        padding: const EdgeInsets.all(5),
        child: Column(
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
            kHeight5,
            Flexible(
              child: Text(
                data,
                style: const TextStyle(
                  color: Color(0xff3d3f7d),
                  fontSize: 11,
                  fontWeight: FontWeight.w400,
                ),
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
