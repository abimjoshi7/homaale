import 'package:dependencies/dependencies.dart';

import '../../../../core/constants/theme.dart';

abstract class ThemeEvent extends Equatable {
  const ThemeEvent();
}

class ThemeChangeInitiated extends ThemeEvent {
  final AppTheme? appTheme;
  const ThemeChangeInitiated({
    this.appTheme,
  });
  @override
  List<Object?> get props => [appTheme];
}

class ThemeChangeChanged extends ThemeEvent {
  final AppTheme? appTheme;
  const ThemeChangeChanged({
    this.appTheme,
  });
  @override
  List<Object?> get props => [appTheme];
}
