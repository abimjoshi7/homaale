import 'package:bloc/bloc.dart';
import 'package:cipher/features/account_settings/presentation/pages/tax_calculator/data/models/tax_req.dart';
import 'package:cipher/features/account_settings/presentation/pages/tax_calculator/data/models/tax_res.dart';
import 'package:cipher/features/account_settings/presentation/pages/tax_calculator/data/repositories/tax_repositories.dart';
import 'package:equatable/equatable.dart';

part 'tax_calculator_state.dart';

class TaxCalculatorCubit extends Cubit<TaxCalculatorState> {
  final repo = TaxRepositories();
  TaxCalculatorCubit() : super(TaxCalculatorInitial());

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
      emit(
        TaxCalculatorFailure(),
      );
    }
  }
}
