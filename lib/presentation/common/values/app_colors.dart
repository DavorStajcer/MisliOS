import 'package:flutter/material.dart';

abstract class AppColors {
  //static final Color primary = HexColor.fromHex('#3d5a80');
  static final Color primary = secondary;
  //static final Color eventBackground = HexColor.fromHex('#98c1d9');
  static final Color eventBackground = secondary;
  static final Color secondary = HexColor.fromHex('#293241');
}

extension HexColor on Color {
  static Color fromHex(String hexColorString) {
    var tmpHexColorString = hexColorString.replaceAll('#', '');
    if (tmpHexColorString.length == 6) {
      tmpHexColorString = '0xFF$tmpHexColorString';
    } else {
      tmpHexColorString = '0x$tmpHexColorString';
    }
    return Color(int.parse(tmpHexColorString));
  }
}
