part of 'kyc_bloc.dart';

class KycState extends Equatable {
  final TheStates? theStates;
  final KycModel? kycModel;
  final List<KycListRes>? list;
  final int? kycId;
  const KycState({
    this.theStates = TheStates.initial,
    this.kycModel,
    this.list,
    this.kycId,
  });
  @override
  List<Object?> get props => [theStates, kycModel, list, kycId];

  KycState copyWith({
    TheStates? theStates,
    KycModel? kycModel,
    List<KycListRes>? list,
    int? kycId,
  }) {
    return KycState(
      theStates: theStates ?? this.theStates,
      kycModel: kycModel ?? this.kycModel,
      list: list ?? this.list,
      kycId: kycId ?? this.kycId,
    );
  }
}
