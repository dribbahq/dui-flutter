import 'package:cityxerpa_icons/cityxerpa_symbols.dart';
import 'package:flutter/material.dart';
import 'package:substring_highlight/substring_highlight.dart';

import '../dalai.dart';

class DalaiTiles {
  Widget listTile(String text, BuildContext context, Function() onTap,
      {EdgeInsets? padding, Color? colorText, bool? loading = false, Widget? leading, Widget? trailing,}) {
    return Material(
      color: Dalai.color.white,
      child: ListTile(
        tileColor: Theme
            .of(context)
            .colorScheme
            .background,
        contentPadding: padding ??
            EdgeInsets.symmetric(
                horizontal: Dalai.spacing.lateralPaddingValue, vertical: 0),
        title: Text(
          text,
          style: TextStyle(
              fontSize: Dalai.text.regularText,
              color:
              colorText ?? Theme
                  .of(context)
                  .textTheme
                  .bodyMedium!
                  .color),
        ),
        trailing: loading!
            ? const SizedBox(
          width: 18,
          height: 18,
          child: Center(
            child: CircularProgressIndicator(
              strokeWidth: 2,
            ),
          ),
        )
            : trailing ??  Dalai.icon.dalaiIcons(
          context,
          CXIcon.chevron_right,
          size: CXIconSize.small,
          mainColor: Theme
              .of(context)
              .textTheme
              .bodyMedium!
              .color,
        ),
        leading: leading,
        onTap: onTap,
      ),
    );
  }

  Widget listTileWithSub(String title, BuildContext context, String subtitle,
      {EdgeInsets? padding, Color? colorText, Function()? onTap, Widget? leading, Widget? trailing,}) {
    return Material(
      color: Dalai.color.white,
      child: ListTile(
        onTap: onTap,
        leading: leading,
        trailing: trailing ?? Dalai.icon.dalaiIcons(
          context,
          CXIcon.chevron_right,
          size: CXIconSize.small,
          mainColor: Theme
              .of(context)
              .textTheme
              .bodyMedium!
              .color,
        ),
        tileColor: Theme
            .of(context)
            .colorScheme
            .background,
        contentPadding: padding ??
            EdgeInsets.symmetric(
                horizontal: Dalai.spacing.lateralPaddingValue, vertical: 0),
        title: Text(
          title,
          style: TextStyle(
              fontSize: Dalai.text.h3,
              fontWeight: Dalai.text.semiBoldWeight,
              color:
              colorText ?? Theme
                  .of(context)
                  .textTheme
                  .bodyMedium!
                  .color),
        ),
        subtitle: Text(
          subtitle,
          style: TextStyle(
              fontSize: Dalai.text.regularText,
              color:
              colorText ?? Theme
                  .of(context)
                  .textTheme
                  .bodyMedium!
                  .color),
          textAlign: TextAlign.start,
        ),
      ),
    );
  }

  Widget listTileCustomImage(Widget leading, BuildContext context, String title,
      Function() onTap) {
    return Material(
      child: Container(
        color: Theme
            .of(context)
            .colorScheme
            .background,
        child: InkWell(
            splashColor: Colors.red,
            focusColor: Colors.red,
            highlightColor: Colors.red,
            hoverColor: Colors.red,
            onTap: onTap,
            child: Padding(
              padding: EdgeInsets.only(
                  left: Dalai.spacing.lateralPaddingValue,
                  right: Dalai.spacing.lateralPaddingValue,
                  top: 16,
                  bottom: 16),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    leading,
                    Dalai.spacing.hSpacer(),
                    Expanded(
                      child: Dalai.text.regular(context, title, maxLines: 2),
                    ),
                    CityXerpaIcons.get(CXIcon.chevron_right,
                        size: CXIconSize.small),
                  ]),
            )),
      ),
    );
  }

  Widget listSearchTileCustomImage(CXIcon leading, BuildContext context,
      String title, Function() onTap,
      {String? searchText,
        double? imageSize,
        Color? imageColor,
        bool loading = false}) {
    TextStyle selectedTextStyle = TextStyle(
      fontSize: Dalai.text.h3,
      height: Dalai.text.textHeight,
      fontWeight: Dalai.text.boldWeight,
      fontFamily: 'metropolis',
      color: Theme
          .of(context)
          .textTheme
          .bodyMedium!
          .color,
    );
    TextStyle unselectedTextStyle = TextStyle(
      fontSize: Dalai.text.h3,
      height: Dalai.text.textHeight,
      fontWeight: Dalai.text.regularWeight,
      fontFamily: 'metropolis',
      color: searchText != null && searchText.isNotEmpty
          ? Theme
          .of(context)
          .textTheme
          .bodyMedium!
          .color!
          .withOpacity(0.7)
          : Theme
          .of(context)
          .textTheme
          .bodyMedium!
          .color,
    );

    return Material(
      color: Dalai.color.white,
      child: Container(
        height: 64,
        color: Theme
            .of(context)
            .colorScheme
            .background,
        child: InkWell(
            onTap: onTap,
            child: Padding(
              padding: EdgeInsets.only(
                  left: Dalai.spacing.lateralPaddingValue,
                  right: Dalai.spacing.lateralPaddingValue,
                  top: 0,
                  bottom: 0),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Dalai.icon.dalaiIcons(
                      context,
                      leading,
                      mainColor: imageColor ??
                          Theme
                              .of(context)
                              .textTheme
                              .bodyMedium!
                              .color,
                    ),
                    Dalai.spacing.hSpacer(),
                    Expanded(
                        child: SubstringHighlight(
                          text: title,
                          term: searchText,
                          textStyle: unselectedTextStyle,
                          textStyleHighlight: selectedTextStyle,
                        )),
                    Dalai.spacing.hSpacer(),
                    loading
                        ? const SizedBox(
                      width: 18,
                      height: 18,
                      child: Center(
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                        ),
                      ),
                    )
                        : Dalai.icon.dalaiIcons(
                      context,
                      CXIcon.chevron_right,
                      size: CXIconSize.small,
                      mainColor:
                      Theme
                          .of(context)
                          .textTheme
                          .bodyMedium!
                          .color,
                    ),
                  ]),
            )),
      ),
    );
  }
}
