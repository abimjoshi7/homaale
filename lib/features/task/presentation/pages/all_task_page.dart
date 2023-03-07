import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/features/task/presentation/bloc/task_bloc.dart';
import 'package:cipher/features/task/presentation/pages/posted_task_view_page.dart';
import 'package:cipher/widgets/widgets.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';

class AllTaskPage extends StatelessWidget {
  static const routeName = '/all-task-page';
  const AllTaskPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<TaskBloc, TaskState>(
        builder: (context, state) {
          if (state is AllTaskListLoadSuccess) {
            final data = state.res.result;
            return Column(
              children: [
                addVerticalSpace(50),
                const CustomHeader(
                  label: 'All Task Page',
                ),
                SizedBox(
                  height: 35,
                  width: double.infinity,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                    ),
                    children: [
                      const Icon(
                        Icons.filter_alt_outlined,
                        color: kColorSilver,
                      ),
                      addHorizontalSpace(5),
                      ChoiceChip(
                        label: Row(
                          children: const [
                            Text(
                              'Category',
                            ),
                            Icon(Icons.keyboard_arrow_down_outlined)
                          ],
                        ),
                        backgroundColor: Colors.white,
                        side: const BorderSide(color: kColorGrey),
                        selected: false,
                        disabledColor: Colors.white,
                      ),
                      addHorizontalSpace(5),
                      ChoiceChip(
                        label: Row(
                          children: const [
                            Text(
                              'Buddhanagar',
                            ),
                            Icon(Icons.keyboard_arrow_down_outlined)
                          ],
                        ),
                        backgroundColor: Colors.white,
                        side: const BorderSide(color: kColorGrey),
                        selected: false,
                        disabledColor: Colors.white,
                      ),
                      addHorizontalSpace(5),
                      ChoiceChip(
                        label: Row(
                          children: const [
                            Text(
                              'Any Price',
                            ),
                            Icon(Icons.keyboard_arrow_down_outlined)
                          ],
                        ),
                        backgroundColor: Colors.white,
                        side: const BorderSide(color: kColorGrey),
                        selected: false,
                        disabledColor: Colors.white,
                      ),
                      addHorizontalSpace(5),
                    ],
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: data?.length,
                    padding: EdgeInsets.zero,
                    itemBuilder: (context, index) => Padding(
                      padding: kPadding10,
                      child: TaskCard(
                        taskName: data?[index].title,
                        imageUrl: data?[index].assigner?.profileImage,
                        startRate: data?[index].entityService?.budgetFrom ==
                                null
                            ? '0'
                            : data?[index].entityService?.budgetFrom.toString(),
                        endRate:
                            data?[index].entityService?.budgetTo.toString(),
                        endHour: data?[index].endTime,
                        endDate: DateFormat.yMMMMEEEEd().format(
                          data?[index].endDate ?? DateTime.now(),
                        ),
                        callback: () {
                          Navigator.pushNamed(
                            context,
                            PostedTaskViewPage.routeName,
                          );
                        },
                      ),
                    ),
                  ),
                ),
              ],
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
