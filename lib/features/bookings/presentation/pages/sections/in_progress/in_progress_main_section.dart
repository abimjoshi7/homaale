import 'package:cipher/features/bookings/presentation/pages/sections/in_progress/in_progess.dart';
import 'package:flutter/material.dart';

class InProgressMainSection extends StatelessWidget {
  const InProgressMainSection({
    super.key,
    required this.selectedIndex,
  });
  final int selectedIndex;

  @override
  Widget build(BuildContext context) {
    switch (selectedIndex) {
      case 0:
        return const InProgessAll();
      case 1:
        return const InProgressMyTask();
      default:
        return const SizedBox.shrink();
    }
  }
}
