import 'package:dependencies/dependencies.dart';

part 'bank_names_response_dto.freezed.dart';
part 'bank_names_response_dto.g.dart';

@freezed
class BankNamesResponseDto with _$BankNamesResponseDto {
  const factory BankNamesResponseDto({
    int? id,
    String? name,
    @JsonKey(name: 'is_wallet') bool? isWallet,
  }) = _BankNamesResponseDto;

  factory BankNamesResponseDto.fromJson(Map<String, dynamic> json) => _$BankNamesResponseDtoFromJson(json);
}
