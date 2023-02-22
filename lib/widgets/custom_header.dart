import 'package:flutter/material.dart';

class CustomHeader extends StatelessWidget {
  const CustomHeader({
    super.key,
    required this.leadingWidget,
    required this.trailingWidget,
    this.child,
  });

  final Widget leadingWidget;
  final Widget trailingWidget;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        leadingWidget,
        child ?? const SizedBox.shrink(),
        trailingWidget,
      ],
    );
  }
}
