import 'package:dui/common_utils/color_extension.dart';
import 'package:flutter/material.dart';

import '../dui.dart';

enum BadgeHierarchy { primary, secondary }

enum BadgeColor { primary, secondary, white, error }

class DUIBadge {
  Widget badgeSolid(BuildContext context, String? text,
      {IconData? icon,
      BadgeColor color = BadgeColor.primary,
      BadgeHierarchy? hierarchy = BadgeHierarchy.primary}) {
    Color bgColor = _getBGColor(context, color);

    return Container(
      padding: const EdgeInsets.only(left: 6, right: 6, top: 3, bottom: 1),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(DUI.spacing.borderRadius / 2),
          color: hierarchy == BadgeHierarchy.primary
              ? bgColor
              : bgColor.lighten()),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          icon != null
              ? Padding(
                  padding: EdgeInsets.only(bottom: 2),
                  child: Icon(icon,
                      size: 12,
                      color: (hierarchy == BadgeHierarchy.primary
                              ? bgColor
                              : bgColor.lighten())
                          .calculateLuminance()),
                )
              : const SizedBox.shrink(),
          icon != null && text != null
              ? DUI.spacing.hSpacer(small: true)
              : const SizedBox.shrink(),
          text == null
              ? SizedBox.shrink()
              : DUI.text.xs(context, text,
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
      {IconData? icon,
      BadgeColor color = BadgeColor.primary,
      BadgeHierarchy? hierarchy = BadgeHierarchy.primary}) {
    Color outlineColor = _getBGColor(context, color);
    Color bgColor = hierarchy == BadgeHierarchy.primary
        ? Colors.transparent
        : outlineColor.withOpacity(0.1);

    return Container(
      padding: const EdgeInsets.only(left: 6, right: 6, top: 3, bottom: 2),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(DUI.spacing.borderRadius / 2),
          border: Border.all(color: outlineColor, width: 1.5),
          color: bgColor),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          icon != null
              ? Icon(icon, size: 12, color: outlineColor)
              : const SizedBox.shrink(),
          icon != null && text != null
              ? DUI.spacing.hSpacer(small: true)
              : const SizedBox.shrink(),
          text == null
              ? SizedBox.shrink()
              : DUI.text.xs(context, text, bold: true, color: outlineColor)
        ],
      ),
    );
  }

  Widget tagSolid(BuildContext context, String? text,
      {IconData? icon,
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
            left: DUI.spacing.lateralPaddingValue,
            right: DUI.spacing.lateralPaddingValue,
            top: DUI.spacing.lateralPaddingValue / 2 + 2,
            bottom: DUI.spacing.lateralPaddingValue / 2),
        backgroundColor:
            bgColor.withOpacity(hierarchy == BadgeHierarchy.primary ? 1 : 0.1),
        label: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            icon != null
                ? Icon(icon, size: 12, color: bgColor.calculateLuminance())
                : const SizedBox.shrink(),
            icon != null && text != null
                ? DUI.spacing.hSpacer(small: true)
                : const SizedBox.shrink(),
            text == null
                ? SizedBox.shrink()
                : DUI.text.xs(context, text,
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
              left: DUI.spacing.lateralPaddingValue / 2, bottom: 2),
          child:
              Icon(Icons.clear, size: 12, color: bgColor.calculateLuminance()),
        ),
      ),
    );
  }

  Widget tagOutline(BuildContext context, String? text,
      {IconData? icon,
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
            left: DUI.spacing.lateralPaddingValue,
            right: DUI.spacing.lateralPaddingValue,
            top: DUI.spacing.lateralPaddingValue / 2 + 2,
            bottom: DUI.spacing.lateralPaddingValue / 2),
        backgroundColor: bgColor,
        label: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            icon != null
                ? Icon(icon, size: 12, color: outlineColor)
                : const SizedBox.shrink(),
            icon != null && text != null
                ? DUI.spacing.hSpacer(small: true)
                : const SizedBox.shrink(),
            text == null
                ? SizedBox.shrink()
                : DUI.text.xs(context, text, bold: true, color: outlineColor)
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
              left: DUI.spacing.lateralPaddingValue / 2, bottom: 2),
          child: Icon(Icons.clear, size: 12, color: outlineColor),
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
        return DUI.color.error;
      default:
        return Theme.of(context).colorScheme.primary;
    }
  }
}
