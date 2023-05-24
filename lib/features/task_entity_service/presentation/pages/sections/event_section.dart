// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cipher/features/task_entity_service/data/models/task_entity_service_model.dart';
import 'package:cipher/features/user/presentation/bloc/user/user_bloc.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';

import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/features/event/presentation/bloc/event/event_bloc.dart';
import 'package:cipher/features/event/presentation/pages/event_details_page.dart';
import 'package:cipher/features/event/presentation/widgets/widgets.dart';
import 'package:cipher/widgets/widgets.dart';

class EventSection extends StatelessWidget {
  final TaskEntityService taskEntityService;
  final UserBloc user;
  const EventSection({
    Key? key,
    required this.taskEntityService,
    required this.user,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<EventBloc, EventState>(
      listener: (context, state) {
        // if (state.theStates == TheStates.success &&
        //     state.event?.id != null &&
        //     state.isCreated == false) {
        //   Navigator.pushNamed(
        //     context,
        //     EventDetailsPage.routeName,
        //   );
        // }
      },
      builder: (context, state) {
        return Visibility(
          visible: taskEntityService.createdBy?.id ==
              user.state.taskerProfile?.user?.id,
          child: CustomFormField(
            label: "Events",
            rightSection: InkWell(
              onTap: () {
                context.read<EventBloc>().add(
                      EventLoaded(
                        id: taskEntityService.event?.id ?? "",
                      ),
                    );
                Navigator.pushNamed(
                  context,
                  EventDetailsPage.routeName,
                );
              },
              child: Text(
                "View Details",
                style: kLightBlueText14,
              ),
            ),
            child: taskEntityService.event?.id == null
                ? EventAttachCard()
                : EventDetailCard(
                    taskEntityService: taskEntityService,
                  ),
          ),
        );
      },
    );
  }
}
