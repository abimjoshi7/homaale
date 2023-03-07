import 'package:cipher/core/constants/dimensions.dart';
import 'package:cipher/core/constants/text.dart';
import 'package:cipher/features/user/data/models/tasker_profile_retrieve_res.dart';
import 'package:cipher/widgets/widgets.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';

class TaskerEducationSection extends StatelessWidget {
  const TaskerEducationSection({super.key, required this.education});

  final List<Education> education;

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
                  'Education',
                  style: kText17,
                ),
                addVerticalSpace(16),
                ListView.separated(
                  shrinkWrap: true,
                  primary: false,
                  padding: EdgeInsets.zero,
                  itemCount: education.length,
                  itemBuilder: (context, index) {
                    return Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          education[index].school.toString(),
                          style: kHeading3seconday,
                        ),
                        kHeight8,
                        Text(
                          education[index].degree.toString(),
                          style: kSubHeading,
                        ),
                        kHeight8,
                        Text(
                          '${Jiffy(education[index].startDate.toString()).yMMMM} - ${education[index].endDate != null ? Jiffy(education[index].endDate.toString()).yMMMM : 'Present'}',
                          style: kInfo,
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
