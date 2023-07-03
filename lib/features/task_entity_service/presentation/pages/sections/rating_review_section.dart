import 'package:cipher/core/constants/date_time_representation.dart';
import 'package:cipher/features/rating_reviews/data/models/rating_response_dto.dart';
import 'package:cipher/features/rating_reviews/presentation/bloc/rating_reviews_bloc.dart';
import 'package:cipher/features/rating_reviews/presentation/rating_reviews.dart';
import 'package:cipher/features/user/presentation/bloc/user/user_bloc.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';

import 'package:cipher/core/constants/constants.dart';

class RatingReviewSection extends StatefulWidget {
  final bool? canUserWriteReview;
  final RatingResponseDto? reviews;

  const RatingReviewSection({
    Key? key,
    this.canUserWriteReview,
    this.reviews,
  }) : super(key: key);

  @override
  State<RatingReviewSection> createState() => _RatingReviewSectionState();
}

class _RatingReviewSectionState extends State<RatingReviewSection> {
  bool replyPressed = false;
  int toReplyId = 0;

  final replyController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    replyController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context);
    return Column(
      children: <Widget>[
        ExpansionTile(
          tilePadding: EdgeInsets.zero,
          title: Row(
            children: const [
              Icon(
                Icons.star_border_outlined,
                size: 15,
              ),
              kWidth10,
              Text('Ratings & Reviews'),
            ],
          ),
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      Text(
                        'Rating ',
                        style: textTheme.textTheme.headlineSmall,
                      ),
                      Text('(${widget.reviews?.result?.length ?? 0})')
                    ],
                  ),
                  ListView.builder(
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    itemCount: widget.reviews!.result!.length > 3 ? 3 : widget.reviews!.result!.length,
                    itemBuilder: (context, index) => Column(
                      children: [
                        ListTile(
                          contentPadding: EdgeInsets.zero,
                          horizontalTitleGap: 8,
                          leading: Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                image: NetworkImage(widget.reviews?.result?[index].ratedBy?.profileImage ?? ''),
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                          title: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '${StringUtils.capitalize(widget.reviews?.result?[index].ratedBy?.fullName ?? '')}',
                                overflow: TextOverflow.ellipsis,
                              ),
                              Text(
                                '${widget.reviews?.result?[index].review}',
                                style: textTheme.textTheme.displaySmall,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                          trailing: Text(
                            getVerboseDateTimeRepresentation(
                                DateTime.parse(widget.reviews?.result?[index].createdAt ?? DateTime.now().toString())),
                            style: kHelper13,
                          ),
                        ),
                        replyPressed && toReplyId == widget.reviews?.result?[index].id
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
                                          context.read<UserBloc>().state.taskerProfile?.profileImage ?? kHomaaleImg),
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                                title: SizedBox(
                                  child: Form(
                                    key: _formKey,
                                    child: TextFormField(
                                      controller: replyController,
                                      style: textTheme.textTheme.displaySmall,
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
                                                  id: widget.reviews?.result?[index].id ?? 0,
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
                            : widget.reviews?.result?[index].reply == null || widget.reviews?.result?[index].reply == ''
                                ? Align(
                                    alignment: Alignment.centerRight,
                                    child: TextButton(
                                      onPressed: () => setState(() {
                                        replyPressed = true;
                                        toReplyId = widget.reviews?.result?[index].id ?? 0;
                                      }),
                                      child: Text('Reply'),
                                    ),
                                  )
                                : ListTile(
                                    contentPadding: EdgeInsets.only(left: 15),
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
                                          '${widget.reviews?.result?[index].reply}',
                                          style: textTheme.textTheme.displaySmall,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ],
                                    ),
                                    trailing: Text(
                                      getVerboseDateTimeRepresentation(DateTime.parse(
                                          widget.reviews?.result?[index].repliedDate ?? DateTime.now().toString())),
                                      style: kHelper13,
                                    ),
                                  )
                      ],
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, RatingReviewsPage.routeName);
                    },
                    child: Text(
                      'See all review',
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: kColorPrimary,
                          ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
