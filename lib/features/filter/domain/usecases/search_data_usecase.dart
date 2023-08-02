import 'package:cipher/core/error/error.dart';
import 'package:cipher/core/usecase/usecase.dart';
import 'package:cipher/features/filter/domain/entities/filter_data.dart';
import 'package:cipher/features/filter/domain/repositories/filter_repository.dart';
import 'package:dependencies/dependencies.dart';

part 'search_data_usecase.freezed.dart';

class SearchDataUsecase extends Usecase<FilterData, SearchParams> {
  final FilterRepository _repository;

  SearchDataUsecase(this._repository);
  @override
  Future<(Failure?, FilterData)> call(SearchParams p) async =>
      _repository.searchData(p);
}

@freezed
class SearchParams with _$SearchParams {
  const SearchParams._();
  const factory SearchParams({
    String? query,
  }) = _SearchParams;
}
