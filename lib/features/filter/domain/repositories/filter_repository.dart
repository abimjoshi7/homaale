import 'package:cipher/core/core.dart';
import 'package:cipher/features/filter/domain/entities/filter_data.dart';
import 'package:cipher/features/filter/domain/usecases/usecases.dart';

abstract class FilterRepository<T> {
  Future<(Failure?, FilterData<T>)> rangeData(RangeParams params);
  Future<(Failure?, FilterData<T>)> searchData(SearchParams params);
  Future<(Failure?, FilterData<T>)> sortData(SortParams params);
}
