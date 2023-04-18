// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:cipher/core/constants/constants.dart';

class SavedCard extends StatelessWidget {
  const SavedCard({
    Key? key,
    this.label,
    this.child,
    this.index,
    this.onTap,
  }) : super(key: key);

  final String? label;
  final Widget? child;
  final int? index;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
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
            child: Text(
              label ?? 'All',
              style: kPurpleText13,
            ),
          ),
        ],
      ),
    );
  }
}
