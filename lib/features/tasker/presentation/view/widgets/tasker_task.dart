import 'package:cipher/core/constants/dimensions.dart';
import 'package:cipher/core/constants/strings.dart';
import 'package:cipher/features/services/data/models/entity_service.dart';
import 'package:cipher/features/task/presentation/bloc/task_bloc.dart';
import 'package:cipher/features/task/presentation/pages/apply_task_page.dart';
import 'package:cipher/widgets/widgets.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';

class TaskerTask extends StatefulWidget {
  const TaskerTask({
    super.key,
    this.tasks,
  });

  final EntityServiceModel? tasks;

  @override
  State<TaskerTask> createState() => _TaskerTaskState();
}

class _TaskerTaskState extends State<TaskerTask> {
  List<EntityService>? taskList = [];

  @override
  void initState() {
    taskList = widget.tasks?.result;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: ListView.separated(
        shrinkWrap: true,
        primary: false,
        padding: EdgeInsets.zero,
        separatorBuilder: (context, index) => addVerticalSpace(16),
        itemCount: taskList?.length ?? 0,
        itemBuilder: (context, index) {
          return TaskCard(
            taskName: taskList![index].title ?? 'taskName',
            startRate: taskList![index].budgetFrom?.toString() ?? '0',
            endRate: taskList![index].budgetTo?.toString() ?? '0',
            imageUrl:
                taskList![index].createdBy?.profileImage ?? kServiceImageNImg,
            location: taskList![index].location,
            endHour: Jiffy(taskList![index].createdAt.toString()).jm,
            endDate: Jiffy(taskList![index].endDate.toString()).yMMMMd,
            count: taskList![index].count.toString(),
            callback: () {
              context.read<TaskBloc>().add(
                    SingleEntityTaskLoadInitiated(
                      id: taskList![index].id!,
                    ),
                  );
              Navigator.pushNamed(
                context,
                ApplyTaskPage.routeName,
              );
            },
          );
        },
      ),
    );
  }
}
