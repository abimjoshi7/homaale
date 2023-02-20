import 'package:cipher/core/constants/constants.dart';
import 'package:flutter/material.dart';

class BookingsFilterSection extends StatelessWidget {
  const BookingsFilterSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 8,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: const [
              ChoiceChip(
                label: Text('All'),
                selected: true,
              ),
              kWidth10,
              ChoiceChip(
                label: Text('My Task'),
                selected: true,
              ),
              kWidth10,
              ChoiceChip(
                label: Text('My Orders'),
                selected: true,
              ),
            ],
          ),
          // Row(
          //   children: [
          //     Container(
          //       height: 20,
          //       width: 40,
          //       decoration: BoxDecoration(
          //         color: Colors.amber,
          //         borderRadius: BorderRadius.circular(10),
          //       ),
          //     ),
          //     IconButton(onPressed: () {}, icon: const Icon(Icons.filter_list))
          //   ],
          // )
        ],
      ),
    );
  }
}
