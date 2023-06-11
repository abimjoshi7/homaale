// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cipher/features/tax_calculator/data/models/tax_req.dart';
import 'package:dependencies/dependencies.dart';

import 'package:cipher/features/tax_calculator/data/models/tax_res.dart';
import 'package:cipher/features/tax_calculator/data/repositories/tax_repositories.dart';

part 'tax_calculator_state.dart';

class TaxCalculatorCubit extends Cubit<TaxCalculatorState> {
  final TaxRepositories repo;
  TaxCalculatorCubit(
    this.repo,
  ) : super(TaxCalculatorInitial());

  void init() => emit(
        TaxCalculatorInitial(),
      );

  Future<void> calculateTax(TaxReq req) async {
    try {
      emit(
        TaxCalculatorInitial(),
      );
      await repo.postTaxCalculate(req).then(
            (value) => emit(
              TaxCalculatorSuccess(
                taxRes: TaxRes.fromJson(
                  value,
                ),
              ),
            ),
          );
    } catch (e) {
      print(e.toString());
      emit(
        TaxCalculatorFailure(),
      );
    }
  }
}
