import 'package:cipher/features/bookings/presentation/pages/sections/approved/approved.dart';
import 'package:flutter/material.dart';

class ApprovedMainSection extends StatelessWidget {
  const ApprovedMainSection({
    super.key,
    required this.selectedIndex,
  });
  final int selectedIndex;

  @override
  Widget build(BuildContext context) {
    switch (selectedIndex) {
      case 0:
        return const ApprovedAll();
      case 1:
        return const ApprovedMyTask();
      case 2:
        return const ApprovedMyServices();
      default:
        return const SizedBox.shrink();
    }
  }
}
