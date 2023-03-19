import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/features/bookings/presentation/widgets/sections/sections.dart';
import 'package:cipher/features/task_entity_service/presentation/pages/task_entity_service_page.dart';
import 'package:cipher/widgets/widgets.dart';
import 'package:flutter/material.dart';

class MyBookingsPage extends StatelessWidget {
  static const routeName = "/my-bookings-page";
  const MyBookingsPage({super.key});

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
              child: MyBookingsTabSection(),
            ),
          ],
        ),
      ),
    );
  }
}
