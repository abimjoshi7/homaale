// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';

import 'package:cipher/core/cache/cache_helper.dart';
import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/core/constants/extensions.dart';
import 'package:cipher/features/event/presentation/bloc/event_bloc.dart';
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
  CalendarFormat? calendarFormat;
  DateTime focusedDate = DateTime.now();
  List<DateTime> dateList = [];
  final map = {};
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const CustomFormField(
            label: 'When do you need this done?',
            child: Text(
              'Select task date from the calender to complete booking.',
              style: kText15,
            ),
          ),
          BlocBuilder<EventBloc, EventState>(
            builder: (context, state) {
              if (state.theStates == TheStates.initial) {
                return const CircularProgressIndicator();
              }
              if (state.isEventLoaded == true) {
                if (dateList.isEmpty) {
                  for (final element in state.event!.allShifts!) {
                    dateList.add(element.date!);
                  }
                }
              }
              return Column(
                children: [
                  Container(
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
                      padding: const EdgeInsets.all(8.0),
                      child: CustomFormField(
                        label: 'Select Date',
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
                                    focusedDate = selectedDay;
                                  },
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
                    ),
                  ),
                  Visibility(
                    visible: dateList.contains(
                      focusedDate.toDateOnly(),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CustomFormField(
                        label: "Select Shift:",
                        child: Wrap(
                          runSpacing: 10,
                          children: state.event == null
                              ? []
                              : [
                                  for (final element in state.event!.allShifts!)
                                    element.date!.toDateOnly().isAtSameMomentAs(
                                              focusedDate.toDateOnly(),
                                            )
                                        ? SizedBox(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.06,
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            child: ListView.builder(
                                              scrollDirection: Axis.horizontal,
                                              itemCount: element.slots!.length,
                                              itemBuilder: (context, index) =>
                                                  Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: InkWell(
                                                  onTap: () async {
                                                    setState(() {
                                                      selectedIndex = index;
                                                    });
                                                    map.update(
                                                      "end_date",
                                                      (value) => focusedDate
                                                          .toString(),
                                                      ifAbsent: () =>
                                                          focusedDate
                                                              .toString(),
                                                    );
                                                    map.update(
                                                      "start_time",
                                                      (value) => element
                                                          .slots?[index].start,
                                                      ifAbsent: () => element
                                                          .slots?[index].start,
                                                    );
                                                    map.update(
                                                      "end_time",
                                                      (value) => element
                                                          .slots?[index].end,
                                                      ifAbsent: () => element
                                                          .slots?[index].end,
                                                    );

                                                    await CacheHelper
                                                        .setCachedString(
                                                      kBookedMap,
                                                      jsonEncode(map),
                                                    );
                                                  },
                                                  child: TheTimeSlot(
                                                    index: index,
                                                    selectedIndex:
                                                        selectedIndex ?? 0,
                                                    element: element,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          )
                                        : const SizedBox.shrink()
                                ],
                        ),
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
