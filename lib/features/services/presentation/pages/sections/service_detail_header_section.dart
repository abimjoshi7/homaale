import 'package:cipher/core/constants/constants.dart';
import 'package:flutter/material.dart';

class ServiceBookingHeaderSection extends StatelessWidget {
  const ServiceBookingHeaderSection({
    super.key,
    required this.selectedIndex,
  });

  final int selectedIndex;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 25,
              width: 25,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: selectedIndex == 0 ? kColorSecondary : kColorGrey,
                  width: 2,
                ),
              ),
              child: const Center(
                child: Text('1'),
              ),
            ),
            addHorizontalSpace(
              2,
            ),
            Container(
              height: 2,
              width: 40,
              color: selectedIndex == 0 ? kColorSecondary : kColorGrey,
            ),
            Container(
              height: 2,
              width: 40,
              color: selectedIndex == 1 ? kColorSecondary : kColorGrey,
            ),
            addHorizontalSpace(2),
            Container(
              height: 25,
              width: 25,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: selectedIndex == 1 ? kColorSecondary : kColorGrey,
                  width: 2,
                ),
              ),
              child: const Center(
                child: Text('2'),
              ),
            ),
          ],
        ),
        addVerticalSpace(
          20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Schedule',
              style: TextStyle(
                fontWeight:
                    selectedIndex == 0 ? FontWeight.bold : FontWeight.normal,
              ),
            ),
            addHorizontalSpace(50),
            Text(
              'Details',
              style: TextStyle(
                fontWeight:
                    selectedIndex == 1 ? FontWeight.bold : FontWeight.normal,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
