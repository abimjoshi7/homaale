import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/features/portfolio/presentation/cubit/tasker_education_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EducationSection extends StatelessWidget {
  const EducationSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TaskerEducationCubit, TaskerEducationState>(
      builder: (context, state) {
        if (state is TaskerGetEducationSuccess) {
          return Padding(
            padding: const EdgeInsets.all(8),
            child: Card(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.all(20),
                    child: Text(
                      'Education',
                      style: kPurpleText19,
                    ),
                  ),
                  Column(
                    children: List.generate(
                      state.taskerEducationRes.result!.length,
                      (index) => Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Text(
                              state.taskerEducationRes.result![index]!.school!,
                              style: kText17,
                            ),
                            Text(
                              state.taskerEducationRes.result![index]!.degree!,
                              style: kText15,
                            ),
                            Text(
                              '${state.taskerEducationRes.result![index]!.startDate.toString().substring(0, 10)} - ${state.taskerEducationRes.result![index]!.endDate.toString().substring(0, 10)}',
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
          return SizedBox.shrink();
          return Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'Education',
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
