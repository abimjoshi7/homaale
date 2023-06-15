// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cipher/widgets/widgets.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';

import 'package:cipher/core/constants/constants.dart';

class TheCalender extends StatelessWidget {
  const TheCalender({
    Key? key,
    this.focusedDate,
    this.onSelect,
    this.onEvent,
    this.dateList,
    this.onFormatChange,
    this.calendarFormat,
  }) : super(key: key);

  final DateTime? focusedDate;
  final void Function(DateTime, DateTime)? onSelect;
  final List<dynamic> Function(DateTime)? onEvent;
  final List<DateTime>? dateList;
  final void Function(CalendarFormat)? onFormatChange;
  final CalendarFormat? calendarFormat;

  @override
  Widget build(BuildContext context) {
    return TableCalendar(
      calendarStyle: CalendarStyle(
        todayDecoration: BoxDecoration(
          color: kColorPrimary.withOpacity(
            0.2,
          ),
          shape: BoxShape.circle,
        ),
        selectedDecoration: BoxDecoration(
          color: kColorAmber,
          shape: BoxShape.circle,
        ),
      ),
      // onFormatChanged: onFormatChange,
      // calendarFormat: calendarFormat ?? CalendarFormat.month,
      calendarFormat: CalendarFormat.month,
      calendarBuilders: CalendarBuilders(
        markerBuilder: (context, day, events) {
          for (final DateTime element in dateList ?? []) {
            if (element.toDateOnly().isAtSameMomentAs(
                  day.toDateOnly(),
                )) {
              if (focusedDate!
                  .toDateOnly()
                  .isAtSameMomentAs(day.toDateOnly())) {
                return Icon(
                  Icons.circle,
                  size: 13,
                  color: kColorAmber,
                );
              } else {
                return Icon(
                  Icons.circle,
                  size: 13,
                  color: Colors.black,
                );
              }
            }
          }
          return null;
        },
      ),
      focusedDay: focusedDate ?? DateTime.now(),
      firstDay: DateTime(2000),
      lastDay: DateTime(2050),
      selectedDayPredicate: (day) {
        return isSameDay(day, focusedDate);
      },
      onDaySelected: onSelect,
      eventLoader: onEvent,
      enabledDayPredicate: (day) {
        if (day.isBefore(
          DateTime.now().subtract(
            Duration(
              days: 1,
            ),
          ),
        )) {
          return false;
        } else {
          return true;
        }
      },
    );
  }
}
