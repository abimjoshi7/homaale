import 'package:cipher/features/profile/presentation/pages/about/widgets/widgets.dart';
import 'package:flutter/material.dart';

class AboutProfile extends StatelessWidget {
  const AboutProfile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: const [
            DescriptionSection(),
            SkillsSection(),
            PortfolioSection(),
            ExperienceSection(),
            EducationSection(),
            CertificationSection(),
          ],
        ),
      ),
    );
  }
}
