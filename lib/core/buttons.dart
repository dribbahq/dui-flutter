import 'dart:io';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cityxerpa_icons/cityxerpa_symbols.dart';
import 'package:flutter/material.dart';
import '../common_utils/common_utils.dart';
import '../dalai.dart';
import 'external/custom_switch.dart';

class DalaiButtons {
  final double buttonMinHeight = 64.0;
  final double smallButtonMinHeight = 42.0;

  Widget button(BuildContext context, String? text, Function? onPressed,
      {CXIcon? icon,
      Widget? leading,
      Widget? trailing,
      Widget? content,
      Color? color,
      Color? textColor,
      bool? loading = false}) {
    return Container(
      height: buttonMinHeight,
      constraints: const BoxConstraints(
        minWidth: 200,
      ),
      child: ElevatedButton(
        onPressed: () {
          if (onPressed != null) {
            onPressed();
          }
        },
        style: ElevatedButton.styleFrom(
          elevation: 0,
          shadowColor: Colors.transparent,
          padding: Dalai.spacing.lateralPadding,
          backgroundColor: color ?? Theme.of(context).colorScheme.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(Dalai.spacing.borderRadius),
          ),
        ),
        child: loading!
            ? SizedBox(
                width: 24,
                height: 24,
                child: Center(
                    child: CircularProgressIndicator(
                  color: Dalai.color.primaryContrast,
                )))
            : Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  leading ?? const SizedBox.shrink(),
                  Expanded(
                      child: Center(
                    child: content ??
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            icon != null
                                ? Row(
                                    children: [
                                      Dalai.icon.dalaiIcons(
                                        context,
                                        icon,
                                        mainColor: textColor ??
                                            Dalai.color.primaryContrast,
                                      ),
                                      Dalai.spacing.hSpacer(small: true)
                                    ],
                                  )
                                : const SizedBox.shrink(),
                            text != null
                                ? Dalai.text.title3(context, text,
                                    color: textColor ??
                                        Dalai.color.primaryContrast)
                                : const SizedBox.shrink(),
                          ],
                        ),
                  )),
                  trailing ?? const SizedBox.shrink(),
                ],
              ),
      ),
    );
  }

  Widget noBgButton(BuildContext context, String? text, Function? onPressed,
      {CXIcon? icon,
      Widget? leading,
      Widget? trailing,
      Widget? content,
      Color? color,
      bool? loading = false}) {
    return Container(
      constraints: BoxConstraints(minWidth: 200, minHeight: buttonMinHeight),
      child: ElevatedButton(
          onPressed: () {
            if (onPressed != null) {
              onPressed();
            }
          },
          style: ElevatedButton.styleFrom(
            elevation: 0,
            shadowColor: Colors.transparent,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(Dalai.spacing.borderRadius),
            ),
            backgroundColor: Colors.transparent,
            foregroundColor: Dalai.color.primaryOutlinedNestingBackground,
            padding: Dalai.spacing.lateralPadding,
          ),
          child: loading!
              ? SizedBox(
                  width: 24,
                  height: 24,
                  child: Center(
                      child: CircularProgressIndicator(
                    color: Dalai.color.primaryContrast,
                  )))
              : Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    leading ?? const SizedBox.shrink(),
                    Expanded(
                        child: Center(
                      child: content ??
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              icon != null
                                  ? Row(
                                      children: [
                                        Dalai.icon.dalaiIcons(
                                          context,
                                          icon,
                                          mainColor: color ??
                                              Theme.of(context)
                                                  .colorScheme
                                                  .primary,
                                        ),
                                        Dalai.spacing.hSpacer(small: true)
                                      ],
                                    )
                                  : const SizedBox.shrink(),
                              text != null
                                  ? Dalai.text.title3(
                                      context,
                                      text,
                                      color: color ??
                                          Theme.of(context).colorScheme.primary,
                                    )
                                  : const SizedBox.shrink(),
                            ],
                          ),
                    )),
                    trailing ?? const SizedBox.shrink(),
                  ],
                )),
    );
  }

  Widget outlineButton(BuildContext context, String? text, Function? onPressed,
      {CXIcon? icon,
      Widget? leading,
      Widget? trailing,
      Widget? content,
      Color? color,
      Color? bgColor,
      bool? loading = false}) {
    return Container(
      constraints: BoxConstraints(minWidth: 200, minHeight: buttonMinHeight),
      child: ElevatedButton(
          onPressed: () {
            if (onPressed != null) {
              onPressed();
            }
          },
          style: ElevatedButton.styleFrom(
            elevation: 0,
            shadowColor: Colors.transparent,
            backgroundColor: bgColor ?? Colors.transparent,
            foregroundColor: Dalai.color.primaryOutlinedNestingBackground,
            padding: Dalai.spacing.lateralPadding,
            shape: RoundedRectangleBorder(
              side: BorderSide(
                  color: color ?? Theme.of(context).colorScheme.primary,
                  width: 2),
              borderRadius: BorderRadius.circular(Dalai.spacing.borderRadius),
            ),
          ),
          child: loading!
              ? SizedBox(
                  width: 24,
                  height: 24,
                  child: Center(
                      child: CircularProgressIndicator(
                    color: Dalai.color.primaryContrast,
                  )))
              : Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    leading ?? const SizedBox.shrink(),
                    Expanded(
                        child: Center(
                      child: content ??
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              icon != null
                                  ? Row(
                                      children: [
                                        Dalai.icon.dalaiIcons(
                                          context,
                                          icon,
                                          mainColor: color ??
                                              Theme.of(context)
                                                  .colorScheme
                                                  .primary,
                                        ),
                                        Dalai.spacing.hSpacer(small: true)
                                      ],
                                    )
                                  : const SizedBox.shrink(),
                              text != null
                                  ? Dalai.text.title3(
                                      context,
                                      text,
                                      color: color ??
                                          Theme.of(context).colorScheme.primary,
                                    )
                                  : const SizedBox.shrink(),
                            ],
                          ),
                    )),
                    trailing ?? const SizedBox.shrink(),
                  ],
                )),
    );
  }

  Widget smallButton(BuildContext context, String? text, Function? onPressed,
      {CXIcon? icon,
      Color? color,
      Color? bgColor,
      bool? loading = false,
      bool expand = false}) {
    return SizedBox(
      width: expand ? double.infinity : null,
      child: ElevatedButton(
          onPressed: () {
            if (onPressed != null) {
              onPressed();
            }
          },
          style: ElevatedButton.styleFrom(
            elevation: 0,
            shadowColor: Colors.transparent,
            backgroundColor: bgColor ?? Colors.transparent,
            foregroundColor: Dalai.color.primaryOutlinedNestingBackground,
            padding: Dalai.spacing.lateralPadding,
            shape: RoundedRectangleBorder(
              side: BorderSide(
                  color: color ??
                      Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .color!
                          .withOpacity(0.2), //TODO
                  width: 1),
              borderRadius: BorderRadius.circular(Dalai.spacing.borderRadius),
            ),
          ),
          child: loading!
              ? SizedBox(
                  width: 24,
                  height: 24,
                  child: Center(
                      child: CircularProgressIndicator(
                    color: Dalai.color.primaryContrast,
                  )))
              : Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    icon != null
                        ? Row(
                            children: [
                              Dalai.icon.dalaiIcons(context, icon,
                                  mainColor: color, size: CXIconSize.x_small),
                              Dalai.spacing.hSpacer(small: true)
                            ],
                          )
                        : const SizedBox.shrink(),
                    text != null
                        ? Dalai.text
                            .small(context, text, color: color, bold: true)
                        : const SizedBox.shrink(),
                  ],
                )),
    );
  }

  Widget buttonQtyLeading(
    BuildContext context,
    int? qty,
  ) {
    return qty! > 0
        ? Container(
            decoration: BoxDecoration(
              color: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .color!
                  .withOpacity(0.2),
              borderRadius: BorderRadius.all(
                  Radius.circular(Dalai.spacing.smallBorderRadius)),
            ),
            padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 8),
            child: Dalai.text.title3(context, qty.toString(),
                color: Dalai.color.primaryContrast),
          )
        : const SizedBox.shrink();
  }

  Widget buttonPriceTrailing(BuildContext context, double? price,
      {required String freeText, required String amountInEurosText}) {
    return Dalai.text.title3(
        context,
        price == 0
            ? freeText
            : amountInEurosText.replaceAll('%@', Utils.parsePrice(price)),
        color: Dalai.color.primaryContrast);
  }

  Widget buttonMinPriceWidget(BuildContext context,
      {double? minPrice,
      double? currentPrice,
      required String addMoreToRequestText}) {
    return minPrice != null && currentPrice != null && (minPrice > currentPrice)
        ? Column(
            children: [
              Container(
                padding: EdgeInsets.only(
                    left: 2 * Dalai.spacing.lateralPaddingValue,
                    right: 2 * Dalai.spacing.lateralPaddingValue,
                    top: Dalai.spacing.lateralPaddingValue,
                    bottom: 12),
                decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.background,
                    borderRadius: BorderRadius.circular(40),
                    border: Border.all(
                        color: Colors.black.withOpacity(0.1), width: 1.5)),
                child: Dalai.text.xs(
                    context,
                    addMoreToRequestText.replaceAll(
                        "%@", Utils.parsePrice(minPrice - currentPrice)),
                    textAlign: TextAlign.start),
              ),
            ],
          )
        : const SizedBox.shrink();
  }

  Widget backButtonCircle(BuildContext context, {Function? onTap}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Ink(
        decoration: ShapeDecoration(
          color: Theme.of(context).colorScheme.background,
          shape: const CircleBorder(),
        ),
        child: IconButton(
          icon: Dalai.icon.dalaiIcons(context, CXIcon.arrow_left),
          onPressed: () async {
            if (onTap != null) {
              onTap();
            }
            Navigator.pop(context);
          },
        ),
      ),
    );
  }

  Widget appBarActionButtonCircle(BuildContext context, CXIcon icon,
      {Function? onTap, bool loading = false}) {
    return Container(
      margin: EdgeInsets.only(right: Dalai.spacing.lateralPaddingValue),
      child: Ink(
        decoration: ShapeDecoration(
          color: Theme.of(context).colorScheme.background,
          shape: const CircleBorder(),
        ),
        child: IconButton(
          icon: loading
              ? const AspectRatio(
                  aspectRatio: 1,
                  child: Center(
                    child: SizedBox(
                        width: 24,
                        height: 24,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                        )),
                  ))
              : Dalai.icon.dalaiIcons(context, icon),
          onPressed: () async {
            if (onTap != null) {
              onTap();
            }
          },
        ),
      ),
    );
  }

  Widget filterCategoryButton(BuildContext context,
      {required dynamic category, required bool isSelected}) {
    return Column(
      children: [
        Expanded(
          child: Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(
                vertical: Dalai.spacing.lateralPaddingValue / 2),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dalai.spacing.borderRadius),
                color: isSelected
                    ? Theme.of(context).colorScheme.background
                    : Theme.of(context).scaffoldBackgroundColor,
                border: Border.all(
                    width: 2,
                    color: isSelected
                        ? Theme.of(context).colorScheme.primary
                        : Theme.of(context).scaffoldBackgroundColor)),
            child: category.icon != null
                ? CachedNetworkImage(
                    imageUrl: category.icon!.mediaLink!,
                  )
                : Dalai.icon.dalaiIcons(
                    context,
                    CXIcon.camera,
                    size: CXIconSize.large,
                    mainColor: Theme.of(context).colorScheme.secondary,
                  ),
          ),
        ),
        Dalai.spacing.spacer(small: true),
        SizedBox(
          height: 34,
          child: Align(
            alignment: Alignment.topCenter,
            child: AutoSizeText(
              category.getName()!,
              maxFontSize: Dalai.text.smallText,
              minFontSize: Dalai.text.xsText,
              maxLines: 2,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'metropolis',
                color: Theme.of(context).textTheme.bodySmall!.color,
                fontWeight: Dalai.text.regularWeight,
                height: Dalai.text.textHeight,
              ),
            ),
          ),
        )
      ],
    );
  }

  Widget checkbox(
      bool isSelected, Function(bool) onChange, BuildContext context) {
    return GestureDetector(
        child: Container(
            child: isSelected
                ? Dalai.icon.dalaiIcons(context, CXIcon.checkbox_on,
                    secondaryColor: Dalai.color.primary)
                : Dalai.icon.dalaiIcons(context, CXIcon.checkbox)),
        onTap: () {
          onChange(!isSelected);
        });
  }

  Widget toggle(bool isSelected, Function(bool) onChange, BuildContext context) {
    return StyledSwitch(
      onChange: onChange,
      enabled: isSelected,
    );
  }
}
