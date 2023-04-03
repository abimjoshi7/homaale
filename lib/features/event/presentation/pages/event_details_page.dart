import 'package:cipher/core/app/root.dart';
import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/core/mixins/mixins.dart';
import 'package:cipher/features/event/presentation/bloc/event/event_bloc.dart';
import 'package:cipher/features/event/presentation/widgets/event_detail_card.dart';
import 'package:cipher/features/task_entity_service/data/models/task_entity_service.dart';
import 'package:cipher/widgets/widgets.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';

class EventDetailsPage extends StatelessWidget with TheModalBottomSheet {
  static const routeName = "/event-details-page";
  const EventDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<EventBloc, EventState>(
        listener: (context, state) {
          if (state.isDeleted == true) {
            showDialog(
              context: context,
              builder: (context) => CustomToast(
                heading: "Success",
                content: "Event deleted successfully",
                onTap: () {
                  Navigator.pushNamedAndRemoveUntil(
                    context,
                    Root.routeName,
                    (route) => false,
                  );
                },
                isSuccess: true,
              ),
            );
          }
          if (state.theStates == TheStates.failure &&
              state.isDeleted == false) {
            showDialog(
              context: context,
              builder: (context) => CustomToast(
                heading: "Failure",
                content: "Event cannot be deleted",
                onTap: () {},
                isSuccess: false,
              ),
            );
          }
        },
        builder: (context, state) {
          return Column(
            children: [
              addVerticalSpace(
                50,
              ),
              CustomHeader(
                label: "Event Detail",
              ),
              Padding(
                padding: const EdgeInsets.all(
                  16,
                ),
                child: Column(
                  children: [
                    CustomFormField(
                      label: "Event",
                      rightSection: InkWell(
                        onTap: () {
                          showCustomBottomSheet(
                            context: context,
                            widget: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ListTile(
                                  onTap: () {},
                                  leading: Icon(
                                    Icons.update_outlined,
                                  ),
                                  title: Text("Update"),
                                ),
                                Divider(),
                                ListTile(
                                  onTap: () {},
                                  leading: Icon(
                                    Icons.filter_none_rounded,
                                  ),
                                  title: Text("Duplicate"),
                                ),
                                Divider(),
                                ListTile(
                                  onTap: () async {
                                    context.read<EventBloc>().add(
                                          EventDeleted(
                                            id: state.event?.id ?? "",
                                          ),
                                        );
                                  },
                                  leading: Icon(
                                    Icons.delete_outline_rounded,
                                  ),
                                  title: Text("Remove"),
                                ),
                              ],
                            ),
                          );
                        },
                        child: Text(
                          "Edit",
                          style: kLightBlueText14,
                        ),
                      ),
                      child: EventDetailCard(
                        taskEntityService: TaskEntityService(),
                      ),
                    ),
                    CustomFormField(
                      label: "Schedule",
                      rightSection: InkWell(
                        onTap: () {},
                        child: Text(
                          "New",
                          style: kLightBlueText14,
                        ),
                      ),
                      child: SizedBox(
                        height: 500,
                        child: ListView.builder(
                          padding: EdgeInsets.zero,
                          itemCount: state.event?.schedules?.length,
                          itemBuilder: (context, index) => Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: kColorGrey,
                                ),
                                borderRadius: BorderRadius.circular(
                                  8,
                                ),
                              ),
                              height: 80,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Icon(
                                    Icons.calendar_today_outlined,
                                  ),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          'data',
                                          style: kPurpleText16,
                                        ),
                                        Text(
                                          'data',
                                          style: kHelper13,
                                        ),
                                      ],
                                    ),
                                  ),
                                  Flexible(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        GestureDetector(
                                          onTap: () {
                                            showCustomBottomSheet(
                                              context: context,
                                              widget: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  ListTile(
                                                    onTap: () {},
                                                    leading: Icon(
                                                      Icons.update_outlined,
                                                    ),
                                                    title: Text("Update"),
                                                  ),
                                                  Divider(),
                                                  ListTile(
                                                    onTap: () {},
                                                    leading: Icon(
                                                      Icons.filter_none_rounded,
                                                    ),
                                                    title: Text("Duplicate"),
                                                  ),
                                                  Divider(),
                                                  ListTile(
                                                    onTap: () {},
                                                    leading: Icon(
                                                      Icons
                                                          .delete_outline_rounded,
                                                    ),
                                                    title: Text("Remove"),
                                                  ),
                                                ],
                                              ),
                                            );
                                          },
                                          child: Icon(
                                            Icons.more_vert_outlined,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 30,
                                          width: 30,
                                          child: Switch(
                                            value: false,
                                            onChanged: (value) {
                                              print(state.event);
                                              print(state
                                                  .event?.allShifts?.length);
                                            },
                                          ),
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
