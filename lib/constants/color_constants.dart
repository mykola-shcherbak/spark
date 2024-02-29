import 'package:flutter/material.dart';

class ColorConstants {
  static Color startPositionCell = HexColor('#64FFDA');
  static Color endPositionCell = HexColor('#009688');
  static Color emptyCell = HexColor('#FFFFFF');
  static Color blockedCell = HexColor('#000000');
  static Color stepCell = HexColor('#4CAF50');
  static Color error = Colors.redAccent;
  static Color accentColor = Colors.blueAccent;
  static Color appBarTittle = Colors.white;
  static Color buttonTitile = Colors.black;
  static Color emptyListItem = Colors.black;
}

class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF$hexColor";
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}
