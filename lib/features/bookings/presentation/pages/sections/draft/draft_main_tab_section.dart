import 'package:cipher/features/bookings/presentation/pages/sections/draft/draft.dart';
import 'package:flutter/material.dart';

class DraftTabMainSection extends StatelessWidget {
  const DraftTabMainSection({
    super.key,
    required this.selectedIndex,
  });
  final int selectedIndex;

  @override
  Widget build(BuildContext context) {
    switch (selectedIndex) {
      case 0:
        return const DraftAll();
      case 1:
        return const DraftMyTask();
      case 2:
        return const DraftMyOrder();
      default:
        return const SizedBox.shrink();
    }
  }
}
