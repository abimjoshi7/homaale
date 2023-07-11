import 'package:freezed_annotation/freezed_annotation.dart';

part 'connected_account.freezed.dart';
part 'connected_account.g.dart';

@freezed
class ConnectedAccount with _$ConnectedAccount {
  const factory ConnectedAccount({
    int? id,
    String? provider,
    String? uid,
    @JsonKey(name: "extra_data") ExtraData? extraData,
    DateTime? created,
    DateTime? modified,
    String? user,
  }) = _ConnectedAccount;

  factory ConnectedAccount.fromJson(Map<String, dynamic> json) =>
      _$ConnectedAccountFromJson(json);
}

@freezed
class ExtraData with _$ExtraData {
  const factory ExtraData({
    String? hd,
    String? aud,
    String? azp,
    int? exp,
    int? iat,
    String? iss,
    String? sub,
    String? name,
    String? email,
    String? locale,
    String? picture,
    @JsonKey(name: "given_name") String? givenName,
    @JsonKey(name: "family_name") String? familyName,
    @JsonKey(name: "email_verifed") bool? emailVerified,
  }) = _ExtraData;

  factory ExtraData.fromJson(Map<String, dynamic> json) =>
      _$ExtraDataFromJson(json);
}
