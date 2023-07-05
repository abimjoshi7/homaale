import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/features/bookings/presentation/bloc/bookings_bloc.dart';
import 'package:cipher/features/rating_reviews/data/models/rating_request_dto.dart';
import 'package:cipher/features/rating_reviews/presentation/bloc/rating_reviews_bloc.dart';
import 'package:cipher/widgets/widgets.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';

class RatingReviewsForm extends StatefulWidget {
  const RatingReviewsForm({super.key});

  @override
  State<RatingReviewsForm> createState() => _RatingReviewsFormState();
}

class _RatingReviewsFormState extends State<RatingReviewsForm>  {
  bool rating_one_selected = false;
  bool rating_two_selected = false;
  bool rating_three_selected = false;
  bool rating_four_selected = false;
  bool rating_five_selected = false;
  int totalRating = 0;

  bool rating_error = false;
  final ratingController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  void changeRating(int index) {
    setState(() {
      rating_error = false;
      totalRating = index + 1;
    });
    print(totalRating);
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: EdgeInsets.all(16),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomFormField(
                  label: 'Review',
                  child: CustomTextFormField(
                    controller: ratingController,
                    hintText: 'Give some review',
                    hintStyle: textTheme.bodySmall?.copyWith(color: kColorGrey),
                    maxLines: 3,
                  ),
                ),
                addVerticalSpace(8),
                CustomFormField(
                  label: 'Rating',
                  isRequired: true,
                  child: Row(
                    children: List.generate(
                      5,
                      (index) => IconButton(
                        onPressed: () => changeRating(index),
                        selectedIcon: Icon(
                          Icons.star_rate_rounded,
                          color: kColorAmber,
                        ),
                        splashRadius: 4,
                        icon: Icon(
                          totalRating == 0
                              ? Icons.star_border_rounded
                              : index < totalRating
                                  ? Icons.star_rate_rounded
                                  : Icons.star_border_rounded,
                          color: totalRating == 0
                              ? kColorGrey
                              : index < totalRating
                                  ? kColorAmber
                                  : kColorGrey,
                        ),
                      ),
                    ),
                  ),
                ),
                rating_error
                    ? Text(
                        'Rating is required!',
                        style: Theme.of(context)
                            .textTheme
                            .bodySmall
                            ?.copyWith(color: Colors.red[900]),
                      )
                    : SizedBox.shrink(),
                addVerticalSpace(8),
                CustomElevatedButton(
                  callback: () {
                    if (totalRating == 0) {
                      setState(() {
                        rating_error = true;
                      });
                      return;
                    } else {
                      final ratingReqDto = RatingRequestDto(
                        rating: totalRating,
                        review: ratingController.text,
                        task: context.read<BookingsBloc>().state.bookingRes.id,
                      );
                      context.read<RatingReviewsBloc>().add(
                          SubmitRatingReviewEvent(
                              ratingRequestDto: ratingReqDto));
                      Navigator.pop(context);
                    }
                  },
                  label: 'Submit',
                ),
                addVerticalSpace(16),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
