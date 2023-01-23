part of 'city_bloc.dart';

abstract class CityEvent extends Equatable {
  const CityEvent();
}

class CityLoadInitiated extends CityEvent {
  @override
  List<Object?> get props => [];
}
