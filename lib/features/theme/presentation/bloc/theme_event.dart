

import 'package:dependencies/dependencies.dart';

abstract class ThemeEvent extends Equatable {
  const ThemeEvent();
}

class ThemeChangeInitiated extends ThemeEvent {
  @override
  List<Object?> get props => [];
}

class ThemeChangeChanged extends ThemeEvent {
  final bool isDark;

  ThemeChangeChanged({required this.isDark});
  @override
  List<Object?> get props => [isDark];
}
