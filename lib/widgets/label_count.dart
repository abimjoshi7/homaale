import 'package:flutter/material.dart';

class BuildLabelCount extends StatelessWidget {
  final String count;
  final String label;
  final Color? textColor;

  const BuildLabelCount({super.key, required this.count, required this.label, this.textColor});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          count,
          style: Theme.of(context).textTheme.bodyMedium,
          // ?.copyWith(color: textColor ?? kColorPrimary),
        ),
        Text(
          label,
          style: Theme.of(context).textTheme.bodySmall,
        ),
      ],
    );
  }
}
