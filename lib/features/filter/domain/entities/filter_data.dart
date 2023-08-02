import 'package:dependencies/dependencies.dart';

part 'filter_data.freezed.dart';

@freezed
class FilterData<T> with _$FilterData {
  const FilterData._();
  const factory FilterData({
    @Default([]) List<T> dataList,
  }) = _FilterData;
}
