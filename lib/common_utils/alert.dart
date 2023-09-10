import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../dui.dart';

class Alert {

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
                      BorderRadius.circular(DUI.spacing.borderRadius)),
              titlePadding: EdgeInsets.only(
                  top: 2 * DUI.spacing.lateralPaddingValue,
                  bottom: DUI.spacing.lateralPaddingValue / 2,
                  left: DUI.spacing.lateralPaddingValue,
                  right: DUI.spacing.lateralPaddingValue),
              contentPadding: EdgeInsets.symmetric(
                  vertical: 0, horizontal: DUI.spacing.lateralPaddingValue),
              actionsPadding: EdgeInsets.symmetric(
                  vertical: 0, horizontal: DUI.spacing.lateralPaddingValue),
              surfaceTintColor: Theme.of(context).colorScheme.background,
              title: DUI.text.title3(context, title!),
              content: DUI.text.regular(context, text!),
              actions: <Widget>[
                TextButton(
                  child: DUI.text.regular(context, okText,
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
                  DUI.spacing.spacer(small: true),
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
                    BorderRadius.circular(DUI.spacing.borderRadius)),
            titlePadding: EdgeInsets.only(
                top: 2 * DUI.spacing.lateralPaddingValue,
                bottom: DUI.spacing.lateralPaddingValue / 2,
                left: DUI.spacing.lateralPaddingValue,
                right: DUI.spacing.lateralPaddingValue),
            contentPadding: EdgeInsets.symmetric(
                vertical: 0, horizontal: DUI.spacing.lateralPaddingValue),
            actionsPadding: EdgeInsets.symmetric(
                vertical: 0, horizontal: DUI.spacing.lateralPaddingValue),
            surfaceTintColor: Theme.of(context).colorScheme.background,
            title: DUI.text.title3(context, title!),
            content: DUI.text.regular(context, text!),
            actions: <Widget>[
              TextButton(
                child: DUI.text.regular(context, onNoText,
                    bold: true, color: Colors.blueAccent),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              TextButton(
                child: DUI.text.regular(context, onYesText,
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
                DUI.spacing.spacer(small: true),
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
