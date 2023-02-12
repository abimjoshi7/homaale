import 'package:cipher/widgets/widgets.dart';
import 'package:flutter/material.dart';

class CustomDottedContainerStack extends StatelessWidget {
  const CustomDottedContainerStack({
    super.key,
    this.theHeight = 48,
    this.label = '',
  });

  final double theHeight;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: theHeight,
          width: double.infinity,
          child: const DashedRect(),
        ),
        Padding(
          padding: const EdgeInsets.all(8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconText(
                label: label,
                iconData: Icons.add,
              ),
            ],
          ),
        )
      ],
    );
  }
}
