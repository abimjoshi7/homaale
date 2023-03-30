import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/features/event/presentation/bloc/event/event_bloc.dart';
import 'package:cipher/features/event/presentation/pages/event_details_page.dart';
import 'package:cipher/features/event/presentation/widgets/widgets.dart';
import 'package:cipher/features/task_entity_service/presentation/bloc/task_entity_service_bloc.dart';
import 'package:cipher/features/user/presentation/bloc/user_bloc.dart';
import 'package:cipher/widgets/widgets.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';

class EventSection extends StatelessWidget {
  final TaskEntityServiceState taskEntityServiceState;
  final UserState userState;
  const EventSection({
    super.key,
    required this.taskEntityServiceState,
    required this.userState,
  });

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: taskEntityServiceState.taskEntityService?.createdBy?.id ==
          userState.taskerProfile?.user?.id,
      child: CustomFormField(
        label: "Events",
        rightSection: BlocListener<EventBloc, EventState>(
          listener: (context, state) {
            if (state.theStates == TheStates.success && state.event != null) {
              Navigator.pushNamed(
                context,
                EventDetailsPage.routeName,
              );
            }
          },
          child: InkWell(
            onTap: () {
              context.read<EventBloc>().add(
                    EventLoaded(
                        id: taskEntityServiceState
                                .taskEntityService?.event?.id ??
                            ""),
                  );
            },
            child: Text(
              "View Details",
              style: kLightBlueText14,
            ),
          ),
        ),
        child: taskEntityServiceState.taskEntityService?.event == null
            ? EventAttachCard()
            : EventDetailCard(taskEntityServiceState: taskEntityServiceState),
      ),
    );
  }
}
