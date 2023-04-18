// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';

import 'package:dependencies/dependencies.dart';

import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/features/offers/data/models/offer_model.dart';
import 'package:cipher/features/offers/data/repositories/offer_repository.dart';

part 'offers_event.dart';
part 'offers_state.dart';

class OffersBloc extends Bloc<OffersEvent, OffersState> {
  final OfferRepository repo;
  OffersBloc(
    this.repo,
  ) : super(OffersState()) {
    on<OffersEvent>(
      (event, emit) async {
        try {
          emit(
            state.copyWith(
              theStates: TheStates.loading,
            ),
          );
          await repo.fetchOffers().then(
                (value) => emit(
                  state.copyWith(
                    theStates: TheStates.success,
                    offerModel: OfferModel.fromJson(value),
                  ),
                ),
              );
        } catch (e) {
          log("Offer Error: $e");
          emit(
            state.copyWith(
              theStates: TheStates.failure,
            ),
          );
        }
      },
    );
  }
}
