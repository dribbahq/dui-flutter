import 'dart:io';
import '../dalai.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DalaiTheme {
  ThemeData themeData(bool isDarkTheme) {
    return ThemeData(
      useMaterial3: true,
      brightness: isDarkTheme ? Brightness.dark : Brightness.light,
      platform:
          Platform.isAndroid ? TargetPlatform.android : TargetPlatform.iOS,
      fontFamily: 'metropolis',
      textTheme: TextTheme(
        displayMedium: TextStyle(
            color:
                isDarkTheme ? Dalai.color.textDarkMode : Dalai.color.primary),
        bodyMedium: TextStyle(
            color: isDarkTheme ? Dalai.color.textDarkMode : Dalai.color.text),
        bodySmall: TextStyle(
            color: isDarkTheme
                ? Dalai.color.smallTextDarkMode
                : Dalai.color.smallText),
      ),
      scaffoldBackgroundColor:
          isDarkTheme ? Dalai.color.scaffoldDarkMode : Dalai.color.scaffold,
      colorScheme: ColorScheme(
        background: isDarkTheme
            ? Dalai.color.backgroundDarkMode
            : Dalai.color.background,
        primary: Dalai.color.primary,
        secondary:
            isDarkTheme ? Dalai.color.secondaryDarkMode : Dalai.color.secondary,
        surface: Colors.white,
        error: Dalai.color.error,
        onPrimary: Colors.white,
        onSecondary: Colors.black,
        onSurface: Colors.black,
        onBackground: Colors.black,
        onError: Colors.white,
        brightness: isDarkTheme ? Brightness.dark : Brightness.light,
      ),
      inputDecorationTheme: InputDecorationTheme(
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(Dalai.spacing.borderRadius),
              borderSide: BorderSide(
                  color: isDarkTheme
                      ? const Color(0XFF444E5E)
                      : Dalai.color.inputBorderEnableLight,
                  width: 1)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(Dalai.spacing.borderRadius),
              borderSide: BorderSide(
                  color: isDarkTheme
                      ? const Color(0XFF444E5E)
                      : Dalai.color.inputBorderFocusLight,
                  width: 2)),
          focusColor: isDarkTheme ? Dalai.color.textDarkMode : Dalai.color.text,
          fillColor: isDarkTheme
              ? Dalai.color.inputFillColorDark
              : Dalai.color.inputFillColorLight),
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
