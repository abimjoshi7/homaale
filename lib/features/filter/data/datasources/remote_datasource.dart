import 'package:cipher/core/app/api_end_points.dart';
import 'package:cipher/core/core.dart';
import 'package:cipher/features/filter/data/models/filter_dto.dart';
import 'package:cipher/features/filter/domain/usecases/usecases.dart';
import 'package:dependencies/dependencies.dart';

abstract class RemoteDataSource {
  Future<(Failure?, FilterDto)> fetchSearch(SearchParams params);
  Future<(Failure?, FilterDto)> fetchRange(RangeParams params);
  Future<(Failure?, FilterDto)> fetchSort(SortParams params);
}

class RemoteDataSourceImpl implements RemoteDataSource {
  final _dio = Dio();
  @override
  Future<(Failure?, FilterDto)> fetchRange(RangeParams params) async {
    final response = await _dio.post(baseIP, queryParameters: {
      "start": params.startValue,
      "end": params.endValue,
    });

    if (response.statusCode != 200) {}

    return (null, FilterDto.fromJson(response as Map<String, dynamic>));
  }

  @override
  Future<(Failure, FilterDto)> fetchSearch(SearchParams params) {
    // TODO: implement fetchSearch
    throw UnimplementedError();
  }

  @override
  Future<(Failure, FilterDto)> fetchSort(SortParams params) {
    // TODO: implement fetchSort
    throw UnimplementedError();
  }
}
