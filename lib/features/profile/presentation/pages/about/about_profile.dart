import 'package:cipher/features/profile/presentation/pages/about/views/views.dart';
import 'package:flutter/material.dart';

class AboutProfile extends StatelessWidget {
  const AboutProfile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Wrap(
          children: const [
            DescriptionView(),
            SkillsView(),
            PortfolioView(),
            ExperienceView(),
            EducationView(),
            CertificationView(),
          ],
        ),
      ),
    );
  }
}
