part of 'rating_reviews_bloc.dart';

abstract class RatingReviewEvent extends Equatable {
  const RatingReviewEvent();
}

class SetToInitial extends RatingReviewEvent {
  final String id;
  const SetToInitial({required this.id});
  @override
  List<Object?> get props => [id];
}

class FetchRatingsReviews extends RatingReviewEvent {
  final String id;
  const FetchRatingsReviews({required this.id});
  @override
  List<Object?> get props => [id];
}
