import 'package:dui/common_utils/color_extension.dart';
import 'package:flutter/material.dart';
import '../dui.dart';

class DUITile {
  Widget listTile(
    String? text,
    BuildContext context,
    Function() onTap, {
    EdgeInsets? padding,
    Color? colorText,
    bool? loading = false,
    Widget? leading,
    Widget? trailing,
  }) {
    return Material(
      color: DUI.color.white,
      child: ListTile(
        tileColor: Theme.of(context).colorScheme.background,
        contentPadding: padding ??
            EdgeInsets.symmetric(
                horizontal: DUI.spacing.lateralPaddingValue, vertical: 0),
        title: DUI.text.regular(context, text ?? '',
            color: colorText ?? Theme.of(context).textTheme.bodyMedium!.color),
        trailing: loading!
            ? DUI.misc.loadingAnimation(context, size: 18)
            : trailing ??
                Icon(
                  Icons.chevron_right,
                ),
        leading: leading,
        onTap: onTap,
      ),
    );
  }

  Widget listTileWithSub(
    String? title,
    BuildContext context,
    String? subtitle, {
    EdgeInsets? padding,
    Color? colorText,
    Function()? onTap,
    Widget? leading,
    Widget? trailing,
  }) {
    return Material(
      color: DUI.color.white,
      child: ListTile(
        onTap: onTap,
        leading: leading,
        trailing: trailing ??
            Icon(
              Icons.chevron_right,
            ),
        tileColor: Theme.of(context).colorScheme.background,
        contentPadding: padding ??
            EdgeInsets.symmetric(
                horizontal: DUI.spacing.lateralPaddingValue, vertical: 0),
        title: Text(
          title ?? '',
          style: TextStyle(
              fontSize: DUI.text.regularText,
              fontWeight: DUI.text.semiBoldWeight,
              color:
                  colorText ?? Theme.of(context).textTheme.bodyMedium!.color),
        ),
        subtitle: subtitle == null
            ? null
            : Text(
                subtitle,
                style: TextStyle(
                    fontSize: DUI.text.smallText,
                    color: colorText ??
                        Theme.of(context).textTheme.bodyMedium!.color),
                textAlign: TextAlign.start,
              ),
      ),
    );
  }

  Widget listTileCustomImage(
      Widget leading, BuildContext context, String? title, Function() onTap) {
    return Material(
      child: Container(
        color: Theme.of(context).colorScheme.background,
        child: InkWell(
            splashColor: Colors.red,
            focusColor: Colors.red,
            highlightColor: Colors.red,
            hoverColor: Colors.red,
            onTap: onTap,
            child: Padding(
              padding: EdgeInsets.only(
                  left: DUI.spacing.lateralPaddingValue,
                  right: DUI.spacing.lateralPaddingValue,
                  top: 16,
                  bottom: 16),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    leading,
                    DUI.spacing.hSpacer(),
                    Expanded(
                      child:
                          DUI.text.regular(context, title ?? '', maxLines: 2),
                    ),
                    Icon(
                      Icons.chevron_right,
                      size: 14.0,
                    ),
                  ]),
            )),
      ),
    );
  }

  Widget squareTile(
    BuildContext context, {
    IconData? icon,
    required String? title,
    Function()? onTap,
    Function()? onInfoTap,
    String? value,
    String? subtitle,
    bool selected = false,
  }) {
    if (value == null) {
      var backgroundColor = selected
          ? Theme.of(context).colorScheme.background.calculateLuminance()
          : Theme.of(context).colorScheme.background;
      return InkWell(
        onTap: () {
          if (onTap != null) {
            onTap();
          }
        },
        child: Container(
            constraints: BoxConstraints(
              maxWidth: MediaQuery.of(context).size.width / 2,
            ),
            padding: EdgeInsets.all(DUI.spacing.lateralPaddingValue),
            decoration: BoxDecoration(
              color: backgroundColor,
              border: Border.all(
                  color: Theme.of(context).colorScheme.background,
                  width: DUI.spacing.borderWidth),
              borderRadius: BorderRadius.circular(DUI.spacing.borderRadius),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                        child: GestureDetector(
                      onTap: onInfoTap != null
                          ? () {
                              onInfoTap();
                            }
                          : null,
                      child: Container(
                        width: double.infinity,
                        color: Colors.transparent,
                        child: Row(
                          children: [
                            Flexible(
                              child: DUI.text.regular(context, title,
                                  bold: true,
                                  color: backgroundColor.calculateLuminance(),
                                  maxLines: 1),
                            ),
                            DUI.spacing.hSpacer(small: true),
                            onInfoTap != null
                                ? Icon(Icons.info_outline_rounded,
                                    size: 12,
                                    color: backgroundColor.calculateLuminance())
                                : SizedBox.shrink(),
                          ],
                        ),
                      ),
                    )),
                    icon == null
                        ? SizedBox.shrink()
                        : Icon(icon,
                            color: backgroundColor.calculateLuminance()),
                  ],
                ),
                subtitle != null
                    ? DUI.text.xs(context, subtitle,
                        color: backgroundColor.calculateLuminance())
                    : SizedBox.shrink(),
              ],
            )),
      );
    }
    return InkWell(
      onTap: () {
        if (onTap != null) {
          onTap();
        }
      },
      child: Container(
          constraints: BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width / 2,
          ),
          padding: EdgeInsets.all(DUI.spacing.lateralPaddingValue),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.background,
            border: Border.all(
                color: Theme.of(context).colorScheme.background,
                width: DUI.spacing.borderWidth),
            borderRadius: BorderRadius.circular(DUI.spacing.borderRadius),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: DUI.text.title1(context, value),
                  ),
                  icon == null ? SizedBox.shrink() : Icon(icon),
                ],
              ),
              DUI.spacing.spacer(small: true),
              GestureDetector(
                onTap: onInfoTap != null
                    ? () {
                        onInfoTap();
                      }
                    : null,
                child: Container(
                  width: double.infinity,
                  color: Colors.transparent,
                  child: Row(
                    children: [
                      Flexible(
                        child: DUI.text.regular(context, title,
                            bold: true,
                            color:
                                Theme.of(context).textTheme.bodyMedium!.color,
                            maxLines: 1),
                      ),
                      DUI.spacing.hSpacer(small: true),
                      onInfoTap != null
                          ? Icon(
                              Icons.info_outline_rounded,
                              size: 12,
                            )
                          : SizedBox.shrink(),
                    ],
                  ),
                ),
              )
            ],
          )),
    );
  }
}
