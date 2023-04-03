import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/features/event/presentation/bloc/event/event_bloc.dart';
import 'package:cipher/features/event/presentation/widgets/widgets.dart';
import 'package:cipher/widgets/widgets.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';

class EventDetailCard extends StatelessWidget {
  const EventDetailCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EventBloc, EventState>(
      builder: (context, state) {
        if (state.theStates == TheStates.success) {
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
        }
        return SizedBox.shrink();
      },
    );
  }
}
