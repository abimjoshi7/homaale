import 'package:cipher/core/error/failure.dart';
import 'package:cipher/features/filter/data/datasources/datasources.dart';
import 'package:cipher/features/filter/domain/entities/filter_data.dart';
import 'package:cipher/features/filter/domain/repositories/filter_repository.dart';
import 'package:cipher/features/filter/domain/usecases/range_data_usecase.dart';
import 'package:cipher/features/filter/domain/usecases/search_data_usecase.dart';
import 'package:cipher/features/filter/domain/usecases/sort_data_usecase.dart';

class FilterRepositoryImpl implements FilterRepository {
  final RemoteDataSource _remoteDataSource;

  FilterRepositoryImpl(this._remoteDataSource);
  @override
  Future<(Failure?, FilterData)> rangeData(RangeParams params) async {
    // TODO: implement rangeData
    final x = await _remoteDataSource.fetchRange(params);
    return (x.$1, x.$2.toEntity());
  }

  @override
  Future<(Failure?, FilterData)> searchData(SearchParams params) {
    // TODO: implement searchData
    throw UnimplementedError();
  }

  @override
  Future<(Failure?, FilterData)> sortData(SortParams params) {
    // TODO: implement sortData
    throw UnimplementedError();
  }
}
