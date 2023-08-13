import 'package:cityxerpa_icons/cityxerpa_symbols.dart';
import 'package:flutter/material.dart';

class DalaiIcons{
  Widget dalaiIcons(BuildContext context, CXIcon icon, {CXIconSize? size, Color? mainColor, Color? secondaryColor}){
    return CityXerpaIcons.get(
        icon,
        theme: Theme.of(context).brightness == Brightness.dark ? CXTheme.dark : CXTheme.light,
        size: size ?? CXIconSize.regular,
        mainColor: mainColor,
        secondaryColor: secondaryColor
    );
  }
}