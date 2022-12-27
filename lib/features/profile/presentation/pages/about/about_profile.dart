import 'package:cipher/core/constants/constants.dart';
import 'package:flutter/material.dart';

import 'widgets/widgets.dart';

class AboutProfile extends StatelessWidget {
  const AboutProfile({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          DescriptionSection(),
          kHeight10,
          const SkillsSection(),
          PortfolioSection(),
          ExperienceSection(),
        ],
      ),
    );
  }
}
