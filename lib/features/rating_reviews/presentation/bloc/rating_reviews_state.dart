part of 'rating_reviews_bloc.dart';

enum RatingStatus { initial, success, failure }

class RatingReviewState extends Equatable {
  final RatingStatus status;
  final String taskId;
  final List<Result> review;
  final bool hasReachedMax;
  final RatingResponseDto ratingResponseDto;
  RatingReviewState({
    this.status = RatingStatus.initial,
    this.review = const [],
    this.hasReachedMax = false,
    this.ratingResponseDto = const RatingResponseDto(),
    this.taskId = '',
  });

  @override
  List<Object> get props => [review, hasReachedMax, ratingResponseDto, status, taskId];

  RatingReviewState copyWith({
    List<Result>? review,
    bool? hasReachedMax,
    RatingResponseDto? ratingResponseDto,
    RatingStatus? status,
    String? taskId,
  }) {
    return RatingReviewState(
      review: review ?? this.review,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
      ratingResponseDto: ratingResponseDto ?? this.ratingResponseDto,
      status: status ?? this.status,
      taskId: taskId ?? this.taskId,
    );
  }
}
