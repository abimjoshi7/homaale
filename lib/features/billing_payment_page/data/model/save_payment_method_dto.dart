import 'package:dependencies/dependencies.dart';

part 'save_payment_method_dto.freezed.dart';
part 'save_payment_method_dto.g.dart';

@freezed
class SavePaymentMethodDto with _$SavePaymentMethodDto {
  const factory SavePaymentMethodDto({
    String? bankAccountName,
    String? bankAccountNumber,
    bool? isPrimary,
    int? bankName,
    int? branchName,
  }) = _SavePaymentMethodDto;

  factory SavePaymentMethodDto.fromJson(Map<String, dynamic> json) => _$SavePaymentMethodDtoFromJson(json);
}
