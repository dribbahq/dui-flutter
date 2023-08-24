import 'dart:ui';

import 'package:flutter/material.dart';

import '../dalai.dart';

extension ColorExtension on Color {
  Color calculateLuminance() {

    print(this);
    return computeLuminance() >= 0.5
        ? Dalai.color.text
        : Dalai.color.textDarkMode;
  }
}
