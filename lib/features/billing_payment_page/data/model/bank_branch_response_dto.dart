import 'package:dependencies/dependencies.dart';

part 'bank_branch_response_dto.freezed.dart';
part 'bank_branch_response_dto.g.dart';

@freezed
class BankBranchResponseDto with _$BankBranchResponseDto {
  const factory BankBranchResponseDto({
    int? id,
    String? name,
  }) = _BankBranchResponseDto;

  factory BankBranchResponseDto.fromJson(Map<String, dynamic> json) => _$BankBranchResponseDtoFromJson(json);
}
