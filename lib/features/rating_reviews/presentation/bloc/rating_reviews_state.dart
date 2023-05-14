part of 'rating_reviews_bloc.dart';

enum RatingStatus { initial, success, failure }

enum RatingSubmitStatus { initial, success, failure }

class RatingReviewState extends Equatable {
  final RatingStatus status;
  final String taskId;
  final List<Result> review;
  final bool hasReachedMax;
  final RatingResponseDto ratingResponseDto;
  final RatingSubmitStatus ratingSubmitStatus;
  final String ratingSubmitMessage;
  RatingReviewState({
    this.status = RatingStatus.initial,
    this.review = const [],
    this.hasReachedMax = false,
    this.ratingResponseDto = const RatingResponseDto(),
    this.taskId = '',
    this.ratingSubmitStatus = RatingSubmitStatus.initial,
    this.ratingSubmitMessage = '',
  });

  @override
  List<Object> get props => [
        review,
        hasReachedMax,
        ratingResponseDto,
        status,
        taskId,
        ratingSubmitStatus,
        ratingSubmitMessage,
      ];

  RatingReviewState copyWith({
    List<Result>? review,
    bool? hasReachedMax,
    RatingResponseDto? ratingResponseDto,
    RatingStatus? status,
    String? taskId,
    RatingSubmitStatus? ratingSubmitStatus,
    String? ratingSubmitMessage,
  }) {
    return RatingReviewState(
      review: review ?? this.review,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
      ratingResponseDto: ratingResponseDto ?? this.ratingResponseDto,
      status: status ?? this.status,
      taskId: taskId ?? this.taskId,
      ratingSubmitStatus: ratingSubmitStatus ?? this.ratingSubmitStatus,
      ratingSubmitMessage: ratingSubmitMessage ?? this.ratingSubmitMessage,
    );
  }
}
