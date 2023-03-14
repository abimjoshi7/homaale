import 'package:cipher/core/constants/dimensions.dart';
import 'package:cipher/core/constants/text.dart';
import 'package:cipher/features/tasker/data/models/tasker_list_res.dart';
import 'package:cipher/widgets/widgets.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';

class TaskerExperienceSection extends StatelessWidget {
  const TaskerExperienceSection({super.key, required this.experience});

  final List<Experience> experience;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Card(
          elevation: 5,
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Experience',
                  style: kText17,
                ),
                addVerticalSpace(16),
                ListView.separated(
                  shrinkWrap: true,
                  primary: false,
                  padding: EdgeInsets.zero,
                  itemCount: experience.length,
                  itemBuilder: (context, index) {
                    return Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          experience[index].title.toString(),
                          style: kHeading3seconday,
                        ),
                        kHeight8,
                        Text(
                          '${experience[index].companyName} . ${experience[index].employmentType}',
                          style: kInfo,
                        ),
                        kHeight15,
                        Text(
                          '${experience[index].description}',
                          style: kSubHeading,
                        ),
                        kHeight15,
                        Text(
                          '${Jiffy(experience[index].startDate.toString()).yMMMM} - ${experience[index].endDate != null ? Jiffy(experience[index].endDate.toString()).yMMMM : 'Present'}',
                          style: kInfo,
                        ),
                        kHeight8,
                        Text(
                          '${experience[index].location}',
                          style: kSubHeading,
                        ),
                      ],
                    );
                  },
                  separatorBuilder: (context, index) => const Padding(
                    padding: EdgeInsets.symmetric(vertical: 8.0),
                    child: CustomHorizontalDivider(),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
