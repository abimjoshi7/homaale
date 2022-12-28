import 'package:flutter/material.dart';

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
                const CircleAvatar(),
                Column(
                  children: [
                    const Text('Hi, Harry'),
                    Row(
                      children: const [
                        Icon(Icons.location_on_outlined),
                        Text('Hi, Harry'),
                        Icon(Icons.arrow_drop_down_rounded)
                      ],
                    ),
                  ],
                ),
              ],
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.notifications_none_rounded,
              ),
            ),
          ],
        ),
        TextFormField(
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
          ),
        ),
      ],
    );
  }
}
