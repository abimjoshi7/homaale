import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/features/tasker/data/models/tasker_review_response.dart';
import 'package:cipher/widgets/widgets.dart';
import 'package:dependencies/dependencies.dart';
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
                style: Theme.of(context).textTheme.headlineSmall,
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
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(
                      '${widget.taskerReviewsResponse?.result?[index].ratedBy?.profileImage}',
                    ),
                  ),
                  title: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            '${widget.taskerReviewsResponse?.result?[index].ratedBy?.fullName}',
                          ),
                          const WidgetText(
                            label: '0',
                            widget: Icon(
                              Icons.star_rounded,
                              color: kColorAmber,
                            ),
                          ),
                        ],
                      ),
                      Text(
                        '${widget.taskerReviewsResponse?.result?[index].review}',
                      ),
                    ],
                  ),
                  trailing: Text(
                    Jiffy('${widget.taskerReviewsResponse?.result?[index].createdAt}')
                        .yMMMMd,
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
