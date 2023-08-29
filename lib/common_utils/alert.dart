import 'dart:io';
import 'package:cityxerpa_icons/cityxerpa_symbols.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../dalai.dart';

class Alert {
  static Future showStatusAlert(String title, String text, BuildContext context,
      CXIcon icon, Color color) {
    return showDialog(
        context: context,
        barrierDismissible: true,
        builder: (BuildContext context) {
          return Dialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(Dalai.spacing.borderRadius),
              ),
              elevation: 0,
              backgroundColor: Colors.transparent,
              child: Container(
                width: 50,
                padding: EdgeInsets.all(Dalai.spacing.lateralPaddingValue),
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  color: Colors.white,
                  borderRadius:
                      BorderRadius.circular(Dalai.spacing.borderRadius),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Dalai.spacing.spacer(),
                    Dalai.icon
                        .dalaiIcons(context, icon, size: CXIconSize.large),
                    Dalai.spacing.spacer(),
                    Dalai.text.regular(context, title, bold: true),
                    Dalai.text.small(context, text),
                    Dalai.spacing.spacer(),
                  ],
                ),
              ));
        });
  }

  static Future showAlert(String? title, String? text, BuildContext context,
      {onPressed, barrierDismissible, required String okText}) {
    if (kIsWeb) {
      return showDialog(
        context: context,
        barrierDismissible: barrierDismissible ?? true,
        builder: (BuildContext context) {
          return AlertDialog(
            title:
                Text(title!, style: Theme.of(context).textTheme.displayMedium),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  Text(
                    text!,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ],
              ),
            ),
            actions: <Widget>[
              TextButton(
                child: Text(
                  okText,
                  style: Theme.of(context).textTheme.displaySmall,
                ),
                onPressed: () {
                  if (onPressed != null) {
                    onPressed();
                  } else {
                    Navigator.of(context).pop();
                  }
                },
              ),
            ],
          );
        },
      );
    } else {
      if (Platform.isAndroid) {
        return showDialog(
          context: context,
          barrierDismissible: barrierDismissible ?? true,
          builder: (BuildContext context) {
            return AlertDialog(
              shape: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.circular(Dalai.spacing.borderRadius)),
              titlePadding: EdgeInsets.only(
                  top: 2 * Dalai.spacing.lateralPaddingValue,
                  bottom: Dalai.spacing.lateralPaddingValue / 2,
                  left: Dalai.spacing.lateralPaddingValue,
                  right: Dalai.spacing.lateralPaddingValue),
              contentPadding: EdgeInsets.symmetric(
                  vertical: 0, horizontal: Dalai.spacing.lateralPaddingValue),
              actionsPadding: EdgeInsets.symmetric(
                  vertical: 0, horizontal: Dalai.spacing.lateralPaddingValue),
              surfaceTintColor: Theme.of(context).colorScheme.background,
              title: Dalai.text.title3(context, title!),
              content: Dalai.text.regular(context, text!),
              actions: <Widget>[
                TextButton(
                  child: Dalai.text.regular(context, okText,
                      bold: true, color: Colors.blueAccent),
                  onPressed: () {
                    if (onPressed != null) {
                      onPressed();
                    } else {
                      Navigator.of(context).pop();
                    }
                  },
                ),
              ],
            );
          },
        );
      } else {
        return showDialog(
          barrierDismissible: barrierDismissible ?? true,
          context: context,
          builder: (BuildContext context) {
            return CupertinoAlertDialog(
              title: Text(
                title!,
              ),
              content: Column(
                children: <Widget>[
                  Dalai.spacing.spacer(small: true),
                  Text(
                    text!,
                    style: const TextStyle(height: 1.2),
                  )
                ],
              ),
              actions: <Widget>[
                CupertinoDialogAction(
                  isDefaultAction: true,
                  child: Text(
                    okText,
                    style: TextStyle(color: Colors.blueAccent),
                  ),
                  onPressed: () {
                    if (onPressed != null) {
                      onPressed();
                    } else {
                      Navigator.of(context).pop();
                    }
                  },
                ),
              ],
            );
          },
        );
      }
    }
  }

  static Future showAlertYesNo(
      String? title, String? text, Function onYesPressed, BuildContext context,
      {required String onYesText, required String onNoText}) {
    if (kIsWeb) {
      return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title:
                Text(title!, style: Theme.of(context).textTheme.displayMedium),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  Text(
                    text!,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ],
              ),
            ),
            actions: <Widget>[
              TextButton(
                child: Text(
                  onYesText,
                  style: Theme.of(context).textTheme.displaySmall,
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                  onYesPressed();
                },
              ),
              TextButton(
                child: Text(
                  onNoText,
                  style: Theme.of(context).textTheme.displaySmall,
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    } else if (Platform.isAndroid) {
      return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.circular(Dalai.spacing.borderRadius)),
            titlePadding: EdgeInsets.only(
                top: 2 * Dalai.spacing.lateralPaddingValue,
                bottom: Dalai.spacing.lateralPaddingValue / 2,
                left: Dalai.spacing.lateralPaddingValue,
                right: Dalai.spacing.lateralPaddingValue),
            contentPadding: EdgeInsets.symmetric(
                vertical: 0, horizontal: Dalai.spacing.lateralPaddingValue),
            actionsPadding: EdgeInsets.symmetric(
                vertical: 0, horizontal: Dalai.spacing.lateralPaddingValue),
            surfaceTintColor: Theme.of(context).colorScheme.background,
            title: Dalai.text.title3(context, title!),
            content: Dalai.text.regular(context, text!),
            actions: <Widget>[
              TextButton(
                child: Dalai.text.regular(context, onNoText,
                    bold: true, color: Colors.blueAccent),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              TextButton(
                child: Dalai.text.regular(context, onYesText,
                    bold: true, color: Colors.blueAccent),
                onPressed: () {
                  Navigator.of(context).pop();
                  onYesPressed();
                },
              ),
            ],
          );
        },
      );
    } else {
      return showDialog(
        context: context,
        builder: (BuildContext context) {
          return CupertinoAlertDialog(
            title: Text(title!),
            content: Column(
              children: <Widget>[
                Dalai.spacing.spacer(small: true),
                Text(
                  text!,
                  style: const TextStyle(height: 1.2),
                )
              ],
            ),
            actions: <Widget>[
              CupertinoDialogAction(
                isDefaultAction: true,
                child: Text(
                  onYesText,
                  style: TextStyle(color: Colors.blueAccent),
                ),
                onPressed: () {
                  onYesPressed();
                  Navigator.of(context).pop();
                },
              ),
              CupertinoDialogAction(
                child: Text(
                  onNoText,
                  style: TextStyle(color: Colors.blueAccent),
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }
  }
}
