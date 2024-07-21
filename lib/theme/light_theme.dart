import 'package:dreamzone/constants/fonts.dart';
import 'package:flutter/material.dart';

const ColorScheme colorSchemeLight = ColorScheme.light(primary: Colors.amber);

final defaultLightTheme = ThemeData.light();
ThemeData lightThemeData = defaultLightTheme.copyWith(
  scaffoldBackgroundColor: const Color(0xFFF2F4F5),
  appBarTheme: defaultLightTheme.appBarTheme.copyWith(
    titleTextStyle: TextStyle(
        color: colorSchemeLight.onBackground,
        fontFamily: Fonts.en,
        fontWeight: FontWeight.w600,
        fontSize: 20),
  ),
  textTheme: defaultLightTheme.textTheme.apply(fontFamily: Fonts.en),
  dialogTheme: defaultLightTheme.dialogTheme
      .copyWith(surfaceTintColor: Colors.white, backgroundColor: Colors.white),
  colorScheme: colorSchemeLight,
);
