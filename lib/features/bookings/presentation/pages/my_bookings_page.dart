import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/features/bookings/data/models/booking_history_req.dart';
import 'package:cipher/features/bookings/presentation/bloc/bookings_bloc.dart';
import 'package:cipher/features/bookings/presentation/widgets/sections/sections.dart';
import 'package:cipher/features/task_entity_service/presentation/pages/task_entity_service_page.dart';
import 'package:cipher/locator.dart';
import 'package:cipher/widgets/widgets.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';

class MyBookingsPage extends StatefulWidget {
  static const routeName = "/my-bookings-page";
  const MyBookingsPage({super.key});

  @override
  State<MyBookingsPage> createState() => _MyBookingsPageState();
}

class _MyBookingsPageState extends State<MyBookingsPage> {
  final bookingsBloc = locator<BookingsBloc>();

  // @override
  // void initState() {
  //   bookingsBloc.add(BookingLoaded(isTask: true, page: 1));
  //   bookingsBloc.add(BookingLoaded(isTask: false, page: 1));
  //   bookingsBloc.add(BookingHistory(bookingHistoryReq: BookingHistoryReq(page: 1)));
  //   super.initState();
  // }

  @override
  void dispose() {
    bookingsBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<BookingsBloc, BookingsState>(
        bloc: bookingsBloc,
        builder: (context, state) {
          return SizedBox(
            height: MediaQuery.of(context).size.height * 0.9,
            width: double.infinity,
            child: Column(
              children: [
                kHeight50,
                CustomHeader(
                  leadingWidget: addHorizontalSpace(
                    MediaQuery.of(context).size.width * 0.1,
                  ),
                  trailingWidget: IconButton(
                    onPressed: () {
                      Navigator.pushNamed(
                        context,
                        TaskEntityServicePage.routeName,
                      );
                    },
                    icon: const Icon(
                      Icons.search,
                    ),
                  ),
                  child: const Text(
                    'My Bookings',
                  ),
                ),
                const Divider(),
                BookingsCalenderSection(bloc: bookingsBloc),
                Expanded(
                  child: MyBookingsTabSection(bloc: bookingsBloc),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
