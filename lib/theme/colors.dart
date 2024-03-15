import 'package:flutter/material.dart';

Color baseColor = _colorFromHex("#F7C04A");
Color bottomTapColor = _colorFromHex("#FEC868");
Color baseRGBColor = _colorFromHex('rgba(255, 226, 85, 0.2)');
Color whiteSmoke = _colorFromHex('#f6f6f6');

Color _colorFromHex(String hexColor) {
  final hexCode = hexColor.replaceAll('#', '');
  return Color(int.parse('FF$hexCode', radix: 16));
}
