// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'kyc_list_res.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

KycListRes _$KycListResFromJson(Map<String, dynamic> json) {
  return _KycListRes.fromJson(json);
}

/// @nodoc
mixin _$KycListRes {
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: "created_at")
  DateTime? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: "updated_at")
  DateTime? get updatedAt => throw _privateConstructorUsedError;
  @JsonKey(name: "document_type")
  int? get documentType => throw _privateConstructorUsedError;
  @JsonKey(name: "document_id")
  String? get documentId => throw _privateConstructorUsedError;
  String? get file => throw _privateConstructorUsedError;
  @JsonKey(name: "issuer_organization")
  String? get issuerOrganization => throw _privateConstructorUsedError;
  @JsonKey(name: "issued_date")
  DateTime? get issuedDate => throw _privateConstructorUsedError;
  @JsonKey(name: "valid_through")
  DateTime? get validThrough => throw _privateConstructorUsedError;
  @JsonKey(name: "is_verified")
  bool? get isVerified => throw _privateConstructorUsedError;
  @JsonKey(name: "is_company")
  bool? get isCompany => throw _privateConstructorUsedError;
  String? get comment => throw _privateConstructorUsedError;
  int? get kyc => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $KycListResCopyWith<KycListRes> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $KycListResCopyWith<$Res> {
  factory $KycListResCopyWith(
          KycListRes value, $Res Function(KycListRes) then) =
      _$KycListResCopyWithImpl<$Res, KycListRes>;
  @useResult
  $Res call(
      {int? id,
      @JsonKey(name: "created_at") DateTime? createdAt,
      @JsonKey(name: "updated_at") DateTime? updatedAt,
      @JsonKey(name: "document_type") int? documentType,
      @JsonKey(name: "document_id") String? documentId,
      String? file,
      @JsonKey(name: "issuer_organization") String? issuerOrganization,
      @JsonKey(name: "issued_date") DateTime? issuedDate,
      @JsonKey(name: "valid_through") DateTime? validThrough,
      @JsonKey(name: "is_verified") bool? isVerified,
      @JsonKey(name: "is_company") bool? isCompany,
      String? comment,
      int? kyc});
}

/// @nodoc
class _$KycListResCopyWithImpl<$Res, $Val extends KycListRes>
    implements $KycListResCopyWith<$Res> {
  _$KycListResCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? documentType = freezed,
    Object? documentId = freezed,
    Object? file = freezed,
    Object? issuerOrganization = freezed,
    Object? issuedDate = freezed,
    Object? validThrough = freezed,
    Object? isVerified = freezed,
    Object? isCompany = freezed,
    Object? comment = freezed,
    Object? kyc = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      documentType: freezed == documentType
          ? _value.documentType
          : documentType // ignore: cast_nullable_to_non_nullable
              as int?,
      documentId: freezed == documentId
          ? _value.documentId
          : documentId // ignore: cast_nullable_to_non_nullable
              as String?,
      file: freezed == file
          ? _value.file
          : file // ignore: cast_nullable_to_non_nullable
              as String?,
      issuerOrganization: freezed == issuerOrganization
          ? _value.issuerOrganization
          : issuerOrganization // ignore: cast_nullable_to_non_nullable
              as String?,
      issuedDate: freezed == issuedDate
          ? _value.issuedDate
          : issuedDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      validThrough: freezed == validThrough
          ? _value.validThrough
          : validThrough // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      isVerified: freezed == isVerified
          ? _value.isVerified
          : isVerified // ignore: cast_nullable_to_non_nullable
              as bool?,
      isCompany: freezed == isCompany
          ? _value.isCompany
          : isCompany // ignore: cast_nullable_to_non_nullable
              as bool?,
      comment: freezed == comment
          ? _value.comment
          : comment // ignore: cast_nullable_to_non_nullable
              as String?,
      kyc: freezed == kyc
          ? _value.kyc
          : kyc // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_KycListResCopyWith<$Res>
    implements $KycListResCopyWith<$Res> {
  factory _$$_KycListResCopyWith(
          _$_KycListRes value, $Res Function(_$_KycListRes) then) =
      __$$_KycListResCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      @JsonKey(name: "created_at") DateTime? createdAt,
      @JsonKey(name: "updated_at") DateTime? updatedAt,
      @JsonKey(name: "document_type") int? documentType,
      @JsonKey(name: "document_id") String? documentId,
      String? file,
      @JsonKey(name: "issuer_organization") String? issuerOrganization,
      @JsonKey(name: "issued_date") DateTime? issuedDate,
      @JsonKey(name: "valid_through") DateTime? validThrough,
      @JsonKey(name: "is_verified") bool? isVerified,
      @JsonKey(name: "is_company") bool? isCompany,
      String? comment,
      int? kyc});
}

/// @nodoc
class __$$_KycListResCopyWithImpl<$Res>
    extends _$KycListResCopyWithImpl<$Res, _$_KycListRes>
    implements _$$_KycListResCopyWith<$Res> {
  __$$_KycListResCopyWithImpl(
      _$_KycListRes _value, $Res Function(_$_KycListRes) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? documentType = freezed,
    Object? documentId = freezed,
    Object? file = freezed,
    Object? issuerOrganization = freezed,
    Object? issuedDate = freezed,
    Object? validThrough = freezed,
    Object? isVerified = freezed,
    Object? isCompany = freezed,
    Object? comment = freezed,
    Object? kyc = freezed,
  }) {
    return _then(_$_KycListRes(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      documentType: freezed == documentType
          ? _value.documentType
          : documentType // ignore: cast_nullable_to_non_nullable
              as int?,
      documentId: freezed == documentId
          ? _value.documentId
          : documentId // ignore: cast_nullable_to_non_nullable
              as String?,
      file: freezed == file
          ? _value.file
          : file // ignore: cast_nullable_to_non_nullable
              as String?,
      issuerOrganization: freezed == issuerOrganization
          ? _value.issuerOrganization
          : issuerOrganization // ignore: cast_nullable_to_non_nullable
              as String?,
      issuedDate: freezed == issuedDate
          ? _value.issuedDate
          : issuedDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      validThrough: freezed == validThrough
          ? _value.validThrough
          : validThrough // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      isVerified: freezed == isVerified
          ? _value.isVerified
          : isVerified // ignore: cast_nullable_to_non_nullable
              as bool?,
      isCompany: freezed == isCompany
          ? _value.isCompany
          : isCompany // ignore: cast_nullable_to_non_nullable
              as bool?,
      comment: freezed == comment
          ? _value.comment
          : comment // ignore: cast_nullable_to_non_nullable
              as String?,
      kyc: freezed == kyc
          ? _value.kyc
          : kyc // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_KycListRes implements _KycListRes {
  const _$_KycListRes(
      {this.id,
      @JsonKey(name: "created_at") this.createdAt,
      @JsonKey(name: "updated_at") this.updatedAt,
      @JsonKey(name: "document_type") this.documentType,
      @JsonKey(name: "document_id") this.documentId,
      this.file,
      @JsonKey(name: "issuer_organization") this.issuerOrganization,
      @JsonKey(name: "issued_date") this.issuedDate,
      @JsonKey(name: "valid_through") this.validThrough,
      @JsonKey(name: "is_verified") this.isVerified,
      @JsonKey(name: "is_company") this.isCompany,
      this.comment,
      this.kyc});

  factory _$_KycListRes.fromJson(Map<String, dynamic> json) =>
      _$$_KycListResFromJson(json);

  @override
  final int? id;
  @override
  @JsonKey(name: "created_at")
  final DateTime? createdAt;
  @override
  @JsonKey(name: "updated_at")
  final DateTime? updatedAt;
  @override
  @JsonKey(name: "document_type")
  final int? documentType;
  @override
  @JsonKey(name: "document_id")
  final String? documentId;
  @override
  final String? file;
  @override
  @JsonKey(name: "issuer_organization")
  final String? issuerOrganization;
  @override
  @JsonKey(name: "issued_date")
  final DateTime? issuedDate;
  @override
  @JsonKey(name: "valid_through")
  final DateTime? validThrough;
  @override
  @JsonKey(name: "is_verified")
  final bool? isVerified;
  @override
  @JsonKey(name: "is_company")
  final bool? isCompany;
  @override
  final String? comment;
  @override
  final int? kyc;

  @override
  String toString() {
    return 'KycListRes(id: $id, createdAt: $createdAt, updatedAt: $updatedAt, documentType: $documentType, documentId: $documentId, file: $file, issuerOrganization: $issuerOrganization, issuedDate: $issuedDate, validThrough: $validThrough, isVerified: $isVerified, isCompany: $isCompany, comment: $comment, kyc: $kyc)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_KycListRes &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.documentType, documentType) ||
                other.documentType == documentType) &&
            (identical(other.documentId, documentId) ||
                other.documentId == documentId) &&
            (identical(other.file, file) || other.file == file) &&
            (identical(other.issuerOrganization, issuerOrganization) ||
                other.issuerOrganization == issuerOrganization) &&
            (identical(other.issuedDate, issuedDate) ||
                other.issuedDate == issuedDate) &&
            (identical(other.validThrough, validThrough) ||
                other.validThrough == validThrough) &&
            (identical(other.isVerified, isVerified) ||
                other.isVerified == isVerified) &&
            (identical(other.isCompany, isCompany) ||
                other.isCompany == isCompany) &&
            (identical(other.comment, comment) || other.comment == comment) &&
            (identical(other.kyc, kyc) || other.kyc == kyc));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      createdAt,
      updatedAt,
      documentType,
      documentId,
      file,
      issuerOrganization,
      issuedDate,
      validThrough,
      isVerified,
      isCompany,
      comment,
      kyc);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_KycListResCopyWith<_$_KycListRes> get copyWith =>
      __$$_KycListResCopyWithImpl<_$_KycListRes>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_KycListResToJson(
      this,
    );
  }
}

abstract class _KycListRes implements KycListRes {
  const factory _KycListRes(
      {final int? id,
      @JsonKey(name: "created_at") final DateTime? createdAt,
      @JsonKey(name: "updated_at") final DateTime? updatedAt,
      @JsonKey(name: "document_type") final int? documentType,
      @JsonKey(name: "document_id") final String? documentId,
      final String? file,
      @JsonKey(name: "issuer_organization") final String? issuerOrganization,
      @JsonKey(name: "issued_date") final DateTime? issuedDate,
      @JsonKey(name: "valid_through") final DateTime? validThrough,
      @JsonKey(name: "is_verified") final bool? isVerified,
      @JsonKey(name: "is_company") final bool? isCompany,
      final String? comment,
      final int? kyc}) = _$_KycListRes;

  factory _KycListRes.fromJson(Map<String, dynamic> json) =
      _$_KycListRes.fromJson;

  @override
  int? get id;
  @override
  @JsonKey(name: "created_at")
  DateTime? get createdAt;
  @override
  @JsonKey(name: "updated_at")
  DateTime? get updatedAt;
  @override
  @JsonKey(name: "document_type")
  int? get documentType;
  @override
  @JsonKey(name: "document_id")
  String? get documentId;
  @override
  String? get file;
  @override
  @JsonKey(name: "issuer_organization")
  String? get issuerOrganization;
  @override
  @JsonKey(name: "issued_date")
  DateTime? get issuedDate;
  @override
  @JsonKey(name: "valid_through")
  DateTime? get validThrough;
  @override
  @JsonKey(name: "is_verified")
  bool? get isVerified;
  @override
  @JsonKey(name: "is_company")
  bool? get isCompany;
  @override
  String? get comment;
  @override
  int? get kyc;
  @override
  @JsonKey(ignore: true)
  _$$_KycListResCopyWith<_$_KycListRes> get copyWith =>
      throw _privateConstructorUsedError;
}
