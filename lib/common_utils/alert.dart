import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../dalai.dart';

class Alert {
  static Future showStatusAlert(String title, String text, BuildContext context,
      IconData? icon, Color color) {
    return showDialog(
        context: context,
        barrierDismissible: true,
        builder: (BuildContext context) {
          return Dialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              elevation: 0,
              backgroundColor: Colors.transparent,
              child: Container(
                width: 50,
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    icon == null
                        ? const SizedBox.shrink()
                        : Icon(
                            icon,
                            size: 60,
                            color: color,
                          ),
                    icon == null
                        ? const SizedBox.shrink()
                        : const SizedBox(
                            height: 12,
                          ),
                    Text(title,
                        textAlign: TextAlign.center,
                        style: Theme.of(context)
                            .textTheme
                            .displayMedium!
                            .copyWith(
                                fontSize: 20, fontWeight: FontWeight.w600)),
                    const SizedBox(
                      height: 4,
                    ),
                    Text(
                      text,
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(fontSize: 16),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(
                      height: 6,
                    ),
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
              title: Text(
                title!,
                style: Theme.of(context).textTheme.displaySmall,
              ),
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
      String? title, String? text, onYesPressed, BuildContext context,
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
            title: Text(
              title!,
              style: Theme.of(context).textTheme.displaySmall,
            ),
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
                child: Text(onYesText),
                onPressed: () {
                  onYesPressed();
                  Navigator.of(context).pop();
                },
              ),
              CupertinoDialogAction(
                child: Text(onNoText),
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
