// ignore_for_file: public_member_api_docs, sort_constructors_first

part of 'kyc_bloc.dart';

class KycState extends Equatable {
  final TheStates? theStates;
  final KycModel? kycModel;
  final List<KycListRes>? list;
  final int? kycId;
  final bool? isCreated;
  final bool? isDocLoaded;
  final List<Country>? country;
  final List<KycDocType>? docTypeList;
  final String? errMsg;
  const KycState({
    this.theStates,
    this.kycModel,
    this.list,
    this.kycId,
    this.isCreated = null,
    this.isDocLoaded = false,
    this.country,
    this.docTypeList,
    this.errMsg,
  });

  @override
  List<Object?> get props {
    return [
      theStates,
      kycModel,
      list,
      kycId,
      isCreated,
      isDocLoaded,
      country,
      docTypeList,
      errMsg,
    ];
  }

  KycState copyWith({
    TheStates? theStates,
    KycModel? kycModel,
    List<KycListRes>? list,
    int? kycId,
    bool? isCreated,
    bool? isDocLoaded,
    List<Country>? country,
    List<KycDocType>? docTypeList,
    String? errMsg,
  }) {
    return KycState(
      theStates: theStates ?? this.theStates,
      kycModel: kycModel ?? this.kycModel,
      list: list ?? this.list,
      kycId: kycId ?? this.kycId,
      isCreated: isCreated ?? this.isCreated,
      isDocLoaded: isDocLoaded ?? this.isDocLoaded,
      country: country ?? this.country,
      docTypeList: docTypeList ?? this.docTypeList,
      errMsg: errMsg ?? this.errMsg,
    );
  }
}
