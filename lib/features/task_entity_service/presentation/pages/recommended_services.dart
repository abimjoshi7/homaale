import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/features/rating_reviews/presentation/bloc/rating_reviews_bloc.dart';
import 'package:cipher/features/task_entity_service/data/models/res/recommended_similar_dto.dart';
import 'package:cipher/features/task_entity_service/presentation/bloc/task_entity_service_bloc.dart';
import 'package:cipher/features/task_entity_service/presentation/pages/edit_task_entity_service_page.dart';
import 'package:cipher/features/task_entity_service/presentation/pages/task_entity_service_page.dart';
import 'package:cipher/features/user/presentation/bloc/user/user_bloc.dart';
import 'package:cipher/widgets/service_card.dart';
import 'package:cipher/features/task_entity_service/presentation/bloc/task_entity_service_bloc.dart' as tsk;

import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';

class RecommendedSimilarServices extends StatefulWidget {
  final List<Recommend>? recommend;
  final bool isRecommended;
  const RecommendedSimilarServices(
      {super.key, this.recommend, required this.isRecommended});

  @override
  State<RecommendedSimilarServices> createState() =>
      _RecommendedSimilarServicesState();
}

class _RecommendedSimilarServicesState
    extends State<RecommendedSimilarServices> {
  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: widget.recommend?.isNotEmpty ?? false,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            '${widget.isRecommended ? 'Recommended' : 'Similar'} Services',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          SizedBox(
            height: 250,
            child: ListView.separated(
              shrinkWrap: true,
              primary: false,
              scrollDirection: Axis.horizontal,
              itemCount: widget.recommend?.length ?? 0,
              separatorBuilder: (context, index) => addHorizontalSpace(10),
              itemBuilder: (context, index) => GestureDetector(
                onTap: () {
                  context.read<TaskEntityServiceBloc>().add(
                        TaskEntityServiceSingleLoaded(
                          id: widget.recommend?[index].id ?? '',
                        ),
                      );
                  context.read<TaskEntityServiceBloc>().add(
                        FetchRecommendedSimilar(
                          id: widget.recommend?[index].id ?? '',
                        ),
                      );
                  context.read<RatingReviewsBloc>().add(
                        SetToInitial(
                          id: widget.recommend?[index].id ?? '',
                        ),
                      );
                },
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.48,
                  child: ServiceCard(
                    createdByProfileImg:
                        '${widget.recommend?[index].createdBy?.profileImage}',
                    location: widget.recommend?[index].location == ""
                        ? "Remote"
                        : widget.recommend?[index].location,
                    createdBy:
                        "${widget.recommend?[index].createdBy?.firstName} ${widget.recommend?[index].createdBy?.lastName}",
                    title: widget.recommend?[index].title,
                    imagePath: widget.recommend?[index].images?.length == 0
                        ? kHomaaleImg
                        : widget.recommend?[index].images?.first.media,
                    rating: widget.recommend?[index].rating.toString() == 'null'
                        ? '0'
                        : widget.recommend?[index].rating.toString() ?? "0",
                    isRange: widget.recommend?[index].isRange,
                    rateTo:
                        double.parse(widget.recommend?[index].payableTo ?? "")
                            .toInt()
                            .toString(),
                    rateFrom:
                        double.parse(widget.recommend?[index].payableFrom ?? "")
                            .toInt()
                            .toString(),
                    isBookmarked: widget.recommend?[index].isBookmarked,
                    isOwner: widget.recommend?[index].owner?.id ==
                        context.read<UserBloc>().state.taskerProfile?.user?.id,
                    id: widget.recommend?[index].id,
                    editCallback: () {
                      showModalBottomSheet(
                        context: context,
                        isScrollControlled: true,
                        builder: (context) => Container(
                          height: MediaQuery.of(context).size.height * 0.75,
                          padding: EdgeInsets.only(
                              bottom: MediaQuery.of(context).viewInsets.bottom,
                              left: 8,
                              right: 8,
                              top: 8),
                          child: SingleChildScrollView(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                EditTaskEntityServiceForm(
                                  id: widget.recommend?[index].id ?? "",
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                    shareCallback: () {
                      Share.share(
                        "$kShareLinks/tasks/${widget.recommend?[index].id}",
                        subject: widget.recommend?[index].title,
                      );
                    },
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
