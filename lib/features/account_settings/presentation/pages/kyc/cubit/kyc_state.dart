part of 'kyc_cubit.dart';

abstract class KycState extends Equatable {
  const KycState();
}

class KycInitial extends KycState {
  @override
  List<Object?> get props => [];
}

class KycSuccess extends KycState {
  @override
  List<Object?> get props => [];
}

class KycFailure extends KycState {
  @override
  List<Object?> get props => [];
}
