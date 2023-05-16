import 'package:dependencies/dependencies.dart';

part 'linked_bank_response_dto.freezed.dart';
part 'linked_bank_response_dto.g.dart';

@freezed
class LinkedBankResponseDto with _$LinkedBankResponseDto {
  const factory LinkedBankResponseDto({
    @JsonKey(name: 'total_pages') int? totalPages,
    int? count,
    int? current,
    String? next,
    String? previous,
    @JsonKey(name: 'page_size') int? pageSize,
    @JsonKey(name: 'result') List<LinkedBankDto>? result,
  }) = _LinkedBankResponseDto;

  factory LinkedBankResponseDto.fromJson(Map<String, dynamic> json) => _$LinkedBankResponseDtoFromJson(json);
}

@freezed
class LinkedBankDto with _$LinkedBankDto {
  const factory LinkedBankDto({
    int? id,
    @JsonKey(name: 'bank_name') String? bankName,
    @JsonKey(name: 'branch_name') String? branchName,
    @JsonKey(name: 'is_wallet') bool? isWallet,
    String? logo,
    @JsonKey(name: 'bank_account_name') String? bankAccountName,
    @JsonKey(name: 'bank_account_number') String? bankAccountNumber,
    @JsonKey(name: 'is_primary') bool? isPrimary,
    @JsonKey(name: 'is_verified') bool? isVerified,
  }) = _LinkedBankDto;

  factory LinkedBankDto.fromJson(Map<String, dynamic> json) => _$LinkedBankDtoFromJson(json);
}
