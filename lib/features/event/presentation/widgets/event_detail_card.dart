import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';

import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/features/event/presentation/bloc/event/event_bloc.dart';
import 'package:cipher/features/task_entity_service/data/models/task_entity_service.dart';
import 'package:cipher/widgets/widgets.dart';

class EventDetailCard extends StatelessWidget {
  final TaskEntityService taskEntityService;
  const EventDetailCard({
    Key? key,
    required this.taskEntityService,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EventBloc, EventState>(
      builder: (context, state) {
        if (taskEntityService.event != null || state.event != null) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Wrap(
                direction: Axis.vertical,
                spacing: 4,
                children: [
                  IconText(
                    label: "${DateFormat.yMMMEd().format(
                      taskEntityService.event?.start ?? state.event?.start ?? DateTime.now(),
                    )} - ${DateFormat.yMMMEd().format(
                      taskEntityService.event?.end ?? state.event?.end ?? DateTime.now(),
                    )}",
                    iconData: Icons.calendar_today,
                  ),
                  IconText(
                    label: "${state.event?.guestLimit ?? 1} Guests",
                    iconData: Icons.people_alt_outlined,
                  ),
                  IconText(
                    label: state.event?.isFlexible == true ? "Is Flexible" : "Not Flexible",
                    iconData: Icons.verified_user_outlined,
                  ),
                ],
              ),
              addVerticalSpace(
                8,
              ),
              Divider()
            ],
          );
        }
        return Text("data");
      },
    );
  }
}
