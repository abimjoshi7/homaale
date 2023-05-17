import 'package:dependencies/dependencies.dart';

part 'withdraw_req_res_dto.freezed.dart';
part 'withdraw_req_res_dto.g.dart';

@freezed
class WithdrawReqResDto with _$WithdrawReqResDto {
  const factory WithdrawReqResDto({
    String? amount,
    @JsonKey(name: 'bank_account') int? bankAccount,
    String? description,
  }) = _WithdrawReqResDto;

  factory WithdrawReqResDto.fromJson(Map<String, dynamic> json) => _$WithdrawReqResDtoFromJson(json);
}
