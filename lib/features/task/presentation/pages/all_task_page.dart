import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/core/constants/enums.dart';
import 'package:cipher/features/task/presentation/bloc/task_bloc.dart';
import 'package:cipher/features/task/presentation/pages/apply_task_page.dart';
import 'package:cipher/features/task/presentation/pages/single_task_page.dart';
import 'package:cipher/widgets/widgets.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';

class AllTaskPage extends StatefulWidget {
  static const routeName = '/all-task-page';
  const AllTaskPage({super.key});

  @override
  State<AllTaskPage> createState() => _AllTaskPageState();
}

class _AllTaskPageState extends State<AllTaskPage> {
  void onTaskPressed({
    required TaskState state,
    required int index,
    required bool isApply,
  }) {
    context.read<TaskBloc>().add(
          SingleEntityTaskLoadInitiated(
            id: state.tasksList!.result![index].id!,
          ),
        );
    isApply
        ? Navigator.pushNamed(context, ApplyTaskPage.routeName)
        : Navigator.pushNamed(context, SingleTaskPage.routeName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<TaskBloc, TaskState>(
        builder: (context, state) {
          if (state.theState == TheStates.success) {
            final data = state.tasksList?.result;
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
                  child: Padding(
                    padding: kPadding15,
                    child: ListView.separated(
                      itemCount: data?.length ?? 0,
                      separatorBuilder: (context, index) => addVerticalSpace(8),
                      padding: EdgeInsets.zero,
                      itemBuilder: (context, index) => InkWell(
                        onTap: () => onTaskPressed(
                          state: state,
                          index: index,
                          isApply: false,
                        ),
                        child: TaskCard(
                          startRate:
                              '${state.tasksList?.result?[index].budgetFrom ?? 0}',
                          endRate:
                              '${state.tasksList?.result?[index].budgetTo ?? 0}',
                          budgetType:
                              '${state.tasksList?.result?[index].budgetType}',
                          count:
                              state.tasksList?.result?[index].count.toString(),
                          imageUrl: state.tasksList?.result?[index].createdBy
                                  ?.profileImage ??
                              kServiceImageNImg,
                          location: state.tasksList?.result?[index].location,
                          endHour: Jiffy(
                            state.tasksList?.result?[index].createdAt
                                .toString(),
                          ).jm,
                          endDate: Jiffy(
                            state.tasksList?.result?[index].endDate.toString(),
                          ).yMMMMd,
                          taskName: state.tasksList?.result?[index].title,
                          callback: () => onTaskPressed(
                            state: state,
                            index: index,
                            isApply: true,
                          ),
                        ),
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
