part of 'offers_bloc.dart';

class OffersState extends Equatable {
  final TheStates? theStates;
  final OfferModel? offerModel;
  OffersState({
    this.theStates = TheStates.initial,
    this.offerModel,
  });

  @override
  List<Object?> get props => [
        theStates,
        offerModel,
      ];

  OffersState copyWith({
    TheStates? theStates,
    OfferModel? offerModel,
  }) {
    return OffersState(
      theStates: theStates ?? this.theStates,
      offerModel: offerModel ?? this.offerModel,
    );
  }
}
