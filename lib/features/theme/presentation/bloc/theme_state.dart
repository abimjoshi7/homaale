// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';

 class ThemeState extends Equatable {
   final ThemeData? themeData;

   const ThemeState({this.themeData});
   ThemeState copyWith({
     ThemeData? themeData,
   }) {
     return ThemeState(
     themeData: themeData ?? this.themeData,
     );
   }
  @override
  List<Object?> get props =>[themeData];
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
