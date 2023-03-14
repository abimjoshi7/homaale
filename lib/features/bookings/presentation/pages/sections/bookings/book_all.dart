import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/features/bookings/presentation/widgets/widget.dart';
import 'package:cipher/widgets/widgets.dart';
import 'package:flutter/material.dart';

class BookingsAll extends StatelessWidget {
  const BookingsAll({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(5),
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
                  bottomRightWidget: SizedBox(
                    width: 120,
                    child: CustomElevatedButton(
                      callback: () {},
                      label: 'Completed',
                      mainColor: Colors.green,
                      borderColor: Colors.green,
                    ),
                  ),
                ),
                separatorBuilder: (context, index) => kHeight10,
                itemCount: 5,
              ),
            ),
          )
        ],
      ),
    );
  }
}
