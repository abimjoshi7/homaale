import 'package:flutter/material.dart';

class CustomHorizontalDivider extends StatelessWidget {
  const CustomHorizontalDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: 1,
      child: Container(
        height: 1,
        decoration: BoxDecoration(color: Colors.grey.shade200),
      ),
    );
  }
}
