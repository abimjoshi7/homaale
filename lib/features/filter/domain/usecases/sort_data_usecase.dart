import 'package:cipher/core/error/failure.dart';
import 'package:cipher/core/usecase/usecase.dart';
import 'package:cipher/features/filter/domain/entities/filter_data.dart';
import 'package:cipher/features/filter/domain/repositories/filter_repository.dart';
import 'package:dependencies/dependencies.dart';

part 'sort_data_usecase.freezed.dart';

class SortDataUsecase extends Usecase<FilterData, SortParams> {
  final FilterRepository _repository;

  SortDataUsecase(this._repository);
  @override
  Future<(Failure?, FilterData)> call(SortParams p) async =>
      _repository.sortData(p);
}

@freezed
class SortParams with _$SortParams {
  const SortParams._();
  const factory SortParams({
    @Default(false) bool isAscending,
  }) = _SortParams;
}
