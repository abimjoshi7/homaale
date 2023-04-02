import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/features/bookings/data/models/my_booking_list_model.dart';
import 'package:cipher/features/bookings/presentation/bloc/bookings_bloc.dart';
import 'package:cipher/locator.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';

class BookingsCalenderSection extends StatefulWidget {
  const BookingsCalenderSection({
    super.key,
  });

  @override
  State<BookingsCalenderSection> createState() => _BookingsCalenderSectionState();
}

class _BookingsCalenderSectionState extends State<BookingsCalenderSection> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BookingsBloc, BookingsState>(
      builder: (context, state) {
        return SizedBox(
          height: MediaQuery.of(context).size.height * 0.17,
          width: double.infinity,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('${DateFormat('MMMM').format(DateTime.now())}, ${DateTime.now().year}'),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.calendar_month_rounded,
                      ),
                    ),
                  ],
                ),
              ),
              TableCalendar(
                firstDay: DateTime.utc(2010, 10, 16),
                lastDay: DateTime.utc(2030, 3, 14),
                focusedDay: DateTime.now(),
                calendarFormat: CalendarFormat.week,
                weekendDays: [DateTime.saturday],
                headerVisible: false,
                eventLoader: (day) {
                  var list = [];
                  var res = <Result>[
                    ...?state.myBookingListModelTask?.result,
                    ...?state.myBookingListModelService?.result
                  ];
                  for (var item in res) {
                    if (day.isAtSameMomentAs(item.createdAt!)) {
                      list.add(day);
                    }
                  }
                  return list;
                },
                calendarBuilders: CalendarBuilders(
                  selectedBuilder: (context, date, events) => Container(
                    margin: const EdgeInsets.all(4.0),
                    alignment: Alignment.center,
                    decoration:
                        BoxDecoration(color: Theme.of(context).primaryColor, borderRadius: BorderRadius.circular(10.0)),
                    child: Text(
                      date.day.toString(),
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Container(
                  color: kColorPrimary,
                  height: 40,
                  width: double.infinity,
                  child: const Center(
                    child: Text(
                      '\.90 from 10 Bookings',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
