
import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';

import '../../../../core/constants/enums.dart';

 class ThemeState extends Equatable {
   final TheStates? theStates;
   final ThemeData? themeData;

   const ThemeState({this.theStates,  this.themeData});

  @override
  List<Object?> get props => [theStates,themeData];


 }
