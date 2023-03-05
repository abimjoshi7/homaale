import 'package:cipher/core/constants/dimensions.dart';
import 'package:cipher/core/constants/strings.dart';
import 'package:cipher/features/services/data/models/entity_service.dart';
import 'package:cipher/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:jiffy/jiffy.dart';

class TaskerTask extends StatefulWidget {
  const TaskerTask({super.key, required this.tasks});

  final EntityServiceModel tasks;

  @override
  State<TaskerTask> createState() => _TaskerTaskState();
}

class _TaskerTaskState extends State<TaskerTask> {
  List<EntityService> taskList = [];

  @override
  void initState() {
    taskList = widget.tasks.result!;
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
        itemCount: taskList.length,
        itemBuilder: (context, index) {
          return TaskCard(
            taskName: taskList[index].title,
            startRate: taskList[index].budgetFrom?.toString() ?? '0',
            endRate: taskList[index].budgetTo?.toString() ?? '0',
            imageUrl:
                taskList[index].createdBy?.profileImage ?? kServiceImageNImg,
            location: taskList[index].location,
            endHour: Jiffy(taskList[index].createdAt.toString()).jm,
            endDate: Jiffy(taskList[index].endDate.toString()).yMMMMd,
            callback: () {},
          );
        },
      ),
    );
  }
}
