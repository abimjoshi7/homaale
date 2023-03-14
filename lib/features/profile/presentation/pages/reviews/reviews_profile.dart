// ignore_for_file: lines_longer_than_80_chars

import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/widgets/widgets.dart';
import 'package:flutter/material.dart';

class ReviewsProfile extends StatelessWidget {
  const ReviewsProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Reviews (30)',
                style: kHeading3,
              ),
              OutlinedButton(
                onPressed: () {},
                child: Row(
                  children: const [
                    Text('Most Relevant'),
                    Icon(Icons.arrow_drop_down)
                  ],
                ),
              )
            ],
          ),
        ),
        Expanded(
          child: ListView.separated(
            itemCount: 6,
            itemBuilder: (context, index) => Column(
              children: [
                ListTile(
                  leading: const CircleAvatar(),
                  title: Column(
                    children: [
                      Row(
                        children: const [
                          Text('Elena Shrestha'),
                          WidgetText(
                            label: '3',
                            widget: Icon(
                              Icons.star_rounded,
                            ),
                          ),
                        ],
                      ),
                      const Text(
                        'Great work, very easy to deal with and great communication',
                      ),
                    ],
                  ),
                  trailing: const Text(
                    '3 days ago',
                    style: kHelper13,
                  ),
                ),
              ],
            ),
            separatorBuilder: (context, index) => const Divider(),
          ),
        ),
      ],
    );
  }
}
