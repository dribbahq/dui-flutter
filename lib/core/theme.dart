import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../dui.dart';

class DUITheme {
  ThemeData themeData(bool isDarkTheme,
      {ThemeData? customThemeData,
      TextTheme? customTextTheme,
      ColorScheme? customColorScheme,
      InputDecorationTheme? customInputDecorationTheme,
      ButtonThemeData? customButtonTheme,
      TextSelectionThemeData? customTextSelectionTheme,
      String fontFamily = "metropolis",
      String? package}) {
    return ThemeData(
      useMaterial3: true,
      brightness: isDarkTheme ? Brightness.dark : Brightness.light,
      fontFamily: fontFamily,
      package: package,
      textTheme: customTextTheme ??
          customThemeData?.textTheme ??
          TextTheme(
            displayLarge: TextStyle(
                fontSize: DUI.text.head1,
                fontWeight: DUI.text.boldWeight,
                letterSpacing: -0.5,
                color: isDarkTheme ? DUI.color.textDarkMode : DUI.color.text),
            displayMedium: TextStyle(
                fontSize: DUI.text.head2,
                fontWeight: DUI.text.boldWeight,
                letterSpacing: 0,
                color: isDarkTheme ? DUI.color.textDarkMode : DUI.color.text),
            displaySmall: TextStyle(
                fontSize: DUI.text.head3,
                fontWeight: DUI.text.boldWeight,
                letterSpacing: 0.25,
                color: isDarkTheme ? DUI.color.textDarkMode : DUI.color.text),
            titleLarge: TextStyle(
                fontSize: DUI.text.h1,
                fontWeight: DUI.text.boldWeight,
                height: DUI.text.textHeight,
                letterSpacing: 0,
                color: isDarkTheme ? DUI.color.textDarkMode : DUI.color.text),
            titleMedium: TextStyle(
                fontSize: DUI.text.h2,
                fontWeight: DUI.text.boldWeight,
                height: DUI.text.textHeight,
                letterSpacing: 0.15,
                color: isDarkTheme ? DUI.color.textDarkMode : DUI.color.text),
            titleSmall: TextStyle(
                fontSize: DUI.text.h3,
                fontWeight: DUI.text.boldWeight,
                height: DUI.text.textHeight,
                letterSpacing: 0.15,
                color: isDarkTheme ? DUI.color.textDarkMode : DUI.color.text),
            bodyLarge: TextStyle(
                fontSize: DUI.text.regularText,
                letterSpacing: 0.5,
                fontWeight: DUI.text.regularWeight,
                color: isDarkTheme ? DUI.color.textDarkMode : DUI.color.text),
            bodyMedium: TextStyle(
                fontSize: DUI.text.smallText,
                fontWeight: DUI.text.regularWeight,
                letterSpacing: 0.25,
                color: isDarkTheme ? DUI.color.textDarkMode : DUI.color.text),
            bodySmall: TextStyle(
                fontSize: DUI.text.xsText,
                fontWeight: DUI.text.regularWeight,
                letterSpacing: 0.4,
                color: isDarkTheme
                    ? DUI.color.smallTextDarkMode
                    : DUI.color.smallText),
            labelLarge: TextStyle(
                fontSize: DUI.text.regularText,
                letterSpacing: 0.15,
                fontWeight: DUI.text.semiBoldWeight,
                color: isDarkTheme ? DUI.color.textDarkMode : DUI.color.text),
            labelMedium: TextStyle(
                fontSize: DUI.text.smallText,
                fontWeight: DUI.text.semiBoldWeight,
                letterSpacing: 0.1,
                color: isDarkTheme ? DUI.color.textDarkMode : DUI.color.text),
            labelSmall: TextStyle(
                fontSize: DUI.text.xsText,
                fontWeight: DUI.text.semiBoldWeight,
                letterSpacing: 0.4,
                color: isDarkTheme ? DUI.color.textDarkMode : DUI.color.text),
          ),
      scaffoldBackgroundColor:
          isDarkTheme ? DUI.color.scaffoldDarkMode : DUI.color.scaffold,
      colorScheme: customColorScheme ??
          customThemeData?.colorScheme ??
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
      inputDecorationTheme: customInputDecorationTheme ??
          InputDecorationTheme(
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
      buttonTheme: customButtonTheme ??
          const ButtonThemeData(textTheme: ButtonTextTheme.accent),
      textSelectionTheme: customTextSelectionTheme ??
          const TextSelectionThemeData(
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
