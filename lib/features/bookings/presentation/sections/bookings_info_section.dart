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
        height: 50,
        width: double.infinity,
        child: Center(
          child: Text(
            '\$765.09 from 10 Bookings',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
