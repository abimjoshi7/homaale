import 'package:cipher/features/bookings/presentation/pages/sections/bookings/bookings.dart';
import 'package:flutter/material.dart';

class BookingsTabMainSection extends StatelessWidget {
  const BookingsTabMainSection({
    super.key,
    required this.selectedIndex,
  });
  final int selectedIndex;

  @override
  Widget build(BuildContext context) {
    switch (selectedIndex) {
      case 0:
        return const BookingsAll();
      case 1:
        return const BookingsMyTask();
      case 2:
        return const BookingsMyOrder();
      default:
        return const SizedBox.shrink();
    }
  }
}
