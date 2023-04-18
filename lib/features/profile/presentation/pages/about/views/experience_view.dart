import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/features/documents/presentation/cubit/cubits.dart';
import 'package:cipher/features/documents/presentation/pages/edit/edit_experience.dart';
import 'package:cipher/features/documents/presentation/pages/pages.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';

class ExperienceView extends StatelessWidget {
  const ExperienceView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TaskerExperienceCubit, TaskerExperienceState>(
      builder: (context, state) {
        if (state is TaskerGetExperienceSuccess) {
          return Card(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                       Text(
                        'Experience',
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                      IconButton(
                        onPressed: () {
                          Navigator.pushNamed(
                            context,
                            AddExperience.routeName,
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
                      state.taskerExperienceRes.length,
                      (index) => Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  state.taskerExperienceRes[index].title ?? '',
                                  // state.taskerExperienceRes.result![index]!.title!,
                                  style: kText17,
                                ),
                                Row(
                                  children: [
                                    IconButton(
                                      onPressed: () {
                                        showModalBottomSheet(
                                          constraints: const BoxConstraints(
                                            maxHeight: 800,
                                          ),
                                          isScrollControlled: true,
                                          context: context,
                                          builder: (context) => EditExperience(
                                            id: state
                                                .taskerExperienceRes[index].id!,
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
                                            .read<TaskerExperienceCubit>()
                                            .deleteTaskerExperience(
                                              state.taskerExperienceRes[index]
                                                  .id!,
                                            );
                                      },
                                      icon: const Icon(
                                        Icons.delete_outline_outlined,
                                        size: 18,
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                            Text(
                              '${state.taskerExperienceRes[index].companyName ?? ''}. ${state.taskerExperienceRes[index].employmentType}',
                              style: kHelper13,
                            ),
                            Text(
                              state.taskerExperienceRes[index].description ??
                                  '',
                              style: kText15,
                            ),
                            Text(
                              // '${state.taskerExperienceRes.result?[index]?.startDate.toString().substring(0, 10)} - ${state.taskerExperienceRes.result?[index]?.endDate.toString().substring(0, 10)}',
                              '${DateFormat('yyyy-MM-dd').format(
                                state.taskerExperienceRes[index].startDate ??
                                    DateTime(
                                      2000,
                                    ),
                              )} - ${DateFormat('yyyy-MM-dd').format(
                                state.taskerExperienceRes[index].endDate ??
                                    DateTime(
                                      2000,
                                    ),
                              )}',
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
          //   padding: const EdgeInsets.all(20),
          //   child: Column(
          //     crossAxisAlignment: CrossAxisAlignment.start,
          //     children: const [
          //       Text(
          //         'Experience',
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
