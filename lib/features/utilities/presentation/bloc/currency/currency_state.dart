// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'currency_bloc.dart';

abstract class CurrencyState extends Equatable {
  const CurrencyState();
}

class CurrencyLoading extends CurrencyState {
  @override
  List<Object?> get props => [];
}

class CurrencyLoadSuccess extends CurrencyState {
  final List<CurrencyModel> currencyListRes;
  const CurrencyLoadSuccess({
    required this.currencyListRes,
  });
  @override
  List<Object?> get props => [currencyListRes];
}

class CurrencyLoadFailure extends CurrencyState {
  @override
  List<Object?> get props => [];
}
