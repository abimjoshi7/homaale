import 'dart:developer';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:cipher/core/constants/enums.dart';
import 'package:cipher/features/redeem/data/repo/redeem_repository.dart';
import 'package:cipher/features/redeem/presentation/bloc/redeem.event.dart';
import 'package:cipher/features/redeem/presentation/bloc/redeem.state.dart';
import 'package:dependencies/dependencies.dart';
import 'package:stream_transform/stream_transform.dart';

import '../../data/models/redeem_items_detail.dart';

const throttleDuration = Duration(milliseconds: 100);

EventTransformer<E> throttleDroppable<E>(Duration duration) {
  return (events, mapper) {
    return droppable<E>().call(events.throttle(duration), mapper);
  };
}

class RedeemBloc extends Bloc<RedeemEvent, RedeemState> {
  final RedeemRepositories repositories;
  RedeemBloc(
    this.repositories,
  ) : super(RedeemState()) {
    on<SetToInitial>((event, emit) {
      emit(state.copyWith(status: RedeemStatus.initial, hasReachedMax: false));
      add(FetchRedeemList(offerType: event.offerType));
    });
    on<FetchRedeemList>(
      (event, emit) async {
        if (state.hasReachedMax) return;
        try {
          if (state.status == RedeemStatus.initial) {
            final redeem = await repositories.fetchRedeemList(event.offerType);
            final redeemList = redeem.result;
            return emit(state.copyWith(
              status: RedeemStatus.success,
              redeem: redeemList,
              redeemList: redeem,
              hasReachedMax:
                  state.redeemList.current == state.redeemList.totalPages,
            ));
          }
          if (state.redeemList.current != state.redeemList.totalPages) {
            final redeem = await repositories.fetchRedeemList(
                event.offerType, state.redeemList.current! + 1);
            emit(redeem.result!.isEmpty
                ? state.copyWith(hasReachedMax: true)
                : state.copyWith(
                    status: RedeemStatus.success,
                    redeemList: redeem,
                    redeem: List.of(state.redeem)..addAll(redeem.result!),
                    hasReachedMax: false,
                  ));
          } else {
            emit(state.copyWith(hasReachedMax: true));
          }
        } catch (_) {
          emit(state.copyWith(status: RedeemStatus.failure));
        }
      },
      transformer: throttleDroppable(throttleDuration),
    );

    on<RedeemItemsDetails>((event, emit) async {
      try {
        emit(
          state.copyWith(theStates: TheStates.initial),
        );
        final service =
            await repositories.fetchRedeemItemDetails(event.redeemId);
        final entityService = service.entityServices;
        return emit(state.copyWith(
          status: RedeemStatus.success,
          entityService: entityService,
          redeemItemsDetail: service,
        ));
      } catch (e) {
        emit(
          state.copyWith(theStates: TheStates.failure),
        );
      }
    });

    on<SubmitRedeemEvent>((event, emit) async {
      try {
        final res = await repositories.submitRedeem(event.redeemID);

        if (res.status == 'success') {
          emit(state.copyWith(
            redeemSubmitStatus: RedeemSubmitStatus.success,
            redeemSubmitMessage: res.message,
          ));
        } else {
          emit(state.copyWith(
            redeemSubmitStatus: RedeemSubmitStatus.failure,
            redeemSubmitMessage: res.message,
          ));
        }
      } catch (e) {
        log(e.toString());
        emit(state.copyWith(
          redeemSubmitStatus: RedeemSubmitStatus.failure,
          redeemSubmitMessage: 'Error submitting redeem',
        ));
      }
    });
  }
}
