// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'kyc_bloc.dart';

abstract class KycEvent extends Equatable {
  const KycEvent();
}

class KycInitiated extends KycEvent {
  final CreateKycReq? createKycReq;
  const KycInitiated({
    this.createKycReq,
  });
  @override
  List<Object?> get props => [
        createKycReq,
      ];
}

class KycAdded extends KycEvent {
  final AddKycReq? addKycReq;

  const KycAdded({
    this.addKycReq,
  });
  @override
  List<Object?> get props => [
        addKycReq,
      ];
}

class KycModelLoaded extends KycEvent {
  @override
  List<Object?> get props => [];
}

class KycModelDeleted extends KycEvent {
  @override
  List<Object?> get props => [];
}

class KycDocumentLoaded extends KycEvent {
  @override
  List<Object?> get props => [];
}
