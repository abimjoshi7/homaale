import 'dart:convert';

import 'package:cipher/core/constants/dimensions.dart';
import 'package:cipher/core/constants/text.dart';
import 'package:cipher/features/profile/presentation/pages/about/widgets/skill_box.dart';
import 'package:flutter/material.dart';

class TaskerSkillsSection extends StatelessWidget {
  const TaskerSkillsSection({super.key, this.skills});

  final String? skills;

  Widget displaySkills() {
    if (skills != null && skills!.isNotEmpty) {
      final List<String> skill = [
        ...jsonDecode(skills.toString()) as Iterable<String>
      ];

      return SizedBox(
        height: 40,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) => SkillBox(label: skill[index]),
          separatorBuilder: (context, index) => kWidth10,
          itemCount: skill.length,
        ),
      );
    } else {
      return const Text(
        'No skills added',
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Skills',
            style: kText17,
          ),
          kHeight8,
          displaySkills(),
        ],
      ),
    );
  }
}
