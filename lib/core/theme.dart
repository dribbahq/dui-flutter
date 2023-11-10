import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../dui.dart';

class DUITheme {
  ThemeData themeData(bool isDarkTheme,
      {ThemeData? customThemeData, String fontFamily = "metropolis"}) {
    return ThemeData(
      useMaterial3: true,
      brightness: isDarkTheme ? Brightness.dark : Brightness.light,
      platform:
      Platform.isAndroid ? TargetPlatform.android : TargetPlatform.iOS,
      fontFamily: fontFamily,
      textTheme: customThemeData?.textTheme ??
          TextTheme(
            displayMedium: TextStyle(
                color:
                isDarkTheme ? DUI.color.textDarkMode : DUI.color.primary),
            bodyMedium: TextStyle(
                color: isDarkTheme ? DUI.color.textDarkMode : DUI.color.text),
            bodySmall: TextStyle(
                color: isDarkTheme
                    ? DUI.color.smallTextDarkMode
                    : DUI.color.smallText),
            titleLarge: TextStyle(
                color: isDarkTheme ? DUI.color.textDarkMode : DUI.color.text),
            titleSmall: TextStyle(
                color: isDarkTheme
                    ? DUI.color.smallTextDarkMode
                    : DUI.color.smallText),
          ),
      scaffoldBackgroundColor:
      isDarkTheme ? DUI.color.scaffoldDarkMode : DUI.color.scaffold,
      colorScheme: customThemeData?.colorScheme ??
          ColorScheme(
            background: isDarkTheme
                ? DUI.color.backgroundDarkMode
                : DUI.color.background,
            primary: DUI.color.primary,
            secondary:
            isDarkTheme ? DUI.color.secondaryDarkMode : DUI.color.secondary,
            surface: Colors.white,
            error: DUI.color.error,
            onPrimary: Colors.white,
            onSecondary: Colors.black,
            onSurface: Colors.black,
            onBackground: Colors.black,
            onError: Colors.white,
            brightness: isDarkTheme ? Brightness.dark : Brightness.light,
          ),
      inputDecorationTheme: InputDecorationTheme(
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(DUI.spacing.borderRadius),
              borderSide: BorderSide(
                  color: isDarkTheme
                      ? const Color(0XFF444E5E)
                      : DUI.color.inputBorderEnableLight,
                  width: 1)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(DUI.spacing.borderRadius),
              borderSide: BorderSide(
                  color: isDarkTheme
                      ? const Color(0XFF444E5E)
                      : DUI.color.inputBorderFocusLight,
                  width: 2)),
          focusColor: isDarkTheme ? DUI.color.textDarkMode : DUI.color.text,
          fillColor: isDarkTheme
              ? DUI.color.inputFillColorDark
              : DUI.color.inputFillColorLight),
      buttonTheme: const ButtonThemeData(textTheme: ButtonTextTheme.accent),
      textSelectionTheme: const TextSelectionThemeData(
          cursorColor: Color(0XFF444E5E),
          selectionColor: Colors.transparent,
          selectionHandleColor: Colors.transparent),
      appBarTheme: AppBarTheme(
        systemOverlayStyle: isDarkTheme
            ? SystemUiOverlayStyle.light
            : SystemUiOverlayStyle.dark,
        color: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(
            color: isDarkTheme ? Colors.white : const Color(0XFF383838)),
      ),
    );
  }
}
