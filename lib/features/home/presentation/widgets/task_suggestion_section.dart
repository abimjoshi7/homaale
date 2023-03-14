import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/core/constants/enums.dart';
import 'package:cipher/features/task/presentation/bloc/task_bloc.dart';
import 'package:cipher/widgets/widgets.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';

class TasksSuggestionSection extends StatelessWidget {
  const TasksSuggestionSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: kPadding10,
      child: Column(
        children: [
          SectionHeading(
            labelName: 'Tasks you may like',
            onTap: () {
              // Navigator.pushNamed(
              //   context,
              //   ClientPostTaskViewPage.routeName,
              // );
            },
          ),
          BlocBuilder<TaskBloc, TaskState>(
            builder: (context, state) {
              if (state.theState == TheStates.success) {
                if (state.tasksList != null) {
                  return SizedBox(
                    height: MediaQuery.of(context).size.height * 0.22,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      padding: EdgeInsets.zero,
                      itemBuilder: (context, index) => InkWell(
                        onTap: () {},
                        child: TaskCard(
                          startRate:
                              '${state.tasksList?.result?[index].budgetFrom ?? 0}',
                          endRate:
                              '${state.tasksList?.result?[index].budgetTo ?? 0}',
                          count:
                              state.tasksList?.result?[index].count.toString(),
                          imageUrl: state.tasksList?.result?[index].createdBy
                                  ?.profileImage ??
                              kServiceImageNImg,
                          location: state.tasksList?.result?[index].location,
                          endHour: Jiffy(state
                                  .tasksList?.result?[index].createdAt
                                  .toString())
                              .jm,
                          endDate: Jiffy(state.tasksList?.result?[index].endDate
                                  .toString())
                              .yMMMMd,
                          taskName: state.tasksList?.result?[index].title,
                          callback: () {},
                        ),
                      ),
                      itemCount: state.tasksList?.result?.length ?? 0,
                    ),
                  );
                }
                return const Center(
                  child: Text('Please try again'),
                );
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
