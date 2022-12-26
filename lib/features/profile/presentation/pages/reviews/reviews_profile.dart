import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/features/profile/presentation/pages/about/widgets/widgets.dart';
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
              Text(
                "Reviews (30)",
                style: kHeading3,
              ),
              OutlinedButton(
                  onPressed: () {},
                  child: Row(
                    children: [
                      Text("Most Relevant"),
                      Icon(Icons.arrow_drop_down)
                    ],
                  ))
            ],
          ),
        ),
        Expanded(
          child: ListView.separated(
            itemCount: 6,
            itemBuilder: (context, index) => Column(
              children: [
                ListTile(
                  leading: CircleAvatar(),
                  title: Column(
                    children: [
                      Row(
                        children: [
                          Text("Elena Shrestha"),
                          IconText(
                            label: "3",
                            widget: Icon(
                              Icons.star_rounded,
                            ),
                          ),
                        ],
                      ),
                      Text(
                          "“Great work, very easy to deal with and great communication"),
                    ],
                  ),
                  trailing: Text(
                    "3 days ago",
                    style: kHelper1,
                  ),
                ),
              ],
            ),
            separatorBuilder: (context, index) => Divider(),
          ),
        ),
      ],
    );
  }
}
