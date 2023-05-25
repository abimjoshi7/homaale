import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/features/tasker/data/models/tasker_review_response.dart';
import 'package:cipher/features/tasker/presentation/bloc/tasker_bloc.dart';
import 'package:cipher/features/tasker/presentation/cubit/tasker_cubit.dart';
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
  void initState() {
    super.initState();
    context.read<TaskerCubit>().loadSingleTaskerReviews(context.read<TaskerCubit>().state.singleTasker.user?.id ?? '');
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TaskerCubit, TaskerState>(
      builder: (context, state) {
        switch (state.status) {
          case TaskerStatus.success:
            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Reviews (${state.taskerReviewsResponse.count ?? 0})',
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                      OutlinedButton(
                        onPressed: () {},
                        child: Row(
                          children: const [Text('Most Relevant'), Icon(Icons.arrow_drop_down)],
                        ),
                      )
                    ],
                  ),
                ),
                state.taskerReviewsResponse.result?.isEmpty ?? true
                    ? Container(margin: EdgeInsets.only(top: 30), child: Text('Tasker has no reviews yet!'))
                    : Expanded(
                        child: ListView.separated(
                          itemCount: state.taskerReviewsResponse.result?.length ?? 0,
                          padding: EdgeInsets.zero,
                          itemBuilder: (context, index) => Column(
                            children: [
                              ListTile(
                                leading: CircleAvatar(
                                  backgroundImage: NetworkImage(
                                    '${state.taskerReviewsResponse.result?[index].ratedBy?.profileImage}',
                                  ),
                                ),
                                title: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Expanded(
                                          child: Text(
                                            '${state.taskerReviewsResponse.result?[index].ratedBy?.fullName}',
                                            overflow: TextOverflow.ellipsis,
                                          ),
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
                                      '${state.taskerReviewsResponse.result?[index].review}',
                                    ),
                                  ],
                                ),
                                trailing: Text(
                                  Jiffy('${state.taskerReviewsResponse.result?[index].createdAt}').yMMMMd,
                                  style: Theme.of(context).textTheme.bodySmall,
                                ),
                              ),
                            ],
                          ),
                          separatorBuilder: (context, index) => const Divider(),
                        ),
                      ),
              ],
            );

          default:
            return CircularProgressIndicator();
        }
      },
    );
  }
}
