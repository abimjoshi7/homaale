import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/features/task_entity_service/data/models/task_entity_service.dart';
import 'package:cipher/features/task_entity_service/presentation/bloc/task_entity_service_bloc.dart';
import 'package:cipher/features/task_entity_service/presentation/pages/task_entity_service_page.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TaskEntityServiceSearchTile extends StatelessWidget {
  final TaskEntityService taskEntityService;

  const TaskEntityServiceSearchTile(
      {super.key, required this.taskEntityService});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        context.read<TaskEntityServiceBloc>().add(
              TaskEntityServiceSingleLoaded(
                id: taskEntityService.id ?? '',
              ),
            );

        Navigator.pushNamed(
          context,
          TaskEntityServicePage.routeName,
        );
      },
      contentPadding: EdgeInsets.symmetric(horizontal: 5.0),
      minLeadingWidth: MediaQuery.of(context).size.width,
      leading: Wrap(
        direction: Axis.horizontal,
        crossAxisAlignment: WrapCrossAlignment.center,
        children: <Widget>[
          Icon(
            CupertinoIcons.search,
            // color: kColorDarkGrey,
            size: 24,
          ),
          addHorizontalSpace(10.0),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                taskEntityService.title.toString(),
                style: Theme.of(context).textTheme.bodySmall,

                // style: kText14.copyWith(
                //   fontWeight: FontWeight.w400,
                // ),
              ),
              Text(
                "${taskEntityService.createdBy!.fullName}",
                style: kLightBlueText12.copyWith(
                  fontWeight: FontWeight.w400,
                ),
              ),
              Container(
                alignment: Alignment.center,
                width: 50.0,
                height: 15.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40.0),
                  color: Colors.lightBlueAccent.withOpacity(0.9),
                  shape: BoxShape.rectangle,
                ),
                child: Text(
                  'Service',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 10.0,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
      trailing: Icon(
        CupertinoIcons.arrow_up_left,
        size: 24,
        // color: kColorDarkGrey,
      ),
    );
  }
}
