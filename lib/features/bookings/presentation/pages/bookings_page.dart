import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/features/services/presentation/pages/service_provider_page.dart';
import 'package:cipher/features/bookings/presentation/sections/sections.dart';
import 'package:cipher/widgets/widgets.dart';
import 'package:flutter/material.dart';

class BookingPages extends StatelessWidget {
  static const routeName = "/bookings-page";
  const BookingPages({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          kHeight50,
          CustomHeader(
            leadingWidget: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            trailingWidget: IconButton(
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  ServiceProviderPage.routeName,
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
          Divider(),
          BookingsCalenderSection(),
          BookingsInfoSection(),
          Expanded(
            child: const BookingsMainSection(),
          ),
        ],
      ),
    );
  }
}
