import 'package:flutter/material.dart';
import 'package:ticket/core/constants/size_constants.dart';

ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  scaffoldBackgroundColor: Colors.white,
  colorScheme: const ColorScheme.light(
    background: Colors.white,
    primary: Colors.white,
    secondary: Color(0xFFFF9900),
    error: Colors.red,
  ),
  textTheme: Typography.whiteMountainView.copyWith(
    headline1: Typography.whiteMountainView.headline1?.copyWith(fontSize: 32),
    headline2: Typography.whiteMountainView.headline2?.copyWith(fontSize: 28),
    headline3: Typography.whiteMountainView.headline3?.copyWith(fontSize: 24),
    headline4: Typography.whiteMountainView.headline4?.copyWith(fontSize: 21),
    headline5: Typography.whiteMountainView.headline5?.copyWith(fontSize: 18),
    headline6: Typography.whiteMountainView.headline6?.copyWith(fontSize: 16),
    subtitle1: Typography.whiteMountainView.subtitle1?.copyWith(fontSize: 24),
    subtitle2: Typography.whiteMountainView.subtitle2?.copyWith(color: Colors.white, fontSize: SizeConstants.textSizeMedium),
    bodyText1: Typography.whiteMountainView.subtitle2?.copyWith(color: Color(0xFFEC540E), fontSize: SizeConstants.textSizeXXXXLarge),
    bodyText2: Typography.whiteMountainView.subtitle2?.copyWith(color: Color(0xFFEC540E), fontSize: SizeConstants.textSizeMedium),
  ),
  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.transparent,
    elevation: 0,
    iconTheme: IconThemeData(color: Colors.black),
  ),
);
