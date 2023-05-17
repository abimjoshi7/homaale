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

class KycProfileInitiated extends KycEvent {
  @override
  List<Object?> get props => [];
}

class KycProfileEditLoaded extends KycEvent {
  final Map<String, dynamic>? editKycReq;
  KycProfileEditLoaded({
    this.editKycReq,
  });
  @override
  List<Object?> get props => [editKycReq];
}

class KycDocEditInitiated extends KycEvent {
  final int? kycId;
  KycDocEditInitiated({
    this.kycId,
  });
  @override
  List<Object?> get props => [kycId];
}

class KycDocEditLoaded extends KycEvent {
  final int id;
  final Map<String, dynamic>? editDocReq;
  KycDocEditLoaded({
    required this.id,
    this.editDocReq,
  });
  @override
  List<Object?> get props => [id, editDocReq];
}

class KycAddNewDocInitiated extends KycEvent {
  @override
  List<Object?> get props => [];
}

class KycAddNewDocCancel extends KycEvent {
  @override
  List<Object?> get props => [];
}
