import 'package:flutter/material.dart';

class ColorManager{
  static Color primary = HexColor.fromHex('#FF3232');
}

extension HexColor on Color{
  static Color fromHex(String hexColorString){
    hexColorString = hexColorString.replaceAll("#", '');
    if(hexColorString.length == 6){
      hexColorString = 'FF$hexColorString';
    }

    return Color(int.parse(hexColorString, radix: 16));
  }
}