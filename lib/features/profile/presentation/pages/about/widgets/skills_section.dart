import 'package:cipher/core/constants/constants.dart';
import 'package:flutter/material.dart';

import 'widgets.dart';

class SkillsSection extends StatelessWidget {
  const SkillsSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("Skills"),
          kHeight10,
          Row(
            children: const [
              SkillBox(
                label: "Planting",
              ),
              kWidth10,
              SkillBox(
                label: "Washing",
              ),
              kWidth10,
              SkillBox(
                label: "Cleaning",
              ),
            ],
          )
        ],
      ),
    );
  }
}
