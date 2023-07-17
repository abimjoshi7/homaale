// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dependencies/dependencies.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/core/mixins/the_modal_bottom_sheet.dart';
import 'package:cipher/features/bookings/data/models/book_entity_service_req.dart';
import 'package:cipher/features/bookings/presentation/bloc/book_event_handler_bloc.dart';
import 'package:cipher/features/event/presentation/bloc/event/event_bloc.dart';
import 'package:cipher/features/services/presentation/widgets/the_time_slot.dart';
import 'package:cipher/features/task_entity_service/presentation/bloc/task_entity_service_bloc.dart';
import 'package:cipher/widgets/widgets.dart';

class ScheduleView extends StatefulWidget {
  final BookEventHandlerBloc bookEventHandlerBloc;
  const ScheduleView({
    Key? key,
    required this.bookEventHandlerBloc,
  }) : super(key: key);

  @override
  State<ScheduleView> createState() => _ScheduleViewState();
}

class _ScheduleViewState extends State<ScheduleView> with TheModalBottomSheet {
  int? selectedIndex;
  bool isVisible = false;
  bool hasSlots = false;
  CalendarFormat? calendarFormat;
  DateTime focusedDate = DateTime.now();
  List<DateTime> dateList = [];
  DateTime? startTime;
  DateTime? endTime;

  @override
  void initState() {
    super.initState();
    startTime = DateTime.now();
    widget.bookEventHandlerBloc.add(
      BookEventPicked(
        req: BookEntityServiceReq(
          startDate: focusedDate,
          endDate: focusedDate,
          budgetTo: double.parse(context
              .read<TaskEntityServiceBloc>()
              .state
              .taskEntityService
              .payableTo!),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const CustomFormField(
            label: 'When do you need this done?',
            child: Padding(
              padding: EdgeInsets.symmetric(
                vertical: 8.0,
              ),
              child: Text(
                'Select task date from the calender to complete booking.',
                // style: kHelper13,
              ),
            ),
          ),
          BlocBuilder<EventBloc, EventState>(
            builder: (context, state) {
              if (state.isLoaded == true) {
                if (dateList.isEmpty) {
                  for (final element in state.event!.allShifts!) {
                    dateList.add(element.date!);
                  }
                }
              }
              for (final element in state.event?.allShifts ?? []) {
                if (element.slots?.length == 0) {
                  hasSlots = false;
                } else {
                  hasSlots = true;
                }
              }
              return Column(
                children: [
                  _buildCalender(context),
                  _buildTimeSlots(state, context),
                  _buildPriceSection(context),
                ],
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildPriceSection(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 8,
      ),
      child: CustomDottedContainerStack(
        theColor: kColorGrey.withOpacity(.3),
        theWidget: Text.rich(
          TextSpan(
            text: "Total Price :  ",
            children: [
              TextSpan(
                text: "Rs " +
                    double.parse(
                      context
                          .read<TaskEntityServiceBloc>()
                          .state
                          .taskEntityService
                          .payableTo!,
                    ).toInt().toString(),
                style: Theme.of(context).textTheme.displayLarge,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTimeSlots(EventState state, BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: 8,
      ),
      child: CustomFormField(
        label: "Select Shifts:",
        child: Wrap(
          runSpacing: 10,
          children: state.event?.id == null || hasSlots == false
              ? [
                  Row(
                    children: [
                      Flexible(
                        child: CustomFormContainer(
                          leadingWidget: Row(
                            children: [
                              Icon(
                                Icons.calendar_today,
                              ),
                              TextButton(
                                onPressed: () async {
                                  await showCustomBottomSheet(
                                    context: context,
                                    widget: SizedBox.fromSize(
                                      size: Size.fromHeight(250),
                                      child: CupertinoDatePicker(
                                        mode: CupertinoDatePickerMode.time,
                                        onDateTimeChanged: (value) => setState(
                                          () {
                                            startTime = value;
                                          },
                                        ),
                                      ),
                                    ),
                                  ).whenComplete(
                                    () => widget.bookEventHandlerBloc.add(
                                      BookEventPicked(
                                        req: BookEntityServiceReq(
                                          startTime: startTime != null
                                              ? DateFormat.Hms()
                                                  .format(startTime!)
                                              : null,
                                          endDate: DateTime.parse(
                                            widget.bookEventHandlerBloc.state
                                                .endDate!,
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                },
                                child: Text(
                                  startTime != null
                                      ? DateFormat.jm().format(startTime!)
                                      : '--',
                                  style: Theme.of(context).textTheme.bodyLarge,
                                ),
                              ),
                              Text(
                                '-',
                              ),
                              TextButton(
                                onPressed: () async {
                                  await showCustomBottomSheet(
                                    context: context,
                                    widget: SizedBox.fromSize(
                                      size: Size.fromHeight(250),
                                      child: CupertinoDatePicker(
                                        mode: CupertinoDatePickerMode.time,
                                        onDateTimeChanged: (value) => setState(
                                          () {
                                            endTime = value;
                                          },
                                        ),
                                      ),
                                    ),
                                  ).whenComplete(
                                    () => widget.bookEventHandlerBloc.add(
                                      BookEventPicked(
                                        req: BookEntityServiceReq(
                                          endTime: endTime != null
                                              ? DateFormat.Hms()
                                                  .format(endTime!)
                                              : null,
                                          endDate: DateTime.parse(
                                            widget.bookEventHandlerBloc.state
                                                .endDate!,
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                },
                                child: Text(
                                  endTime != null
                                      ? DateFormat.jm().format(endTime!)
                                      : '--',
                                  style: Theme.of(context).textTheme.bodyLarge,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  )
                ]
              : [
                  for (final element in state.event!.allShifts!)
                    element.date!.toDateOnly().isAtSameMomentAs(
                              focusedDate.toDateOnly(),
                            )
                        ? SizedBox(
                            height: 60,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: element.slots!.length,
                              itemBuilder: (context, index) {
                                widget.bookEventHandlerBloc.add(
                                  BookEventPicked(
                                    req: BookEntityServiceReq(
                                      endDate: focusedDate,
                                      startTime: element.slots?.first.start,
                                      endTime: element.slots?.first.end,
                                    ),
                                  ),
                                );
                                return Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: InkWell(
                                    onTap: () async {
                                      print(focusedDate);
                                      print(element.slots?.first.start);
                                      widget.bookEventHandlerBloc.add(
                                        BookEventPicked(
                                          req: BookEntityServiceReq(
                                            endDate: focusedDate,
                                            startTime:
                                                element.slots?[index].start,
                                            endTime: element.slots?[index].end,
                                          ),
                                        ),
                                      );
                                      setState(
                                        () {
                                          selectedIndex = index;
                                        },
                                      );
                                    },
                                    child: TheTimeSlot(
                                      index: index,
                                      selectedIndex: selectedIndex ?? 0,
                                      element: element,
                                    ),
                                  ),
                                );
                              },
                            ),
                          )
                        : SizedBox.shrink(),
                ],
        ),
      ),
    );
  }

  Widget _buildCalender(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 4,
      ),
      decoration: BoxDecoration(
        border: Border.all(
          width: 0.5,
          color: kColorGrey,
        ),
        borderRadius: BorderRadius.circular(
          5,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          TheCalender(
            calendarFormat: calendarFormat,
            onFormatChange: (p0) => setState(
              () {
                calendarFormat = p0;
              },
            ),
            dateList: dateList,
            focusedDate: focusedDate,
            onSelect: (selectedDay, focusedDay) {
              setState(
                () {
                  focusedDate = focusedDay;
                },
              );
              widget.bookEventHandlerBloc.add(
                BookEventPicked(
                  req: BookEntityServiceReq(
                    endDate: focusedDate,
                  ),
                ),
              );
            },
            onEvent: (day) {
              for (final element in dateList) {
                if (element.toDateOnly().isAtSameMomentAs(
                      day.toDateOnly(),
                    )) {
                  return [
                    const SizedBox.shrink(),
                  ];
                }
              }
              return [];
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Wrap(
              spacing: 20,
              children: [
                IconText(
                  label: 'Selected',
                  iconData: Icons.circle,
                  size: 13,
                  color: kColorAmber,
                ),
                IconText(
                  label: 'Available',
                  iconData: Icons.circle,
                  size: 13,
                  color: Colors.black,
                ),
                IconText(
                  label: 'Unavailable',
                  iconData: Icons.circle,
                  size: 13,
                  color: Colors.grey,
                ),
              ],
            ),
          ),
          addVerticalSpace(
            8,
          ),
        ],
      ),
    );
  }
}
