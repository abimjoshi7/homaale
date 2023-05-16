// ignore_for_file: public_member_api_docs, sort_constructors_first

part of 'kyc_bloc.dart';

class KycState extends Equatable {
  final TheStates? theStates;
  final KycModel? kycModel;
  final List<KycListRes>? list;
  final bool? isProfileCreated;
  final bool? isDocCreated;
  final int? kycId;
  final List<Country>? country;
  final List<KycDocType>? docTypeList;
  final String? errMsg;
  final bool? isProfileEdited;
  final bool? isDocEdited;
  final bool? isNewDoc;

  const KycState({
    this.theStates = TheStates.initial,
    this.kycModel,
    this.list,
    this.isProfileCreated,
    this.isDocCreated,
    this.kycId,
    this.country,
    this.docTypeList,
    this.errMsg,
    this.isProfileEdited,
    this.isDocEdited,
    this.isNewDoc = false,
  });

  @override
  List<Object?> get props {
    return [
      theStates,
      kycModel,
      list,
      isProfileCreated,
      isDocCreated,
      kycId,
      country,
      docTypeList,
      errMsg,
      isProfileEdited,
      isDocEdited,
      isNewDoc,
    ];
  }

  KycState copyWith({
    TheStates? theStates,
    KycModel? kycModel,
    List<KycListRes>? list,
    bool? isProfileCreated,
    bool? isDocCreated,
    int? kycId,
    List<Country>? country,
    List<KycDocType>? docTypeList,
    String? errMsg,
    bool? isProfileEdited,
    bool? isDocEdited,
    bool? isNewDoc,
  }) {
    return KycState(
      theStates: theStates ?? this.theStates,
      kycModel: kycModel ?? this.kycModel,
      list: list ?? this.list,
      isProfileCreated: isProfileCreated ?? this.isProfileCreated,
      isDocCreated: isDocCreated ?? this.isDocCreated,
      kycId: kycId ?? this.kycId,
      country: country ?? this.country,
      docTypeList: docTypeList ?? this.docTypeList,
      errMsg: errMsg ?? this.errMsg,
      isProfileEdited: isProfileEdited ?? this.isProfileEdited,
      isDocEdited: isDocEdited ?? this.isDocEdited,
      isNewDoc: isNewDoc ?? this.isNewDoc,
    );
  }
}
