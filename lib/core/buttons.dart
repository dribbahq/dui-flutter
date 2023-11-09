import 'package:custom_sliding_segmented_control/custom_sliding_segmented_control.dart';
import 'package:dui/core/theme.dart';
import 'package:flutter/material.dart';
import '../common_utils/common_utils.dart';
import '../dui.dart';
import 'external/button.dart';
import 'external/custom_switch.dart';

class DUIButton {
  final double buttonMinHeight = 64.0;
  final double smallButtonMinHeight = 42.0;

  Widget button(BuildContext context, String? text, Function? onPressed,
      {IconData? icon,
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
      {IconData? icon,
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
      {IconData? icon,
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
      {IconData? icon,
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
      {IconData? icon,
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
                  Radius.circular(DUI.spacing.smallBorderRadius)),
            ),
            padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 8),
            child: DUI.text.title3(context, qty.toString(),
                color: Theme.of(context).colorScheme.onPrimary),
          )
        : const SizedBox.shrink();
  }

  Widget buttonPriceTrailing(BuildContext context, double? price,
      {required String freeText, required String amountInEurosText}) {
    return DUI.text.title3(
        context,
        price == 0
            ? freeText
            : amountInEurosText.replaceAll('%@', Utils.parsePrice(price)),
        color: Theme.of(context).colorScheme.onPrimary);
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
                    left: DUI.spacing.lateralPaddingValue,
                    right: DUI.spacing.lateralPaddingValue,
                    top: DUI.spacing.lateralPaddingValue,
                    bottom: 10),
                decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.background,
                    borderRadius:
                        BorderRadius.circular(DUI.spacing.borderRadius),
                    border: Border.all(
                        color: Theme.of(context)
                            .textTheme
                            .bodyMedium!
                            .color!
                            .withOpacity(0.2),
                        width: DUI.spacing.borderWidth)),
                child: DUI.text.small(
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

  Widget iconButton(BuildContext context, IconData icon,
      {Function? onTap, bool filled = false, Color? iconColor}) {
    return ElevatedButton(
        onPressed: () {
          if (onTap != null) onTap();
        },
        style: ButtonStyle(
          elevation: MaterialStateProperty.all(filled ? 2 : 0),
          shape: MaterialStateProperty.all(CircleBorder()),
          padding: MaterialStateProperty.all(
              EdgeInsets.all(DUI.spacing.lateralPaddingValue)),
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
        child: Icon(
          icon,
          color: iconColor ?? Theme.of(context).colorScheme.primary,
        ));
  }

  Widget backButtonCircle(BuildContext context,
      {Function? onTap, bool filled = false}) {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 4),
        child: iconButton(context, Icons.arrow_forward_rounded, onTap: () {
          if (onTap != null) {
            onTap();
          }
          Navigator.pop(context);
        }));
  }

  Widget appBarActionButtonCircle(BuildContext context, IconData icon,
      {Function? onTap, bool loading = false}) {
    return Container(
      margin: EdgeInsets.only(right: DUI.spacing.lateralPaddingValue),
      child: Ink(
        decoration: ShapeDecoration(
          color: Theme.of(context).colorScheme.background,
          shape: const CircleBorder(),
        ),
        child: IconButton(
          icon: loading
              ? DUI.misc.loadingAnimation(context, size: 16)
              : Icon(icon),
          onPressed: () async {
            if (onTap != null) {
              onTap();
            }
          },
        ),
      ),
    );
  }

  Widget checkbox(
      bool isSelected, Function(bool) onChange, BuildContext context) {
    var size = 26.0;
    return Material(
      borderRadius: BorderRadius.circular(DUI.spacing.smallBorderRadius + 4),
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
                    height: size - 4,
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(6),
                      border: Border.all(
                          color: Theme.of(context).textTheme.bodyMedium!.color!,
                          width: 2.0),
                    )),
                isSelected
                    ? Container(
                        width: size - 14,
                        height: size - 14,
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.primary,
                          borderRadius: BorderRadius.circular(2),
                        ))
                    : SizedBox.shrink(),
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
          borderRadius: BorderRadius.circular(DUI.spacing.borderRadius + 2),
        ),
        thumbDecoration: BoxDecoration(
          color: Theme.of(context).colorScheme.background,
          borderRadius: BorderRadius.circular(DUI.spacing.borderRadius - 0.5),
        ),
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInToLinear,
        onValueChanged: (v) {
          onChange(v);
        },
      ),
    );
  }

  Widget dataSelector(BuildContext context, String? title, String? headerTitle,
      Function() onChange,
      {bool loading = false, bool forceDark = false}) {
    return GestureDetector(
      onTap: onChange,
      child: Container(
        padding: EdgeInsets.symmetric(
            horizontal: DUI.spacing.lateralPaddingValue,
            vertical: DUI.spacing.lateralPaddingValue / 2),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(DUI.spacing.borderRadius),
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
                    ? DUI.text.xs(context, headerTitle,
                        color: forceDark ? DUI.color.smallTextDarkMode : null)
                    : SizedBox.shrink(),
                DUI.text.regular(context, title ?? "",
                    bold: true,
                    color: forceDark ? DUI.color.textDarkMode : null),
              ],
            )),
            Icon(
              Icons.keyboard_arrow_down_rounded,
              size: 14.0,
              color: forceDark ? DUI.color.textDarkMode : null,
            ),
          ],
        ),
      ),
    );
  }
}
