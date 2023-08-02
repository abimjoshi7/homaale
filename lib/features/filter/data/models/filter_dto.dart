import 'package:cipher/features/filter/domain/entities/filter_data.dart';
import 'package:dependencies/dependencies.dart';

part 'filter_dto.freezed.dart';
part 'filter_dto.g.dart';

@freezed
class FilterDto<T> with _$FilterDto {
  const FilterDto._();
  const factory FilterDto({
    @Default([]) List<dynamic> dataList,
  }) = _FilterDto;

  factory FilterDto.fromJson(Map<String, dynamic> json) =>
      _$FilterDtoFromJson(json);

  FilterData<dynamic> toEntity() => FilterData<dynamic>(
        dataList: List<dynamic>.from(
          dataList,
        ),
      );
}
