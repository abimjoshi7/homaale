import 'package:cipher/core/constants/constants.dart';
import 'package:flutter/material.dart';

class SavedCard extends StatelessWidget {
  const SavedCard({
    Key? key,
    this.label,
    this.child,
    this.index,
  }) : super(key: key);

  final String? label;
  final Widget? child;
  final int? index;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(
            10,
          ),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.grey,
            ),
            height: 200,
            child: GridView(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1.1,
              ),
              children: [
                ColoredBox(color: Colors.black),
                ColoredBox(color: Colors.amber),
                ColoredBox(color: Colors.blue),
                ColoredBox(color: Colors.green),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 8.0,
          ),
          child: const Text(
            'All',
            style: kPurpleText13,
          ),
        ),
      ],
    );
  }
}
