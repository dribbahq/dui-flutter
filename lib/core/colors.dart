import 'package:flutter/material.dart';

class DUIColor {
  //Primary
  final Color primary = const Color(0xFFF15657);
  final Color primaryAlternativeLight = const Color(0xFFFA7E7F);
  final Color primaryAlternativeDark = const Color(0xFFA83C3D);
  final Color primaryContrast = const Color(0xFFFFFFFF);
  final Color primaryOutlinedNestingBackground = const Color(0xFFF8ACAC);

  //Secondary
  final Color secondary = const Color(0xFF222222);
  final Color secondaryDarkMode = Colors.white;
  final Color secondaryContrast = const Color(0xFFFFFFFF);

  //Text
  final Color text = const Color(0xFF222222);
  final Color smallText = const Color(0xFF717171);
  final Color textDarkMode = const Color(0xFFF8F8F8);
  final Color smallTextDarkMode = const Color(0xFFCBCED2);
  final Color disabledText = const Color(0xFFBDBDBD);
  Color getInvertedTextColor(BuildContext context) {
    if (Theme.of(context).brightness == Brightness.light) {
      return textDarkMode;
    }
    return text;
  }

  Color getInvertedSmallTextColor(BuildContext context) {
    if (Theme.of(context).brightness == Brightness.light) {
      return smallTextDarkMode;
    }
    return smallText;
  }

  //State colors
  final Color discount = const Color(0xFF26A992);
  final Color warning = const Color(0xFFEEB468);
  final Color error = const Color(0xFFDD4444);

  //Loading colors
  final Color? loadingLightPrimary = Colors.grey[300];
  final Color? loadingLightSecondary = Colors.grey[50];
  final Color loadingDarkPrimary = const Color(0xff303847);
  final Color loadingDarkSecondary = const Color(0xff3F4756);

  //Background
  final Color background = Colors.white;
  final Color backgroundDarkMode = const Color(0xFF1F262E);
  final Color scaffold = const Color(0xFFF8F6F5);
  final Color scaffoldDarkMode = const Color(0xFF444E5E);
  final Color homeCategoryBG = const Color(0xFFEFECEA);
  final Color homeCategoryBGDark = const Color(0xFF3C4553);

  //Input
  final Color inputFillColorLight = const Color(0XFFF7F7F7);
  final Color inputFillColorDark = const Color(0XFF444E5E);
  final Color inputHomeFillColor = const Color(0xFFCD494A);
  final Color inputHomePlaceholderColor =
      const Color(0xFFFFFFFF).withOpacity(0.5);

  final Color inputBorderEnableLight = const Color(0xFFDDDDDD);
  final Color inputBorderFocusLight = const Color(0xFFA3A3A3);

  //Others
  final Color cream = const Color(0xFFF4eae3);
  final Color white = Colors.white;
  final Color black = Colors.black;
  final Color grey = Colors.grey;

  //to remove or rename
  final Color blue = const Color(0xFF3C5C8B);
  final Color promo = const Color(0xff2FA5D2);
  final Color auberginie = const Color(0xff743156);
}
