import 'package:flutter/material.dart';

import '../dui.dart';

extension ColorExtension on Color {
  Color calculateLuminance({Color? lightColor, Color? darkColor}) {
    return computeLuminance() >= 0.5
        ? darkColor ?? DUI.color.text
        : lightColor ?? DUI.color.textDarkMode;
  }

  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }

  String toHex({bool leadingHashSign = true}) => '${leadingHashSign ? '#' : ''}'
      '${alpha.toRadixString(16).padLeft(2, '0')}'
      '${red.toRadixString(16).padLeft(2, '0')}'
      '${green.toRadixString(16).padLeft(2, '0')}'
      '${blue.toRadixString(16).padLeft(2, '0')}';

  Color darken([double? amount]) {

    final hsl = HSLColor.fromColor(this);
    final hslDark = hsl.withLightness(amount != null ? (hsl.lightness - amount).clamp(0.0, 1.0) : 0.25);

    return hslDark.toColor();
  }

  Color lighten([double? amount]) {

    final hsl = HSLColor.fromColor(this);
    final hslLight = hsl.withLightness(amount != null ? (hsl.lightness + amount).clamp(0.0, 1.0) : 0.75);

    return hslLight.toColor();
  }
}
