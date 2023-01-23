part of 'country_bloc.dart';

abstract class CountryState extends Equatable {
  const CountryState();
}

class CountryLoading extends CountryState {
  @override
  List<Object?> get props => [];
}

class CountryLoadSuccess extends CountryState {
  final List<CountryListRes> list;
  const CountryLoadSuccess({
    required this.list,
  });
  @override
  List<Object?> get props => [list];
}

class CountryLoadFailure extends CountryState {
  @override
  List<Object?> get props => [];
}
