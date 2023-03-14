import 'package:cipher/core/constants/paddings.dart';
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
        padding: kPadding10,
        child: Wrap(
          runSpacing: 8,
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
