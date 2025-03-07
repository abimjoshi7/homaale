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

  const EventSection({
    Key? key,
    required this.taskEntityService,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    context.read<EventBloc>().add(
          EventLoaded(
            id: taskEntityService.event?.id ?? "",
          ),
        );

    return Visibility(
      visible: taskEntityService.createdBy?.id ==
          context.read<UserBloc>().state.taskerProfile?.user?.id,
      child: CustomFormField(
        label: "Events",
        rightSection: Visibility(
          visible: taskEntityService.event?.id != null,
          child: InkWell(
            onTap: () {
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
        ),
        child: taskEntityService.event?.id == null
            ? EventAttachCard()
            : EventDetailCard(
                // taskEntityService: taskEntityService,
                ),
      ),
    );
  }
}
