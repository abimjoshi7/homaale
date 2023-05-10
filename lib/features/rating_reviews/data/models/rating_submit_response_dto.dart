import 'package:dependencies/dependencies.dart';

part 'rating_submit_response_dto.freezed.dart';
part 'rating_submit_response_dto.g.dart';

@freezed
class RatingSubmitResponseDto with _$RatingSubmitResponseDto {
  const factory RatingSubmitResponseDto({
    String? status,
    String? message,
  }) = _RatingSubmitResponseDto;

  factory RatingSubmitResponseDto.fromJson(Map<String, dynamic> json) => _$RatingSubmitResponseDtoFromJson(json);
}
