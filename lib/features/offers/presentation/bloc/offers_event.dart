part of 'offers_bloc.dart';

abstract class OffersEvent extends Equatable {
  const OffersEvent();
}

class OfferListLoaded extends OffersEvent {
  @override
  List<Object?> get props => [];
}
