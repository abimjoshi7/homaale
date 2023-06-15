import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/features/tasker/data/models/tasker_review_response.dart';
import 'package:cipher/features/tasker/presentation/bloc/tasker_bloc.dart';
import 'package:cipher/features/tasker/presentation/cubit/tasker_cubit.dart';
import 'package:cipher/widgets/widgets.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';

enum FilterSort { filter, sort }

class TaskerReviewSection extends StatefulWidget {
  const TaskerReviewSection({super.key, this.taskerReviewsResponse});

  final TaskerReviewResponse? taskerReviewsResponse;

  @override
  State<TaskerReviewSection> createState() => _TaskerReviewSectionState();
}

class _TaskerReviewSectionState extends State<TaskerReviewSection> {
  List<String> ratingList = ['All Stars', '5 Stars', '4 Stars', '3 Stars', '2 Stars', '1 Star'];
  List<String> sortList = ['Oldest - Newest', 'Newest - Oldest', 'Highest - Lowest', 'Lowest - Highest'];

  String? currentRatingSelected;
  String? currentSortSelected;

  @override
  void initState() {
    super.initState();
    context.read<TaskerCubit>().loadSingleTaskerReviews(context.read<TaskerCubit>().state.singleTasker.user?.id ?? '');
  }

  showFilterSortModal(FilterSort filterSort) {
    final displayList = filterSort == FilterSort.filter ? ratingList : sortList;
    showModalBottomSheet(
      context: context,
      useSafeArea: true,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              kHeight10,
              Center(
                child: Text(
                  'By ${filterSort == FilterSort.filter ? 'Rating' : 'Sort'}',
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
              ),
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: displayList.length,
                itemBuilder: (context, index) => typeWidget(
                  title: '${displayList[index]}',
                  isSelected: filterSort == FilterSort.filter
                      ? displayList[index] == currentSortSelected
                      : displayList[index] == currentRatingSelected,
                  onTap: () {
                    if (filterSort == FilterSort.filter) {
                      setState(() {
                        currentSortSelected = displayList[index];
                      });
                    } else {
                      setState(() {
                        currentRatingSelected = displayList[index];
                      });
                    }
                    context.read<TaskerCubit>().loadSingleTaskerReviews(
                          context.read<TaskerCubit>().state.singleTasker.user?.id ?? '',
                          order: getOrder(displayList[index]),
                          rating: getRating(displayList[index]),
                        );
                    Navigator.pop(context);
                  },
                ),
              )
            ],
          ),
        );
      },
    );
  }

  String getOrder(String? order) {
    switch (order) {
      case 'Oldest - Newest':
        return "created_at";

      case 'Newest - Oldest':
        return "-created_at";

      case 'Highest - Lowest':
        return "-rating";

      case 'Lowest - Highest':
        return "rating";

      default:
        return "";
    }
  }

  String getRating(String? rating) {
    switch (rating) {
      case 'All Stars':
        return "";
      case '5 Stars':
        return "5";
      case '4 Stars':
        return "4";
      case '3 Stars':
        return "3";
      case '2 Stars':
        return "2";
      case '1 Star':
        return "1";
      default:
        return "";
    }
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
                      Row(
                        children: [
                          IconButton(
                            onPressed: () => showFilterSortModal(FilterSort.filter),
                            icon: Icon(Icons.filter_alt_outlined),
                            iconSize: 18,
                          ),
                          IconButton(
                            onPressed: () => showFilterSortModal(FilterSort.sort),
                            icon: Icon(Icons.sort),
                            iconSize: 18,
                          ),
                        ],
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
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            SizedBox(
                                              width: MediaQuery.of(context).size.width * 0.3,
                                              child: Text(
                                                '${state.taskerReviewsResponse.result?[index].ratedBy?.fullName}',
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            ),
                                            WidgetText(
                                              label: '${state.taskerReviewsResponse.result?[index].rating}',
                                              widget: Icon(
                                                Icons.star_rounded,
                                                size: 14,
                                                color: kColorAmber,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Text(
                                          Jiffy('${state.taskerReviewsResponse.result?[index].createdAt}').yMMMMd,
                                          style: Theme.of(context).textTheme.bodySmall,
                                        ),
                                      ],
                                    ),
                                    kHeight5,
                                    Text(
                                      '${state.taskerReviewsResponse.result?[index].review}',
                                      style: Theme.of(context).textTheme.bodySmall,
                                    ),
                                  ],
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

  ListTile typeWidget({required String title, required bool isSelected, VoidCallback? onTap}) {
    return ListTile(
      onTap: onTap,
      title: Text(
        '$title',
        style: Theme.of(context).textTheme.titleSmall,
      ),
      trailing: Icon(
        isSelected ? Icons.radio_button_checked : Icons.radio_button_off,
        color: kColorAmber,
      ),
    );
  }
}
