import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/features/documents/presentation/cubit/cubits.dart';
import 'package:cipher/features/documents/presentation/pages/edit/edit_education.dart';
import 'package:cipher/features/documents/presentation/pages/pages.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';

class EducationView extends StatelessWidget {
  const EducationView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TaskerEducationCubit, TaskerEducationState>(
      builder: (context, state) {
        // if (state is TaskerEducationInitial) {
        //   return const Center(
        //     child: CircularProgressIndicator(),
        //   );
        // }
        if (state is TaskerGetEducationSuccess) {
          return Card(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                       Text(
                        'Education',
                         style: Theme.of(context).textTheme.headlineSmall,
                      ),
                      IconButton(
                        onPressed: () {
                          Navigator.pushNamed(
                            context,
                            AddEducation.routeName,
                          );
                        },
                        icon: const Icon(
                          Icons.add,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: List.generate(
                      state.taskerEducationRes.length,
                      (index) => Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  state.taskerEducationRes[index].school ?? '',
                                  style: kText17,
                                ),
                                Row(
                                  children: [
                                    IconButton(
                                      onPressed: () async {
                                        showModalBottomSheet(
                                          constraints: const BoxConstraints(
                                            maxHeight: 800,
                                          ),
                                          isScrollControlled: true,
                                          context: context,
                                          builder: (context) => EditEducation(
                                            id: state
                                                .taskerEducationRes[index].id!,
                                          ),
                                        );
                                      },
                                      icon: const Icon(
                                        Icons.edit_outlined,
                                        size: 18,
                                      ),
                                    ),
                                    IconButton(
                                      onPressed: () async {
                                        await context
                                            .read<TaskerEducationCubit>()
                                            .deleteTaskerEducation(
                                              state.taskerEducationRes[index]
                                                  .id!,
                                            );
                                      },
                                      icon: const Icon(
                                        Icons.delete_outline_rounded,
                                        size: 18,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Text(
                              state.taskerEducationRes[index].degree ?? '',
                              style: kText15,
                            ),
                            Text(
                              '${DateFormat('yyyy-MM-dd').format(state.taskerEducationRes[index].startDate ?? DateTime.now())} - ${DateFormat('yyyy-MM-dd').format(state.taskerEducationRes[index].endDate ?? DateTime.now())}',
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
          return const SizedBox.shrink();
          // return Padding(
          //   padding: kPadding20,
          //   child: Column(
          //     crossAxisAlignment: CrossAxisAlignment.start,
          //     children: const [
          //       Text(
          //         'Education',
          //         style: kPurpleText19,
          //       ),
          //       kHeight10,
          //       Text('Garden Cleaner'),
          //       Text(
          //         'Cagtu. Full-time',
          //         style: kHelper13,
          //       ),
          //       Text(
          //         'I am excited about helping companies with their product development, management and strategy. I specialize in deep tech and hard analytical problems.',
          //       ),
          //       Text(
          //         'June 2002-Present',
          //         style: kHelper13,
          //       )
          //     ],
          //   ),
          // );
        }
      },
    );
  }
}
