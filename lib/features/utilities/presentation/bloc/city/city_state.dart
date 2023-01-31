part of 'city_bloc.dart';

abstract class CityState extends Equatable {
  const CityState();
}

class CityLoading extends CityState {
  @override
  List<Object?> get props => [];
}

class CityLoadSuccess extends CityState {
  final List<CityModel> list;
  const CityLoadSuccess({
    required this.list,
  });
  @override
  List<Object?> get props => [list];
}

class CityLoadFailure extends CityState {
  @override
  List<Object?> get props => [];
}
