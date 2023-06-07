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
          Flexible(
            child: Padding(
              padding: const EdgeInsets.all(
                5,
              ),
              child: Text(
                data,
                style: Theme.of(context).textTheme.bodySmall,
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
