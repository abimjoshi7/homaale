import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/features/task/data/repositories/task_repositories.dart';
import 'package:cipher/features/task/presentation/bloc/task_bloc.dart';
import 'package:cipher/features/task/presentation/pages/all_task_page.dart';
import 'package:cipher/features/task/presentation/pages/client_post_task_view.dart';
import 'package:cipher/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TasksSuggestionSection extends StatelessWidget {
  const TasksSuggestionSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: kPadding10,
      child: Column(
        children: [
          BlocListener<TaskBloc, TaskState>(
            listener: (context, state) async {
              if (state is AllTaskListLoadSuccess) {
                Navigator.pushNamed(
                  context,
                  AllTaskPage.routeName,
                );
              }
            },
            child: SectionHeading(
              labelName: 'Tasks you may like',
              onTap: () async {
                context.read<TaskBloc>().add(
                      AllTaskListLoadInitiated(),
                    );
              },
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.22,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.zero,
              itemBuilder: (context, index) => InkWell(
                onTap: () {
                  // Navigator.pushNamed(
                  //   context,
                  //   ClientPostTaskViewPage.routeName,
                  // );
                },
                child: TaskCard(
                  callback: () {},
                ),
              ),
              itemCount: 2,
            ),
          ),
        ],
      ),
    );
  }
}
