import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/features/bookings/presentation/widgets/widget.dart';
import 'package:cipher/widgets/widgets.dart';
import 'package:flutter/material.dart';

class BookingsHistorySection extends StatelessWidget {
  const BookingsHistorySection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
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
                serviceName: 'Plumbing Services',
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
                    label: 'Cancelled',
                    mainColor: Colors.red,
                    borderColor: Colors.red,
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
