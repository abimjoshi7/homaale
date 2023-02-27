import 'package:cipher/core/constants/constants.dart';
import 'package:flutter/material.dart';

class BookingsInfoSection extends StatelessWidget {
  const BookingsInfoSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Container(
        color: kColorPrimary,
        height: 40,
        width: double.infinity,
        child: const Center(
          child: Text(
            '\$765.90 from 10 Bookings',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
