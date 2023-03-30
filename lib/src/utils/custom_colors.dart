import 'package:flutter/material.dart';

class CustomColors {
  static Color brandPurple = HexColor("#5B4DA7");
  static Color white = HexColor("#ffffff");
  static Color black = HexColor("#161616");
  static Color grey = HexColor("#707070");
  static Color lightGrey = HexColor("#EAEAEA");
  static Color brandRed = HexColor("#7F1B38");
  static Color brandBlue = HexColor("#14B2E8");
  static Color lightPink = HexColor("#EACADA");
  static Color darkBlue = HexColor("#172A46");
  static Color mediumBlue = HexColor("#0E4593");
  static Color darkPurple = HexColor("#612367");
  static Color darkPink = HexColor("#A5186A");
  static Color darkerBlue = HexColor("#18223B");
  static Color lightOrange = HexColor("#F4991A");
  static Color orange = HexColor("#EC691D");
  static Color darkOrange = HexColor("#FF6900");
  static Color brandYellow = HexColor("#FFDB06");
  static Color brandPink = HexColor("#E3236C");
}

class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}
