import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/features/profile/presentation/pages/about/widgets/widgets.dart';
import 'package:flutter/material.dart';

class DocumentTextCard extends StatelessWidget {
  const DocumentTextCard({
    super.key,
    required this.imagePath,
    required this.label,
    required this.iconPath,
  });

  final String imagePath;
  final String label;
  final String iconPath;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: DecoratedBox(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
            child: Image.asset(imagePath),
          ),
        ),
        kHeight5,
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: IconText(
            label: label,
            widget: Image.asset(iconPath),
          ),
        ),
      ],
    );
  }
}
