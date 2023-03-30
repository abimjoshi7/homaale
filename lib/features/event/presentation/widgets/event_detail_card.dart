import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/features/event/presentation/bloc/event/event_bloc.dart';
import 'package:cipher/features/task_entity_service/presentation/bloc/task_entity_service_bloc.dart';
import 'package:cipher/widgets/widgets.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';

class EventDetailCard extends StatefulWidget {
  const EventDetailCard({
    super.key,
    required this.taskEntityServiceState,
  });

  final TaskEntityServiceState taskEntityServiceState;

  @override
  State<EventDetailCard> createState() => _EventDetailCardState();
}

class _EventDetailCardState extends State<EventDetailCard> {
  @override
  void initState() {
    super.initState();
    context.read<EventBloc>().add(
          EventLoaded(
            id: widget.taskEntityServiceState.taskEntityService?.id ?? "",
          ),
        );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EventBloc, EventState>(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Wrap(
              direction: Axis.vertical,
              spacing: 4,
              children: [
                IconText(
                  label: "${DateFormat.yMMMEd().format(
                    state.event?.start ?? DateTime.now(),
                  )} - ${DateFormat.yMMMEd().format(
                    state.event?.end ?? DateTime.now(),
                  )}",
                  iconData: Icons.calendar_today,
                ),
                IconText(
                  label: "${state.event?.guestLimit ?? 0} Guests",
                  iconData: Icons.people_alt_outlined,
                ),
                IconText(
                  label: state.event?.isFlexible == true
                      ? "Is Flexible"
                      : "Not Flexible",
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
      },
    );
  }
}
