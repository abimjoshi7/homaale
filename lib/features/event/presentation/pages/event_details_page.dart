import 'package:cipher/features/task_entity_service/presentation/bloc/task_entity_service_bloc.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';

import 'package:cipher/core/app/root.dart';
import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/core/mixins/mixins.dart';
import 'package:cipher/features/event/presentation/bloc/event/event_bloc.dart';
import 'package:cipher/features/event/presentation/widgets/widgets.dart';
import 'package:cipher/widgets/widgets.dart';

class EventDetailsPage extends StatelessWidget with TheModalBottomSheet {
  static const routeName = "/event-details-page";
  const EventDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        appBarTitle: "Event Detail",
        leadingWidget: Padding(
          padding: const EdgeInsets.all(8.0),
          child: GestureDetector(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: Icon(
              Icons.arrow_back,
              color: Theme.of(context).appBarTheme.iconTheme?.color,
            ),
          ),
        ),
        trailingWidget: SizedBox.shrink(),
      ),
      body: BlocConsumer<EventBloc, EventState>(
        listenWhen: (previous, current) {
          if (previous.isScheduleDeleted == true &&
              current.isScheduleDeleted == true) return false;
          if (previous.isScheduleDeleted == false &&
              current.isScheduleDeleted == false) return false;
          return true;
        },
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
          if (state.isScheduleDeleted == true) {
            showDialog(
              context: context,
              builder: (context) => CustomToast(
                heading: "Success",
                content: "Schedule deleted successfully",
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
          if (state.isScheduleDeleted == false) {
            showDialog(
              context: context,
              builder: (context) => CustomToast(
                heading: "Success",
                content: "Schedule cannot be deleted.",
                onTap: () {},
                isSuccess: false,
              ),
            );
          }
        },
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.all(
              16,
            ),
            child: Column(
              children: [
                _buildEvent(context, state),
                _buildSchedule(context, state),
              ],
            ),
          );
        },
      ),
    );
  }

  CustomFormField _buildSchedule(BuildContext context, EventState state) {
    return CustomFormField(
      label: "Schedule",
      rightSection: InkWell(
        onTap: () {
          showCustomBottomSheet(
            context: context,
            widget: ScheduleForm(
              attachType: AttachType.Create,
            ),
          );
        },
        child: Text(
          "New",
          style: kLightBlueText14,
        ),
      ),
      child: SizedBox(
        height: 500,
        child: ListView.builder(
          padding: EdgeInsets.zero,
          itemCount: state.event?.schedules?.length ?? 0,
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
              height: 90,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Icon(
                    Icons.calendar_today_outlined,
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            state.event?.schedules?[index].title ?? "",
                            style: kPurpleText16,
                          ),
                          Flexible(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // InkWell(
                                //   onTap: () {
                                //     print(123);
                                //     print(state.event);
                                //   },
                                //   child: Text(
                                //     "asd",
                                //     // "${state.event?.allShifts?.first.slots?[index].start} - ${state.event?.allShifts?.first.slots?[index].end}",
                                //     // "${state.event?.allShifts?.first.slots?[index].start?.substring(0, 5) ?? ""} - ${state.event?.allShifts?.first.slots?[index].end?.substring(0, 5) ?? ""}",
                                //     style: kHelper13,
                                //   ),
                                // ),
                                Text.rich(
                                  TextSpan(
                                    text: "Start: ",
                                    style: TextStyle(
                                      color: Colors.green,
                                    ),
                                    children: [
                                      TextSpan(
                                        text: DateFormat.yMMMMd().format(
                                          state.event!.start!,
                                        ),
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodySmall,
                                      ),
                                    ],
                                  ),
                                ),
                                Text.rich(
                                  TextSpan(
                                    text: "End:   ",
                                    style: TextStyle(
                                      color: Colors.red,
                                    ),
                                    children: [
                                      TextSpan(
                                        text: DateFormat.yMMMMd().format(
                                          state.event!.end!,
                                        ),
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodySmall,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Flexible(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {
                            showCustomBottomSheet(
                              context: context,
                              widget: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ListTile(
                                    onTap: () {
                                      Navigator.pop(context);
                                      showCustomBottomSheet(
                                        context: context,
                                        widget: ScheduleForm(
                                          attachType: AttachType.Edit,
                                        ),
                                      );
                                    },
                                    leading: Icon(
                                      Icons.update_outlined,
                                    ),
                                    title: Text("Edit"),
                                  ),
                                  // Divider(),
                                  // ListTile(
                                  //   onTap: () {},
                                  //   leading: Icon(
                                  //     Icons.filter_none_rounded,
                                  //   ),
                                  //   title: Text("Duplicate"),
                                  // ),
                                  Divider(),
                                  ListTile(
                                    onTap: () {
                                      context.read<EventBloc>().add(
                                            ScheduleDeleted(
                                              id: state.event?.schedules?[index]
                                                      .id ??
                                                  "",
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
                          child: Icon(
                            Icons.more_vert_outlined,
                          ),
                        ),
                        SizedBox(
                          height: 30,
                          width: 30,
                          child: BlocBuilder<EventBloc, EventState>(
                            builder: (context, state) {
                              return Switch(
                                value: state.event?.isActive ?? false,
                                onChanged: (value) {
                                  context.read<EventBloc>().add(
                                        EventEdited(
                                          id: state.event?.id ?? "",
                                          data: {
                                            "is_active":
                                                !state.event!.isActive!,
                                          },
                                        ),
                                      );

                                  print(state.event);
                                  print(state.event?.allShifts?.length);
                                },
                              );
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
    );
  }

  CustomFormField _buildEvent(BuildContext context, EventState state) {
    return CustomFormField(
      label: "Event",
      rightSection: InkWell(
        onTap: () {
          showCustomBottomSheet(
            context: context,
            widget: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListTile(
                  onTap: () {
                    Navigator.pop(context);
                    showCustomBottomSheet(
                      context: context,
                      widget: EventForm(
                        type: AttachType.Edit,
                      ),
                    );
                  },
                  leading: Icon(
                    Icons.update_outlined,
                  ),
                  title: Text("Edit"),
                ),
                Divider(),
                // ListTile(
                //   onTap: () {},
                //   leading: Icon(
                //     Icons.filter_none_rounded,
                //   ),
                //   title: Text("Duplicate"),
                // ),
                // Divider(),
                ListTile(
                  onTap: () async {
                    context.read<EventBloc>().add(
                          EventDeleted(
                            id: state.event?.id ?? "",
                          ),
                        );
                    context.read<TaskEntityServiceBloc>().add(
                          TaskEntityServiceSingleLoaded(
                            id: state.entityServiceId ?? '',
                          ),
                        );
                    await Navigator.pushNamedAndRemoveUntil(
                      context,
                      Root.routeName,
                      (route) => false,
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
          // taskEntityService: TaskEntityService(),
          ),
    );
  }
}
