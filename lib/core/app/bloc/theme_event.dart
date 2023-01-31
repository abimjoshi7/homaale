part of 'theme_bloc.dart';

abstract class ThemeEvent extends Equatable {
  const ThemeEvent();
}

class ThemeChangeInitiated extends ThemeEvent {
  @override
  List<Object?> get props => [];
}

class ThemeChangeChanged extends ThemeEvent {
  @override
  List<Object?> get props => [];
}
