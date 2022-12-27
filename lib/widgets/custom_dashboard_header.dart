import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class CustomDashboardHeader extends StatelessWidget {
  const CustomDashboardHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                CircleAvatar(),
                Column(
                  children: [
                    Text("Hi, Harry"),
                    Row(
                      children: [
                        Icon(Icons.location_on_outlined),
                        Text("Hi, Harry"),
                        Icon(Icons.arrow_drop_down_rounded)
                      ],
                    ),
                  ],
                ),
              ],
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.notifications_none_rounded,
              ),
            ),
          ],
        ),
        TextFormField(
          decoration: InputDecoration(
            border: OutlineInputBorder(),
          ),
        ),
      ],
    );
  }
}
