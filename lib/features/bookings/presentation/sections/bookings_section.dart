import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/features/bookings/presentation/sections/sections.dart';
import 'package:cipher/features/bookings/presentation/widgets/widget.dart';
import 'package:cipher/widgets/widgets.dart';
import 'package:flutter/material.dart';

class BookingsSection extends StatelessWidget {
  const BookingsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const BookingsFilterSection(),
        const Padding(
          padding: EdgeInsets.all(10),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              '04 Dec 2022, Sunday',
              style: kHelper13,
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: ListView.separated(
              padding: EdgeInsets.zero,
              itemBuilder: (context, index) => BookingsServiceCard(
                color: Colors.blue,
                serviceName: 'Root Canal Treatment',
                providerName: 'Cart Clinic',
                mainContentWidget: Column(
                  children: [
                    IconText(
                      iconData: Icons.calendar_today_rounded,
                      label: '${DateTime.now()}',
                    ),
                    IconText(
                      iconData: Icons.calendar_today_rounded,
                      label: '${DateTime.now()}',
                    ),
                    IconText(
                      iconData: Icons.calendar_today_rounded,
                      label: '${DateTime.now()}',
                    ),
                  ],
                ),
                status: 'In Progress',
                bottomLeftWidget: const Text(
                  'View Detail',
                  style: kText15,
                ),
                bottomRightWidget: SizedBox(
                  width: 120,
                  child: CustomElevatedButton(
                    callback: () {},
                    label: 'In Progress',
                    mainColor: Colors.orangeAccent,
                    borderColor: Colors.orangeAccent,
                  ),
                ),
              ),
              separatorBuilder: (context, index) => kHeight10,
              itemCount: 5,
            ),
          ),
        ),
      ],
    );
  }
}
