import 'package:cipher/core/constants/theme.dart';
import 'package:cipher/features/theme/presentation/bloc/theme_event.dart';
import 'package:cipher/features/theme/presentation/bloc/theme_state.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc()
      : super(
          ThemeLight(
            themeData: ThemeData(),
          ),
        ) {
    on<ThemeChangeInitiated>(
      (event, emit) => emit(
        ThemeLight(
          themeData: kLightTheme,
        ),
      ),
    );
    on<ThemeChangeChanged>(
      (event, emit) {
        if (state is ThemeLight) {
          emit(
            ThemeDark(
              themeData: kDarkTheme,
            ),
          );
        } else {
          emit(
            ThemeLight(
              themeData: kLightTheme,
            ),
          );
        }
      },
    );
  }
}
