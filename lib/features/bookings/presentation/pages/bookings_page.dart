import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/features/bookings/presentation/pages/my_bookings_main_section.dart';
import 'package:cipher/features/bookings/presentation/pages/sections/sections.dart';
import 'package:cipher/features/task_entity_service/presentation/pages/task_entity_service_page.dart';
import 'package:cipher/widgets/widgets.dart';
import 'package:flutter/material.dart';

class BookingPages extends StatefulWidget {
  static const routeName = "/bookings-page";
  const BookingPages({super.key});

  @override
  State<BookingPages> createState() => _BookingPagesState();
}

class _BookingPagesState extends State<BookingPages> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
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
            const BookingsCalenderSection(),
            const Expanded(
              child: MyBookingsMainSection(),
            ),
          ],
        ),
      ),
    );
  }
}
