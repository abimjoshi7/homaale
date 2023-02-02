import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/features/bookings/presentation/sections/sections.dart';
import 'package:cipher/features/bookings/presentation/widgets/widget.dart';
import 'package:cipher/features/profile/presentation/pages/about/widgets/widgets.dart';
import 'package:cipher/widgets/widgets.dart';
import 'package:flutter/material.dart';

class InProgressSection extends StatelessWidget {
  const InProgressSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const BookingsFilterSection(),
        Padding(
          padding: const EdgeInsets.all(10),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              '04 Dec 2022, Sunday',
              style: kHelper13,
            ),
          ),
        ),
        BookingsServiceCard(
          serviceName: 'Plumbing Services',
          providerName: 'Cart Clinic',
          mainContentWidget: Column(
            children: [
              IconText(
                iconData: Icons.calendar_today_rounded,
                label: '${DateTime.now()}',
              ),IconText(
                iconData: Icons.calendar_today_rounded,
                label: '${DateTime.now()}',
              ),IconText(
                iconData: Icons.calendar_today_rounded,
                label: '${DateTime.now()}',
              ),IconText(
                iconData: Icons.calendar_today_rounded,
                label: '${DateTime.now()}',
              ),

            ],
          ),
          status: 'In Progress',
          bottomRightWidget: CustomElevatedButton(
            callback: () {

            },
            label: 'Completed',
            mainColor: Colors.green,
            borderColor: Colors.green,
          ),
        ),
      ],
    );
  }
}
