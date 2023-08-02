import 'package:cipher/core/core.dart';
import 'package:cipher/core/usecase/usecase.dart';
import 'package:cipher/features/filter/domain/entities/filter_data.dart';
import 'package:cipher/features/filter/domain/repositories/filter_repository.dart';
import 'package:dependencies/dependencies.dart';

part 'range_data_usecase.freezed.dart';

class RangeDataUsecase extends Usecase<FilterData, RangeParams> {
  final FilterRepository _repository;

  RangeDataUsecase(this._repository);
  @override
  Future<(Failure?, FilterData)> call(RangeParams p) async =>
      _repository.rangeData(p);
}

@freezed
class RangeParams with _$RangeParams {
  const RangeParams._();
  const factory RangeParams({
    String? startValue,
    String? endValue,
  }) = _RangeParams;
}
