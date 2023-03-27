import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/core/mixins/the_modal_bottom_sheet.dart';
import 'package:cipher/features/event/presentation/widgets/event_form.dart';
import 'package:cipher/features/task_entity_service/presentation/bloc/task_entity_service_bloc.dart';
import 'package:cipher/features/user/presentation/bloc/user_bloc.dart';
import 'package:cipher/widgets/widgets.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';

class EventSection extends StatelessWidget with TheModalBottomSheet {
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
        rightSection: InkWell(
          onTap: () {},
          child: Text(
            "View Details",
            style: kLightBlueText14,
          ),
        ),
        child: taskEntityServiceState.taskEntityService?.event == null
            ? Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 20,
                ),
                height: MediaQuery.of(context).size.height * 0.1,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: kColorGrey.withOpacity(
                    0.3,
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.edit_calendar_outlined,
                          color: kColorSilver,
                        ),
                        addHorizontalSpace(10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AutoSizeText(
                              taskEntityServiceState
                                      .taskEntityService?.event?.title ??
                                  "No event created yet",
                              style: kText15,
                            ),
                            AutoSizeText(
                              "Let's create your first event",
                            ),
                          ],
                        )
                      ],
                    ),
                    TextButton.icon(
                      onPressed: () {
                        showCustomBottomSheet(
                          context: context,
                          widget: EventForm(),
                        );
                      },
                      icon: Icon(Icons.add),
                      label: AutoSizeText("Attach an event"),
                    )
                  ],
                ),
              )
            : Wrap(
                direction: Axis.vertical,
                spacing: 4,
                children: [
                  IconText(
                    label: "${DateFormat.yMMMEd().format(
                      taskEntityServiceState.taskEntityService?.startDate ??
                          DateTime.now(),
                    )} - ${DateFormat.yMMMEd().format(
                      taskEntityServiceState.taskEntityService?.endDate ??
                          DateTime.now(),
                    )}",
                    iconData: Icons.calendar_today,
                  ),
                  IconText(
                    // label: taskEntityServiceState.taskEntityService.event,
                    label: "0 Guest",
                    iconData: Icons.people_alt_outlined,
                  ),
                  IconText(
                    label: taskEntityServiceState
                                .taskEntityService?.event?.isFlexible ==
                            true
                        ? "Is Flexible"
                        : "Not Flexible",
                    iconData: Icons.verified_user_outlined,
                  ),
                ],
              ),
      ),
    );
  }
}
