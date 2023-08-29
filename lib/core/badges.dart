import 'package:cityxerpa_icons/cityxerpa_symbols.dart';
import 'package:dalai/common_utils/color_extension.dart';
import 'package:flutter/material.dart';

import '../dalai.dart';

enum BadgeHierarchy { primary, secondary }

enum BadgeColor { primary, secondary, white, error, cream }

class DalaiBadges {
  Widget badgeSolid(BuildContext context, String? text,
      {CXIcon? icon,
      BadgeColor color = BadgeColor.primary,
      BadgeHierarchy? hierarchy = BadgeHierarchy.primary}) {
    Color bgColor = _getBGColor(context, color);

    return Container(
      padding: const EdgeInsets.only(left: 6, right: 6, top: 3, bottom: 1),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Dalai.spacing.borderRadius / 2),
          color: hierarchy == BadgeHierarchy.primary
              ? bgColor
              : bgColor.lighten()),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          icon != null
              ? Padding(
                  padding: EdgeInsets.only(bottom: 2),
                  child: Dalai.icon.dalaiIcons(context, icon,
                      size: CXIconSize.x_small,
                      mainColor: (hierarchy == BadgeHierarchy.primary
                              ? bgColor
                              : bgColor.lighten())
                          .calculateLuminance()),
                )
              : const SizedBox.shrink(),
          icon != null && text != null
              ? Dalai.spacing.hSpacer(small: true)
              : const SizedBox.shrink(),
          text == null
              ? SizedBox.shrink()
              : Dalai.text.xs(context, text,
                  bold: true,
                  color: (hierarchy == BadgeHierarchy.primary
                          ? bgColor
                          : bgColor.lighten())
                      .calculateLuminance())
        ],
      ),
    );
  }

  Widget badgeOutline(BuildContext context, String? text,
      {CXIcon? icon,
      BadgeColor color = BadgeColor.primary,
      BadgeHierarchy? hierarchy = BadgeHierarchy.primary}) {
    Color outlineColor = _getBGColor(context, color);
    Color bgColor = hierarchy == BadgeHierarchy.primary
        ? Colors.transparent
        : outlineColor.withOpacity(0.1);

    return Container(
      padding: const EdgeInsets.only(left: 6, right: 6, top: 3, bottom: 2),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Dalai.spacing.borderRadius / 2),
          border: Border.all(color: outlineColor, width: 1.5),
          color: bgColor),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          icon != null
              ? Dalai.icon.dalaiIcons(context, icon,
                  size: CXIconSize.x_small, mainColor: outlineColor)
              : const SizedBox.shrink(),
          icon != null && text != null
              ? Dalai.spacing.hSpacer(small: true)
              : const SizedBox.shrink(),
          text == null
              ? SizedBox.shrink()
              : Dalai.text.xs(context, text, bold: true, color: outlineColor)
        ],
      ),
    );
  }

  Widget tagSolid(BuildContext context, String? text,
      {CXIcon? icon,
      BadgeColor color = BadgeColor.primary,
      BadgeHierarchy? hierarchy = BadgeHierarchy.primary,
      Function? onDelete,
      Function? onTap}) {
    Color bgColor = _getBGColor(context, color);

    return GestureDetector(
      onTap: () {
        if (onTap != null) {
          onTap();
        }
      },
      child: Chip(
        side: BorderSide(
            color: hierarchy == BadgeHierarchy.primary
                ? bgColor
                : bgColor.withOpacity(0.1),
            width: 1.5),
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        labelPadding: EdgeInsets.zero,
        padding: EdgeInsets.only(
            left: Dalai.spacing.lateralPaddingValue,
            right: Dalai.spacing.lateralPaddingValue,
            top: Dalai.spacing.lateralPaddingValue / 2 + 2,
            bottom: Dalai.spacing.lateralPaddingValue / 2),
        backgroundColor:
            bgColor.withOpacity(hierarchy == BadgeHierarchy.primary ? 1 : 0.1),
        label: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            icon != null
                ? Dalai.icon.dalaiIcons(context, icon,
                    size: CXIconSize.x_small,
                    mainColor: bgColor.calculateLuminance())
                : const SizedBox.shrink(),
            icon != null && text != null
                ? Dalai.spacing.hSpacer(small: true)
                : const SizedBox.shrink(),
            text == null
                ? SizedBox.shrink()
                : Dalai.text.xs(context, text,
                    bold: true, color: bgColor.calculateLuminance())
          ],
        ),
        onDeleted: onDelete != null
            ? () {
                onDelete();
              }
            : null,
        deleteIconColor: bgColor.calculateLuminance(),
        deleteIcon: Padding(
          padding: EdgeInsets.only(
              left: Dalai.spacing.lateralPaddingValue / 2, bottom: 2),
          child: Dalai.icon.dalaiIcons(context, CXIcon.xmark_circle,
              size: CXIconSize.x_small,
              mainColor: bgColor.calculateLuminance()),
        ),
      ),
    );
  }

  Widget tagOutline(BuildContext context, String? text,
      {CXIcon? icon,
      BadgeColor color = BadgeColor.primary,
      BadgeHierarchy? hierarchy = BadgeHierarchy.primary,
      Function? onDelete,
      Function? onTap}) {
    Color outlineColor = _getBGColor(context, color);
    Color bgColor = hierarchy == BadgeHierarchy.primary
        ? Colors.transparent
        : outlineColor.withOpacity(0.1);

    return GestureDetector(
      onTap: () {
        if (onTap != null) {
          onTap();
        }
      },
      child: Chip(
        side: BorderSide(color: outlineColor, width: 1.5),
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        labelPadding: EdgeInsets.zero,
        padding: EdgeInsets.only(
            left: Dalai.spacing.lateralPaddingValue,
            right: Dalai.spacing.lateralPaddingValue,
            top: Dalai.spacing.lateralPaddingValue / 2 + 2,
            bottom: Dalai.spacing.lateralPaddingValue / 2),
        backgroundColor: bgColor,
        label: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            icon != null
                ? Dalai.icon.dalaiIcons(context, icon,
                    size: CXIconSize.x_small, mainColor: outlineColor)
                : const SizedBox.shrink(),
            icon != null && text != null
                ? Dalai.spacing.hSpacer(small: true)
                : const SizedBox.shrink(),
            text == null
                ? SizedBox.shrink()
                : Dalai.text.xs(context, text, bold: true, color: outlineColor)
          ],
        ),
        onDeleted: onDelete != null
            ? () {
                onDelete();
              }
            : null,
        deleteIconColor: outlineColor,
        deleteIcon: Padding(
          padding: EdgeInsets.only(
              left: Dalai.spacing.lateralPaddingValue / 2, bottom: 2),
          child: Dalai.icon.dalaiIcons(context, CXIcon.xmark_circle,
              size: CXIconSize.x_small, mainColor: outlineColor),
        ),
      ),
    );
  }

  Color _getBGColor(BuildContext context, BadgeColor color) {
    switch (color) {
      case BadgeColor.primary:
        return Theme.of(context).colorScheme.primary;
      case BadgeColor.secondary:
        return Theme.of(context).colorScheme.secondary;
      case BadgeColor.white:
        return Theme.of(context).colorScheme.background;
      case BadgeColor.error:
        return Dalai.color.error;
      case BadgeColor.cream:
        return Dalai.color.cream;
      default:
        return Theme.of(context).colorScheme.primary;
    }
  }
}
