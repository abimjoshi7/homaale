import 'package:cipher/core/constants/constants.dart';
import 'package:flutter/material.dart';

class BookingsCalenderSection extends StatelessWidget {
  const BookingsCalenderSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Dec-2022'),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.calendar_month_rounded,
                  ),
                ),
              ],
            ),
            kHeight10,
            Expanded(
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => Container(
                  width: 54,
                  decoration: BoxDecoration(
                    color: const Color(0xffF1F3F5),
                    borderRadius: BorderRadius.circular(
                      30,
                    ),
                  ),
                ),
                separatorBuilder: (context, index) => kWidth10,
                itemCount: 7,
              ),
            )
          ],
        ),
      ),
    );
  }
}
