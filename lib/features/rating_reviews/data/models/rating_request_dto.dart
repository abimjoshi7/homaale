import 'package:dependencies/dependencies.dart';

part 'rating_request_dto.freezed.dart';
part 'rating_request_dto.g.dart';

@freezed
class RatingRequestDto with _$RatingRequestDto {
  const factory RatingRequestDto({
    int? rating,
    String? task,
    String? review,
  }) = _RatingRequestDto;

  factory RatingRequestDto.fromJson(Map<String, dynamic> json) => _$RatingRequestDtoFromJson(json);
}
