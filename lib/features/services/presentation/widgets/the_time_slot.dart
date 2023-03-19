import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/features/event/data/models/event.dart';
import 'package:flutter/material.dart';

class TheTimeSlot extends StatelessWidget {
  const TheTimeSlot({
    super.key,
    required this.index,
    required this.selectedIndex,
    required this.element,
  });

  final int index;
  final int selectedIndex;
  final AllShift element;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(
        8,
      ),
      decoration: BoxDecoration(
        color: selectedIndex == index
            ? kColorSecondary.withOpacity(
                0.3,
              )
            : Colors.transparent,
        borderRadius: BorderRadius.circular(
          8,
        ),
        border: Border.all(
          color: selectedIndex == index ? kColorSecondary : kColorGrey,
        ),
      ),
      child: Center(
        child: Text(
          '${element.slots?[index].start!.substring(0, 5)} - ${element.slots?[index].end!.substring(0, 5)}',
          style: kText15,
        ),
      ),
    );
  }
}
