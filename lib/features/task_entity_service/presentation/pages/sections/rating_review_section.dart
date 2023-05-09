import 'package:cipher/core/constants/date_time_representation.dart';
import 'package:cipher/features/rating_reviews/data/models/rating_response_dto.dart';
import 'package:cipher/features/rating_reviews/presentation/rating_reviews.dart';
import 'package:flutter/material.dart';

import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/widgets/widgets.dart';

class RatingReviewSection extends StatelessWidget {
  final bool? canUserWriteReview;
  final RatingResponseDto? reviews;

  const RatingReviewSection({
    Key? key,
    this.canUserWriteReview,
    this.reviews,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: <Widget>[
                          Text(
                            'Rating ',
                            style: Theme.of(context).textTheme.headlineSmall,
                          ),
                          Text('(${reviews?.result?.length ?? 0})')
                        ],
                      ),
                      canUserWriteReview ?? false
                          ? Align(
                              alignment: Alignment.centerLeft,
                              child: TextButton(
                                onPressed: () async {
                                  await showModalBottomSheet(
                                    context: context,
                                    builder: (context) => Column(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                                      children: [
                                        const CustomModalSheetDrawerIcon(),
                                        kHeight10,
                                        const Text(
                                          'Rating & Review',
                                          style: kText17,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(10),
                                          child: Column(
                                            children: const [
                                              CustomFormField(
                                                label: 'Task Description',
                                                isRequired: true,
                                                child: CustomTextFormField(),
                                              ),
                                              CustomFormField(
                                                label: 'Ratings',
                                                isRequired: true,
                                                child: CustomTextFormField(),
                                              ),
                                            ],
                                          ),
                                        ),
                                        CustomElevatedButton(
                                          callback: () {},
                                          label: 'Submit Now',
                                        ),
                                        kHeight20,
                                      ],
                                    ),
                                  );
                                },
                                child: Text(
                                  'Give your review',
                                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                        color: kColorPrimary,
                                        decoration: TextDecoration.underline,
                                      ),
                                ),
                              ),
                            )
                          : SizedBox(),
                    ],
                  ),
                  ListView.builder(
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    itemCount: reviews!.result!.length > 3 ? 3 : reviews!.result!.length,
                    itemBuilder: (context, index) => ListTile(
                      contentPadding: EdgeInsets.zero,
                      leading: Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: NetworkImage(reviews?.result?[index].ratedBy?.profileImage ?? ''),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      title: Text('${reviews?.result?[index].review}'),
                      trailing: Text(
                        getVerboseDateTimeRepresentation(
                            DateTime.parse(reviews?.result?[index].createdAt ?? DateTime.now().toString())),
                        style: kHelper13,
                      ),
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
