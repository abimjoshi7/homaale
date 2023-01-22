import 'package:bloc/bloc.dart';
import 'package:cipher/core/constants/theme.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

part 'theme_event.dart';
part 'theme_state.dart';

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
