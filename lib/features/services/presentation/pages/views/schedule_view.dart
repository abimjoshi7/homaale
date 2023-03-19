// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:cipher/features/services/presentation/widgets/the_time_slot.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';

import 'package:cipher/core/cache/cache_helper.dart';
import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/core/constants/extensions.dart';
import 'package:cipher/features/event/data/models/event.dart';
import 'package:cipher/features/event/presentation/bloc/event_bloc.dart';
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
              padding: const EdgeInsets.all(
                20,
              ),
              child: CustomFormField(
                label: 'Select Date',
                child: BlocBuilder<EventBloc, EventState>(
                  builder: (context, state) {
                    if (state.theStates == TheStates.success) {
                      if (dateList.isEmpty) {
                        for (final element in state.event!.allShifts!) {
                          dateList.add(element.date!);
                        }
                      }

                      return Column(
                        children: [
                          TableCalendar(
                            focusedDay: focusedDate,
                            firstDay: DateTime(2000),
                            lastDay: DateTime(2050),
                            selectedDayPredicate: (day) {
                              return isSameDay(day, focusedDate);
                            },
                            // rangeStartDay:
                            //     state.event?.schedules?.first.startDate,
                            // rangeEndDay: state.event?.schedules?.first.endDate,
                            onDaySelected: (selectedDay, focusedDay) {
                              setState(
                                () {
                                  focusedDate = selectedDay;
                                },
                              );
                            },
                            eventLoader: (day) {
                              for (final element in dateList) {
                                if (element.dateOnly().isAtSameMomentAs(
                                      day.dateOnly(),
                                    )) {
                                  return [
                                    const SizedBox.shrink(),
                                  ];
                                }
                              }
                              return [];
                            },
                          ),
                          addVerticalSpace(8),
                          Visibility(
                            visible: dateList.contains(
                              focusedDate.dateOnly(),
                            ),
                            child: CustomFormField(
                              label: "Select Shift:",
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8.0),
                                child: Wrap(
                                  runSpacing: 10,
                                  children: [
                                    for (final element
                                        in state.event!.allShifts!)
                                      element.date!.dateOnly().isAtSameMomentAs(
                                                focusedDate.dateOnly(),
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
                                                scrollDirection:
                                                    Axis.horizontal,
                                                itemCount:
                                                    element.slots!.length,
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
                                                            .slots?[index]
                                                            .start,
                                                        ifAbsent: () => element
                                                            .slots?[index]
                                                            .start,
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
                    }
                    return const CircularProgressIndicator();
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
