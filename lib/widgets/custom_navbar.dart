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
            children: [
              Icon(Icons.home_rounded),
              Text("Home"),
            ],
          ),
          Column(
            children: [
              Icon(Icons.search_rounded),
              Text("Search"),
            ],
          ),
          Column(
            children: [
              Icon(Icons.add_circle_outline_outlined),
              Text("Add"),
            ],
          ),
          Column(
            children: [
              Icon(Icons.calendar_today_rounded),
              Text("Bookings"),
            ],
          ),
          Column(
            children: [
              Icon(Icons.settings),
              Text("Account"),
            ],
          ),
        ],
      ),
    );
  }
}
