import 'package:cipher/features/bookings/data/models/book_entity_service_req.dart';
import 'package:cipher/features/bookings/presentation/bloc/book_event_handler_bloc.dart';
import 'package:cipher/features/event/presentation/bloc/event/event_bloc.dart';
import 'package:cipher/features/task_entity_service/presentation/bloc/task_entity_service_bloc.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';

import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/features/services/presentation/widgets/the_time_slot.dart';
import 'package:cipher/widgets/widgets.dart';

class ScheduleView extends StatefulWidget {
  const ScheduleView({
    super.key,
  });

  @override
  State<ScheduleView> createState() => _ScheduleViewState();
}

class _ScheduleViewState extends State<ScheduleView> {
  int? selectedIndex;
  bool isVisible = false;
  bool hasSlots = false;
  CalendarFormat? calendarFormat;
  DateTime focusedDate = DateTime.now();
  List<DateTime> dateList = [];
  TimeOfDay? startTime;
  TimeOfDay? endTime;

  @override
  void initState() {
    super.initState();
    context.read<BookEventHandlerBloc>().add(
          BookEventPicked(
            req: BookEntityServiceReq(
              startDate: focusedDate,
              endDate: focusedDate,
              budgetTo: double.parse(context
                  .read<TaskEntityServiceBloc>()
                  .state
                  .taskEntityService!
                  .payableTo!),
            ),
          ),
        );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CustomFormField(
          label: 'When do you need this done?',
          child: Text(
            'Select task date from the calender to complete booking.',
            // style: kHelper13,
          ),
        ),
        BlocBuilder<EventBloc, EventState>(
          builder: (context, state) {
            if (state.theStates == TheStates.initial) {
              return const Center(
                child: CardLoading(
                  height: 200,
                ),
              );
            }
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
              ],
            );
          },
        ),
      ],
    );
  }

  Widget _buildTimeSlots(EventState state, BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: 8,
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
                                onPressed: () {
                                  showTimePicker(
                                          context: context,
                                          initialTime: TimeOfDay.now())
                                      .then(
                                    (value) {
                                      setState(
                                        () {
                                          startTime = value;
                                        },
                                      );
                                    },
                                  ).whenComplete(
                                    () => context
                                        .read<BookEventHandlerBloc>()
                                        .add(
                                          BookEventPicked(
                                            req: BookEntityServiceReq(
                                              startTime:
                                                  startTime?.format(context),
                                              endDate: DateTime.parse(
                                                context
                                                    .read<
                                                        BookEventHandlerBloc>()
                                                    .state
                                                    .endDate!,
                                              ),
                                            ),
                                          ),
                                        ),
                                  );
                                },
                                child: Text(
                                  startTime?.format(context) ?? '--',
                                ),
                              ),
                              Text('-'),
                              TextButton(
                                onPressed: () {
                                  showTimePicker(
                                          context: context,
                                          initialTime: TimeOfDay.now())
                                      .then(
                                    (value) {
                                      setState(
                                        () {
                                          endTime = value;
                                        },
                                      );
                                    },
                                  ).whenComplete(
                                    () => context
                                        .read<BookEventHandlerBloc>()
                                        .add(
                                          BookEventPicked(
                                            req: BookEntityServiceReq(
                                              endTime: endTime?.format(context),
                                              endDate: DateTime.parse(
                                                context
                                                    .read<
                                                        BookEventHandlerBloc>()
                                                    .state
                                                    .endDate!,
                                              ),
                                            ),
                                          ),
                                        ),
                                  );
                                },
                                child: Text(
                                  endTime?.format(context) ?? '--',
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
                                context.read<BookEventHandlerBloc>().add(
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
                                      context.read<BookEventHandlerBloc>().add(
                                            BookEventPicked(
                                              req: BookEntityServiceReq(
                                                endDate: focusedDate,
                                                startTime:
                                                    element.slots?[index].start,
                                                endTime:
                                                    element.slots?[index].end,
                                              ),
                                            ),
                                          );
                                      setState(
                                        () {
                                          selectedIndex = index;
                                        },
                                      );

                                      // map.update(
                                      //   "end_date",
                                      //   (value) => focusedDate.toString(),
                                      //   ifAbsent: () => focusedDate.toString(),
                                      // );
                                      // map.update(
                                      //   "start_time",
                                      //   (value) => element.slots?[index].start,
                                      //   ifAbsent: () =>
                                      //       element.slots?[index].start,
                                      // );
                                      // map.update(
                                      //   "end_time",
                                      //   (value) => element.slots?[index].end,
                                      //   ifAbsent: () =>
                                      //       element.slots?[index].end,
                                      // );

                                      // await CacheHelper.setCachedString(
                                      //   kBookedMap,
                                      //   jsonEncode(map),
                                      // );
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
      decoration: BoxDecoration(
        border: Border.all(
          width: 0.5,
          color: kColorGrey,
        ),
        borderRadius: BorderRadius.circular(
          5,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(
          8.0,
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
                context.read<BookEventHandlerBloc>().add(
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
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
              ),
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
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
