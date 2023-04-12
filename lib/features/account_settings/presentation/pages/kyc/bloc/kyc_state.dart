part of 'kyc_bloc.dart';

class KycState extends Equatable {
  final TheStates? theStates;
  final KycModel? kycModel;
  final List<KycListRes>? list;
  final int? kycId;
  final bool? isCreated;
  const KycState({
    this.theStates = TheStates.initial,
    this.kycModel,
    this.list,
    this.kycId,
    this.isCreated = null,
  });
  @override
  List<Object?> get props {
    return [
      theStates,
      kycModel,
      list,
      kycId,
      isCreated,
    ];
  }

  KycState copyWith({
    TheStates? theStates,
    KycModel? kycModel,
    List<KycListRes>? list,
    int? kycId,
    bool? isCreated,
  }) {
    return KycState(
      theStates: theStates ?? this.theStates,
      kycModel: kycModel ?? this.kycModel,
      list: list ?? this.list,
      kycId: kycId ?? this.kycId,
      isCreated: isCreated ?? this.isCreated,
    );
  }
}
