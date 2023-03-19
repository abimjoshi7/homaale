import 'package:cipher/features/bookings/presentation/widgets/sections/history/history.dart';
import 'package:flutter/material.dart';

class HistoryTabMainSection extends StatelessWidget {
  const HistoryTabMainSection({
    super.key,
    required this.selectedIndex,
  });
  final int selectedIndex;

  @override
  Widget build(BuildContext context) {
    switch (selectedIndex) {
      case 0:
        return const BookedByMe();
      case 1:
        return const BookedByOthers();

      default:
        return const SizedBox.shrink();
    }
  }
}
