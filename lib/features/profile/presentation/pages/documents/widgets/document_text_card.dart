import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/features/profile/presentation/pages/about/widgets/widgets.dart';
import 'package:flutter/material.dart';

class DocumentTextCard extends StatelessWidget {
  const DocumentTextCard({
    super.key,
    required this.imagePath,
    required this.label,
    required this.iconPath,
    this.isLocalFile = true,
  });

  final String imagePath;
  final String label;
  final String iconPath;
  final bool isLocalFile;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              // borderRadius: BorderRadius.circular(10),
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
