// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'tax_calculator_cubit.dart';

abstract class TaxCalculatorState extends Equatable {
  const TaxCalculatorState();
}

class TaxCalculatorInitial extends TaxCalculatorState {
  @override
  List<Object?> get props => [];
}

class TaxCalculatorSuccess extends TaxCalculatorState {
  final TaxRes taxRes;
  const TaxCalculatorSuccess({
    required this.taxRes,
  });
  @override
  List<Object?> get props => [
        taxRes,
      ];
}

class TaxCalculatorFailure extends TaxCalculatorState {
  @override
  List<Object?> get props => [];
}
