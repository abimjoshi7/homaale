// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'kyc_bloc.dart';

abstract class KycEvent extends Equatable {
  const KycEvent();
}

class KycInitiated extends KycEvent {
  final CreateKycReq createKycReq;
  const KycInitiated({
    required this.createKycReq,
  });
  @override
  List<Object?> get props => [createKycReq];
}

class KycAdded extends KycEvent {
  final AddKycReq addKycReq;
  const KycAdded({
    required this.addKycReq,
  });
  @override
  List<Object?> get props => [addKycReq];
}

class KycLoaded extends KycEvent {
  @override
  List<Object?> get props => [];
}
