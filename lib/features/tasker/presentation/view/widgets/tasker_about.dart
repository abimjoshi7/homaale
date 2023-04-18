import 'package:cipher/core/constants/dimensions.dart';
import 'package:cipher/features/tasker/data/models/tasker_list_res.dart'
    as tsklst;
import 'package:cipher/features/tasker/presentation/view/widgets/tasker_description_section.dart';
import 'package:cipher/features/tasker/presentation/view/widgets/tasker_education_section.dart';
import 'package:cipher/features/tasker/presentation/view/widgets/tasker_experience_section.dart';
import 'package:cipher/features/tasker/presentation/view/widgets/tasker_portfolio_section.dart';
import 'package:cipher/features/tasker/presentation/view/widgets/tasker_skills_section.dart';
import 'package:flutter/material.dart';

class TaskerAboutSection extends StatefulWidget {
  const TaskerAboutSection({
    super.key,
    this.bio,
    this.contact,
    this.activeHourStart,
    this.activeHourEnd,
    this.skills,
    this.location,
    this.portfolio,
    this.experience,
    this.education,
  });

  final String? bio;
  final String? contact;
  final String? activeHourStart;
  final String? activeHourEnd;
  final String? skills;
  final String? location;
  final List<tsklst.Portfolio>? portfolio;
  final List<tsklst.Experience>? experience;
  final List<tsklst.Education>? education;

  @override
  State<TaskerAboutSection> createState() => _TaskerAboutSectionState();
}

class _TaskerAboutSectionState extends State<TaskerAboutSection> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TaskerDescriptionSection(
              bio: widget.bio,
              contact: widget.contact,
              activeHourStart: widget.activeHourStart,
              activeHourEnd: widget.activeHourEnd,
              skills: widget.skills,
              location: widget.location,
            ),
            addVerticalSpace(16),
            TaskerSkillsSection(
              skills: widget.skills,
            ),
            addVerticalSpace(16),
            if (widget.portfolio!.isNotEmpty)
              TaskerPortfolioSection(
                portfolio: widget.portfolio ?? [],
              )
            else
              Container(),
            addVerticalSpace(16),
            if (widget.experience!.isNotEmpty)
              TaskerExperienceSection(
                experience: widget.experience ?? [],
              )
            else
              Container(),
            addVerticalSpace(16),
            if (widget.education!.isNotEmpty)
              TaskerEducationSection(
                education: widget.education ?? [],
              )
            else
              Container(),
            addVerticalSpace(16),
          ],
        ),
      ),
    );
  }
}
