import 'package:flutter/material.dart';

class CustomHeader extends StatelessWidget {
  const CustomHeader({
    Key? key,
    required this.leadingWidget,
    required this.trailingWidget,
  }) : super(key: key);

  final Widget leadingWidget;
  final Widget trailingWidget;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [leadingWidget, trailingWidget],
    );
  }
}
