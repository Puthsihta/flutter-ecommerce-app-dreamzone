import 'package:dreamzone/constants/fonts.dart';
import 'package:flutter/material.dart';

const ColorScheme colorSchemeDark = ColorScheme.dark(
  primary: Colors.amber,
);

final defaultDarkTheme = ThemeData.dark();
ThemeData darkThemeData = ThemeData.dark().copyWith(
    appBarTheme: defaultDarkTheme.appBarTheme.copyWith(
        titleTextStyle: TextStyle(
            color: colorSchemeDark.onBackground,
            fontFamily: Fonts.en,
            fontWeight: FontWeight.w600,
            fontSize: 20)),
    textTheme: ThemeData.dark().textTheme.apply(fontFamily: Fonts.en),
    colorScheme: colorSchemeDark);
