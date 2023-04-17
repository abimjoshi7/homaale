import 'package:cipher/core/constants/theme.dart';
import 'package:cipher/features/theme/presentation/bloc/theme_event.dart';
import 'package:cipher/features/theme/presentation/bloc/theme_state.dart';
import 'package:dependencies/dependencies.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc()
      : super(
          ThemeState(
            themeData: AppThemes.appThemeData[AppTheme.lightTheme],
          ),
        ) {
    on<ThemeChangeInitiated>(
      (event, emit) => emit(
        ThemeState(
          themeData: AppThemes.appThemeData[AppTheme.darkTheme],
        ),
      ),
    );
    on<ThemeChangeChanged>((event, emit) {
      ThemeState(
        themeData: AppThemes.appThemeData[event.appTheme],
      );
    });
  }
}
