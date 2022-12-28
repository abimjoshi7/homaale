import 'package:flutter/material.dart';

class CustomNavBar extends StatelessWidget {
  const CustomNavBar({
    super.key,
    this.theHeight = 40,
    this.theWidth = double.infinity,
  });

  final double theHeight;
  final double theWidth;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(25)),
      width: theWidth,
      height: theHeight,
      child: Row(
        children: [
          Column(
            children: const [
              Icon(Icons.home_rounded),
              Text('Home'),
            ],
          ),
          Column(
            children: const [
              Icon(Icons.search_rounded),
              Text('Search'),
            ],
          ),
          Column(
            children: const [
              Icon(Icons.add_circle_outline_outlined),
              Text('Add'),
            ],
          ),
          Column(
            children: const [
              Icon(Icons.calendar_today_rounded),
              Text('Bookings'),
            ],
          ),
          Column(
            children: const [
              Icon(Icons.settings),
              Text('Account'),
            ],
          ),
        ],
      ),
    );
  }
}
