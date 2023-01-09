import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/features/portfolio/presentation/cubit/tasker_experience_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ExperienceSection extends StatelessWidget {
  const ExperienceSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TaskerExperienceCubit, TaskerExperienceState>(
      builder: (context, state) {
        if (state is TaskerGetExperienceSuccess) {
          return Padding(
            padding: const EdgeInsets.all(8),
            child: Card(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.all(20),
                    child: Text(
                      'Experience',
                      style: kPurpleText19,
                    ),
                  ),
                  Column(
                    children: List.generate(
                      state.taskerExperienceRes.result!.length,
                      (index) => Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Text(
                              state.taskerExperienceRes.result![index]!.title!,
                              style: kText17,
                            ),
                            Text(
                              '${state.taskerExperienceRes.result![index]!.companyName!}. ${state.taskerExperienceRes.result![index]!.employmentType}',
                              style: kHelper13,
                            ),
                            Text(
                              state.taskerExperienceRes.result![index]!
                                  .description!,
                              style: kText15,
                            ),
                            Text(
                              '${state.taskerExperienceRes.result![index]!.startDate.toString().substring(0, 10)} - ${state.taskerExperienceRes.result![index]!.endDate.toString().substring(0, 10)}',
                              style: kHelper13,
                            ),
                            const Divider()
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        } else {
          return Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'Experience',
                  style: kPurpleText19,
                ),
                kHeight10,
                Text('Garden Cleaner'),
                Text(
                  'Cagtu. Full-time',
                  style: kHelper13,
                ),
                Text(
                  'I am excited about helping companies with their product development, management and strategy. I specialize in deep tech and hard analytical problems.',
                ),
                Text(
                  'June 2002-Present',
                  style: kHelper13,
                )
              ],
            ),
          );
        }
      },
    );
  }
}
