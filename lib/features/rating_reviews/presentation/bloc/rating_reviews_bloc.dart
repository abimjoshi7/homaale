// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';

import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:cipher/features/rating_reviews/data/models/rating_request_dto.dart';
import 'package:dependencies/dependencies.dart';
import 'package:stream_transform/stream_transform.dart';

import 'package:cipher/features/rating_reviews/data/models/rating_response_dto.dart';
import 'package:cipher/features/rating_reviews/data/repositories/rating_reviews_repository.dart';

part 'rating_reviews_event.dart';
part 'rating_reviews_state.dart';

const throttleDuration = Duration(milliseconds: 100);

EventTransformer<E> throttleDroppable<E>(Duration duration) {
  return (events, mapper) {
    return droppable<E>().call(events.throttle(duration), mapper);
  };
}

class RatingReviewsBloc extends Bloc<RatingReviewEvent, RatingReviewState> {
  final RatingReviewsRepositroy repositories;
  RatingReviewsBloc(
    this.repositories,
  ) : super(RatingReviewState()) {
    on<SetToInitial>((event, emit) {
      emit(state.copyWith(status: RatingStatus.initial, hasReachedMax: false));
      add(FetchRatingsReviews(id: event.id));
    });

    on<FetchRatingsReviews>(
      (event, emit) async {
        if (state.hasReachedMax) return;
        try {
          if (state.status == RatingStatus.initial) {
            final ratings = await repositories.fetchRatingReviews(event.id);

            final ratingsList = ratings.result;
            return emit(state.copyWith(
              status: RatingStatus.success,
              taskId: event.id,
              ratingResponseDto: ratings,
              review: ratingsList,
              hasReachedMax: state.ratingResponseDto.current == state.ratingResponseDto.totalPages,
            ));
          }

          if (state.ratingResponseDto.current != state.ratingResponseDto.totalPages) {
            final ratings = await repositories.fetchRatingReviews(event.id, state.ratingResponseDto.current! + 1);
            emit(ratings.result!.isEmpty
                ? state.copyWith(hasReachedMax: true)
                : state.copyWith(
                    status: RatingStatus.success,
                    taskId: event.id,
                    ratingResponseDto: ratings,
                    review: List.of(state.review)..addAll(ratings.result!),
                    hasReachedMax: false,
                  ));
          } else {
            emit(state.copyWith(hasReachedMax: true));
          }
        } catch (_) {
          emit(state.copyWith(status: RatingStatus.failure));
        }
      },
      transformer: throttleDroppable(throttleDuration),
    );

    on<SubmitRatingReviewEvent>((event, emit) async {
      try {
        final res = await repositories.submitRatingReviews(event.ratingRequestDto);

        if (res.status == 'success') {
          emit(state.copyWith(
            ratingSubmitStatus: RatingSubmitStatus.success,
            ratingSubmitMessage: res.message,
          ));
        } else {
          emit(state.copyWith(
            ratingSubmitStatus: RatingSubmitStatus.failure,
            ratingSubmitMessage: res.message,
          ));
        }
      } catch (e) {
        log(e.toString());
        emit(state.copyWith(
          ratingSubmitStatus: RatingSubmitStatus.failure,
          ratingSubmitMessage: 'Error submitting review!',
        ));
      }
    });
  }
}
