import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/features/search/presentation/widgets/search_card.dart';
import 'package:cipher/features/task/presentation/bloc/task_bloc.dart';
import 'package:cipher/features/task/presentation/pages/all_task_page.dart';
import 'package:cipher/features/task/presentation/pages/single_task_page.dart';
import 'package:cipher/widgets/widgets.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';

import '../../../data/models/search_res.dart';

class TasksSection extends StatelessWidget {
  const TasksSection({
    super.key,
    required this.tasks,
  });

  final List<ServiceElement>? tasks;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        height: 200,
        width: double.maxFinite,
        child: CustomFormField(
          label: "Tasks",
          rightSection: TextButton(
            onPressed: () {
              Navigator.popAndPushNamed(
                context,
                AllTaskPage.routeName,
              );
            },
            child: Text(
              "See all >",
            ),
          ),
          child: Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: tasks?.length,
              itemBuilder: (context, index) => SizedBox(
                width: 300,
                child: InkWell(
                  onTap: () {
                    context.read<TaskBloc>().add(
                          SingleEntityTaskLoadInitiated(
                            id: tasks?[index].id ?? "",
                          ),
                        );
                    Future.delayed(
                      Duration(milliseconds: 500),
                      () => Navigator.popAndPushNamed(
                        context,
                        SingleTaskPage.routeName,
                      ),
                    );
                  },
                  child: SearchCard(
                    title: tasks?[index].title?.toTitleCase(),
                    name: tasks?[index].createdBy?.fullName,
                    location: tasks?[index].location?.isEmpty ?? false
                        ? "Remote"
                        : tasks?[index].location?.toCapitalized(),
                    theChild: Row(
                      children: [
                        Text(
                          "Rs ${tasks?[index].budgetFrom?.split('.')[0]} - Rs ${tasks?[index].budgetTo?.split('.')[0]}",
                          style: Theme.of(context).textTheme.headlineLarge,
                        ),
                        Text(
                          "/per project",
                          style: Theme.of(context).textTheme.displaySmall,
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
