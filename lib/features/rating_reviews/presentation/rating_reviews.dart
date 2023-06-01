
import 'package:cipher/core/constants/colors.dart';
import 'package:cipher/core/constants/date_time_representation.dart';
import 'package:cipher/core/constants/dimensions.dart';
import 'package:cipher/core/constants/strings.dart';
import 'package:cipher/features/rating_reviews/presentation/bloc/rating_reviews_bloc.dart';
import 'package:cipher/widgets/widgets.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';

class RatingReviewsPage extends StatefulWidget {
  static const String routeName = '/rating-reviews-page';
  const RatingReviewsPage({super.key});

  @override
  State<RatingReviewsPage> createState() => _RatingReviewsPageState();
}

class _RatingReviewsPageState extends State<RatingReviewsPage> {
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    context.read<RatingReviewsBloc>().add(FetchRatingsReviews(id: context.read<RatingReviewsBloc>().state.taskId));
    _scrollController.addListener(_onScroll);
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: CustomAppBar(appBarTitle: 'Rating & Reviews'),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: BlocBuilder<RatingReviewsBloc, RatingReviewState>(
          builder: (context, state) {
            switch (state.status) {
              case RatingStatus.success:
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // TODO: update with ratings from entity service
                    // Text('Success'),
                    addVerticalSpace(16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        RichText(
                          text: TextSpan(
                            text: 'Reviews ',
                            style: textTheme.titleSmall,
                            children: [
                              TextSpan(
                                text: '(${state.review.length})',
                                style: textTheme.bodySmall,
                              ),
                            ],
                          ),
                        ),
                        // TODO: update with drop down to filter/sort reviews
                        // Text('Success'),
                      ],
                    ),
                    addVerticalSpace(16),
                    Expanded(
                      child: ListView.separated(
                        itemCount: state.hasReachedMax ? state.review.length : state.review.length + 1,
                        controller: _scrollController,
                        separatorBuilder: (context, index) => addVerticalSpace(16),
                        physics: AlwaysScrollableScrollPhysics(),
                        itemBuilder: (BuildContext context, int index) {
                          return index >= state.review.length
                              ? const BottomLoader()
                              : ListTile(
                                  contentPadding: EdgeInsets.zero,
                                  horizontalTitleGap: 4,
                                  leading: Container(
                                    height: 80,
                                    width: 80,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      image: DecorationImage(
                                          image: NetworkImage(
                                            state.review[index].ratedBy?.profileImage ?? kServiceImageNImg,
                                          ),
                                          fit: BoxFit.fill),
                                    ),
                                  ),
                                  title: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          SizedBox(
                                            width: MediaQuery.of(context).size.width * 0.3,
                                            child: Text(
                                              '${state.review[index].ratedBy?.firstName ?? 'Firstname'} ${state.review[index].ratedBy?.lastName ?? 'Lastname'} ',
                                              style: textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.bold),
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                          addHorizontalSpace(8),
                                          WidgetText(
                                            label: '${state.review[index].rating}',
                                            widget: Icon(
                                              Icons.star_rounded,
                                              color: kColorAmber,
                                              size: 16,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Text(
                                        '${state.review[index].review ?? 'review'}',
                                        style: textTheme.bodyMedium,
                                      ),
                                    ],
                                  ),
                                  trailing: Text(
                                    getVerboseDateTimeRepresentation(
                                        DateTime.parse(state.review[index].createdAt ?? DateTime.now().toString())),
                                    style: textTheme.bodySmall?.copyWith(fontSize: 12),
                                  ),
                                );
                        },
                      ),
                    ),
                  ],
                );
              default:
                return SizedBox();
            }
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    _scrollController
      ..removeListener(_onScroll)
      ..dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_isBottom)
      context.read<RatingReviewsBloc>().add(FetchRatingsReviews(id: context.read<RatingReviewsBloc>().state.taskId));
  }

  bool get _isBottom {
    if (!_scrollController.hasClients) return false;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    return currentScroll >= (maxScroll * 0.9);
  }
}
