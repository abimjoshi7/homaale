import 'package:cipher/core/constants/colors.dart';
import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/core/constants/date_time_representation.dart';
import 'package:cipher/core/constants/dimensions.dart';
import 'package:cipher/core/constants/strings.dart';
import 'package:cipher/features/rating_reviews/presentation/bloc/rating_reviews_bloc.dart';
import 'package:cipher/features/user/presentation/bloc/user/user_bloc.dart';
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
  bool replyPressed = false;
  int toReplyId = 0;

  final replyController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

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
      appBar: CustomAppBar(appBarTitle: 'Rating & Reviews', trailingWidget: SizedBox()),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: BlocBuilder<RatingReviewsBloc, RatingReviewState>(
          builder: (context, state) {
            switch (state.status) {
              case RatingStatus.success:
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
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
                              : Column(
                                  children: [
                                    ListTile(
                                      contentPadding: EdgeInsets.zero,
                                      horizontalTitleGap: 4,
                                      leading: Container(
                                        height: 80,
                                        width: 80,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          image: DecorationImage(
                                              image: NetworkImage(
                                                state.review[index].ratedBy?.profileImage ?? kHomaaleImg,
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
                                                  '${StringUtils.capitalize(state.review[index].ratedBy?.fullName ?? '')} ',
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
                                    ),
                                    replyPressed && toReplyId == state.review[index].id
                                        ? ListTile(
                                            contentPadding: EdgeInsets.zero,
                                            horizontalTitleGap: 0,
                                            leading: Container(
                                              height: 30,
                                              width: 30,
                                              decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                image: DecorationImage(
                                                  image: NetworkImage(
                                                      context.read<UserBloc>().state.taskerProfile?.profileImage ??
                                                          kHomaaleImg),
                                                  fit: BoxFit.fill,
                                                ),
                                              ),
                                            ),
                                            title: SizedBox(
                                              child: Form(
                                                key: _formKey,
                                                child: TextFormField(
                                                  controller: replyController,
                                                  style: textTheme.displaySmall,
                                                  validator: (value) {
                                                    if (value == '') {
                                                      return 'Required field.';
                                                    } else {
                                                      return null;
                                                    }
                                                  },
                                                  decoration: InputDecoration(
                                                    hintText: 'Write a reply',
                                                    border: OutlineInputBorder(),
                                                    suffixIcon: IconButton(
                                                      onPressed: () {
                                                        if (_formKey.currentState!.validate()) {
                                                          context.read<RatingReviewsBloc>().add(PatchReplyReviewEvent(
                                                              id: state.review[index].id ?? 0,
                                                              reply: replyController.text.trim()));
                                                          setState(() {
                                                            replyPressed = false;
                                                            replyController.clear();
                                                          });
                                                        }
                                                      },
                                                      icon: Icon(Icons.send),
                                                      iconSize: 16,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          )
                                        : state.review[index].reply == null || state.review[index].reply == ''
                                            ? Align(
                                                alignment: Alignment.centerRight,
                                                child: TextButton(
                                                  onPressed: () => setState(() {
                                                    replyPressed = true;
                                                    toReplyId = state.review[index].id ?? 0;
                                                  }),
                                                  child: Text('Reply'),
                                                ),
                                              )
                                            : ListTile(
                                                contentPadding: EdgeInsets.only(left: 30),
                                                horizontalTitleGap: 0,
                                                leading: Container(
                                                  height: 30,
                                                  width: 30,
                                                  decoration: BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    image: DecorationImage(
                                                      image: NetworkImage(
                                                          context.read<UserBloc>().state.taskerProfile?.profileImage ??
                                                              kHomaaleImg),
                                                      fit: BoxFit.fill,
                                                    ),
                                                  ),
                                                ),
                                                title: Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      '${StringUtils.capitalize(context.read<UserBloc>().state.taskerProfile?.user?.fullName ?? '')}',
                                                      overflow: TextOverflow.ellipsis,
                                                    ),
                                                    Text(
                                                      '${state.review[index].reply}',
                                                      style: textTheme.displaySmall,
                                                      overflow: TextOverflow.ellipsis,
                                                    ),
                                                  ],
                                                ),
                                                trailing: Text(
                                                  getVerboseDateTimeRepresentation(DateTime.parse(
                                                      state.review[index].repliedDate ?? DateTime.now().toString())),
                                                  style: kHelper13,
                                                ),
                                              )
                                  ],
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
