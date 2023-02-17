// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'theme_bloc.dart';

abstract class ThemeState extends Equatable {
  const ThemeState();
}

class ThemeLight extends ThemeState {
  final ThemeData themeData;
  const ThemeLight({
    required this.themeData,
  });

  @override
  List<Object?> get props => [themeData];
}

class ThemeDark extends ThemeState {
  final ThemeData themeData;
  const ThemeDark({
    required this.themeData,
  });
  @override
  List<Object?> get props => [themeData];
}
