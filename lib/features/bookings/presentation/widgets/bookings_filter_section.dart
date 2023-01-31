import 'package:cipher/core/constants/constants.dart';
import 'package:flutter/material.dart';

class BookingsFilterSection extends StatelessWidget {
  const BookingsFilterSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            children: const [
              ChoiceChip(
                label: Text('Booked By Me'),
                selected: true,
              ),
              kWidth10,
              ChoiceChip(
                label: Text('Booked By Others'),
                selected: true,
              ),
            ],
          ),
        ),
        Row(
          children: [
            Container(
              height: 20,
              width: 40,
              decoration: BoxDecoration(
                color: Colors.amber,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            IconButton(onPressed: () {}, icon: const Icon(Icons.filter_list))
          ],
        )
      ],
    );
  }
}
