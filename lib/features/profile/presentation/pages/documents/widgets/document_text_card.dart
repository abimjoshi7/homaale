import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/widgets/widgets.dart';
import 'package:flutter/material.dart';

class DocumentTextCard extends StatelessWidget {
  const DocumentTextCard({
    super.key,
    required this.imagePath,
    required this.label,
    this.isLocalFile = true,
  });

  final String imagePath;
  final String label;
  final bool isLocalFile;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                4,
              ),
              image: DecorationImage(
                image: NetworkImage(imagePath),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        kHeight5,
        WidgetText(
          label: label,
          widget: const Icon(
            Icons.filter,
            size: 14,
            color: kColorSilver,
          ),
        ),
      ],
    );
  }
}
