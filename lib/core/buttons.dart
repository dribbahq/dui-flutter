import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cityxerpa_icons/cityxerpa_symbols.dart';
import 'package:custom_sliding_segmented_control/custom_sliding_segmented_control.dart';
import 'package:dalai/core/external/custom_stepper.dart';
import 'package:flutter/material.dart';
import '../common_utils/common_utils.dart';
import '../dalai.dart';
import 'external/button.dart';
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
      bool loading = false}) {
    return CustomButton(
      text: text,
      onPressed: onPressed,
      icon: icon,
      leading: leading,
      trailing: trailing,
      content: content,
      color: color,
      textColor: textColor,
      loading: loading,
    );
  }

  Widget shadowButton(BuildContext context, String? text, Function? onPressed,
      {CXIcon? icon,
      Widget? leading,
      Widget? trailing,
      Widget? content,
      Color? color,
      bool loading = false}) {
    return CustomButton(
      text: text,
      onPressed: onPressed,
      icon: icon,
      leading: leading,
      trailing: trailing,
      content: content,
      color: Theme.of(context).textTheme.bodyMedium!.color!.withOpacity(0.1),
      textColor: color ?? Theme.of(context).textTheme.bodyMedium!.color,
      loading: loading,
    );
  }

  Widget noBgButton(BuildContext context, String? text, Function? onPressed,
      {CXIcon? icon,
      Widget? leading,
      Widget? trailing,
      Widget? content,
      Color? color,
      bool loading = false}) {
    return CustomButton(
      text: text,
      onPressed: onPressed,
      icon: icon,
      leading: leading,
      trailing: trailing,
      content: content,
      color: Colors.transparent,
      textColor: color ?? Theme.of(context).colorScheme.primary,
      loading: loading,
    );
  }

  Widget outlineButton(BuildContext context, String? text, Function? onPressed,
      {CXIcon? icon,
      Widget? leading,
      Widget? trailing,
      Widget? content,
      Color? color,
      Color? bgColor,
      bool loading = false}) {
    return CustomButton(
      text: text,
      onPressed: onPressed,
      icon: icon,
      leading: leading,
      trailing: trailing,
      content: content,
      color: color,
      textColor: color ?? Theme.of(context).colorScheme.primary,
      loading: loading,
      outlined: true,
    );
  }

  Widget smallButton(BuildContext context, String? text, Function? onPressed,
      {CXIcon? icon,
      Color? color,
      Color? bgColor,
      bool loading = false,
      bool expand = false}) {
    return CustomButton(
      text: text,
      onPressed: onPressed,
      icon: icon,
      color: color,
      textColor: color ?? Theme.of(context).colorScheme.primary,
      loading: loading,
      small: true,
      expanded: expand,
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
                    left: Dalai.spacing.lateralPaddingValue,
                    right: Dalai.spacing.lateralPaddingValue,
                    top: Dalai.spacing.lateralPaddingValue,
                    bottom: 10),
                decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.background,
                    borderRadius:
                        BorderRadius.circular(Dalai.spacing.borderRadius),
                    border: Border.all(
                        color: Theme.of(context)
                            .textTheme
                            .bodyMedium!
                            .color!
                            .withOpacity(0.2),
                        width: Dalai.spacing.borderWidth)),
                child: Dalai.text.small(
                    context,
                    addMoreToRequestText.replaceAll(
                        "%@", Utils.parsePrice(minPrice - currentPrice)),
                    textAlign: TextAlign.start,
                    bold: true),
              ),
            ],
          )
        : const SizedBox.shrink();
  }

  Widget iconButton(BuildContext context, CXIcon icon,
      {Function? onTap, bool filled = false}) {
    return ElevatedButton(
      onPressed: () {
        if (onTap != null) onTap();
      },
      style: ButtonStyle(
        elevation: MaterialStateProperty.all(filled ? 2 : 0),
        shape: MaterialStateProperty.all(CircleBorder()),
        padding: MaterialStateProperty.all(
            EdgeInsets.all(Dalai.spacing.lateralPaddingValue)),
        backgroundColor: MaterialStateProperty.all(filled
            ? Theme.of(context).colorScheme.background
            : Colors.transparent),
        surfaceTintColor: MaterialStateProperty.all(filled
            ? Theme.of(context).colorScheme.background
            : Colors.transparent),
        overlayColor: MaterialStateProperty.resolveWith<Color?>((states) {
          if (states.contains(MaterialState.pressed) ||
              states.contains(MaterialState.hovered)) {
            return Theme.of(context)
                .textTheme
                .bodyMedium!
                .color!
                .withOpacity(0.1);
          }
          return null;
        }),
      ),
      child: Dalai.icon.dalaiIcons(context, icon),
    );
  }

  Widget backButtonCircle(BuildContext context,
      {Function? onTap, bool filled = false}) {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 4),
        child: iconButton(context, CXIcon.arrow_left, onTap: () {
          if (onTap != null) {
            onTap();
          }
          Navigator.pop(context);
        }));
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
              ? Dalai.misc.loadingAnimation(context, size: 16)
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
    var size = 26.0;
    return Material(
      borderRadius: BorderRadius.circular(Dalai.spacing.smallBorderRadius + 4),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      color: Colors.transparent,
      child: InkWell(
          child: Container(
            width: size,
            height: size,
            color: Colors.transparent,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Container(
                    width: size - 4,
                    height:  size - 4,
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(6),
                      border:
                      Border.all(color: Theme.of(context).textTheme.bodyMedium!.color!, width: 2.0),
                    )),
                isSelected ? Container(
                    width:  size - 14,
                    height:  size - 14,
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.primary,
                      borderRadius: BorderRadius.circular(2),
                    )) : SizedBox.shrink(),
              ],
            ),
          ),
          onTap: () {
            onChange(!isSelected);
          }),
    );
  }

  Widget toggle(
      bool isSelected, Function(bool) onChange, BuildContext context) {
    return StyledSwitch(
      onChange: onChange,
      enabled: isSelected,
    );
  }

  Widget slidingControl(
      int initialValue, Function(int) onChange, BuildContext context,
      {bool isStretch = true,
      required Map<int, Widget> children,
      double height = 60}) {
    return SizedBox(
      height: height,
      child: CustomSlidingSegmentedControl<int>(
        initialValue: initialValue,
        isStretch: isStretch,
        height: height,
        children: children,
        decoration: BoxDecoration(
          color:
              Theme.of(context).textTheme.bodyMedium!.color!.withOpacity(0.1),
          borderRadius: BorderRadius.circular(Dalai.spacing.borderRadius + 2),
        ),
        thumbDecoration: BoxDecoration(
          color: Theme.of(context).colorScheme.background,
          borderRadius: BorderRadius.circular(Dalai.spacing.borderRadius - 0.5),
        ),
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInToLinear,
        onValueChanged: (v) {
          onChange(v);
        },
      ),
    );
  }

  Widget stepper(BuildContext context, int initialValue,
      Function(int, bool underLowerLimit, bool overUpperLimit) onChange,
      {bool loading = false,
      String? appendString,
      String? customText,
      bool reduced = false,
      int? lowerLimit,
      int? upperLimit}) {
    return CustomStepper(
      lowerLimit: lowerLimit,
      upperLimit: upperLimit,
      initialValue: initialValue,
      loading: loading,
      reduced: reduced,
      appendString: appendString,
      customText: customText,
      onChange: (int value, bool underLowerLimit, bool overUpperLimit) {
        onChange(value, underLowerLimit, overUpperLimit);
      },
    );
  }

  Widget dataSelector(BuildContext context, String? title, String? headerTitle,
      Function() onChange,
      {bool loading = false, bool forceDark = false}) {
    return GestureDetector(
      onTap: onChange,
      child: Container(
        padding: EdgeInsets.symmetric(
            horizontal: Dalai.spacing.lateralPaddingValue,
            vertical: Dalai.spacing.lateralPaddingValue / 2),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Dalai.spacing.borderRadius),
        ),
        width: double.infinity,
        child: Row(
          children: [
            Expanded(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                headerTitle != null
                    ? Dalai.text.xs(context, headerTitle,
                        color: forceDark ? Dalai.color.smallTextDarkMode : null)
                    : SizedBox.shrink(),
                Dalai.text.regular(context, title ?? "",
                    bold: true,
                    color: forceDark ? Dalai.color.textDarkMode : null),
              ],
            )),
            Dalai.icon.dalaiIcons(context, CXIcon.chevron_down,
                size: CXIconSize.small,
                mainColor: forceDark ? Dalai.color.textDarkMode : null)
          ],
        ),
      ),
    );
  }
}
