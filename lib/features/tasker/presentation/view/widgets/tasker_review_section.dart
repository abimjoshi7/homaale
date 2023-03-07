import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/features/tasker/data/models/tasker_review_response.dart';
import 'package:cipher/widgets/widgets.dart';
import 'package:flutter/material.dart';

class TaskerReviewSection extends StatefulWidget {
  const TaskerReviewSection({super.key, this.taskerReviewsResponse});

  final TaskerReviewResponse? taskerReviewsResponse;

  @override
  State<TaskerReviewSection> createState() => _TaskerReviewSectionState();
}

class _TaskerReviewSectionState extends State<TaskerReviewSection> {
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
                'Reviews (${widget.taskerReviewsResponse?.count})',
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
            itemCount: widget.taskerReviewsResponse?.result?.length ?? 0,
            padding: EdgeInsets.zero,
            itemBuilder: (context, index) => Column(
              children: [
                ListTile(
                  leading: const CircleAvatar(),
                  title: Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            '${widget.taskerReviewsResponse?.result?[index].ratedBy?.fullName}',
                          ),
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
