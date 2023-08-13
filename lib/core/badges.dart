import 'package:cityxerpa_icons/cityxerpa_symbols.dart';
import 'package:flutter/material.dart';

import '../dalai.dart';


enum BadgeHierarchy{primary, secondary}
enum BadgeColor{primary, secondary, white, error, cream}

class DalaiBadges{

  Widget badgeSolid(BuildContext context, String text, {CXIcon? icon, BadgeColor color = BadgeColor.primary, BadgeHierarchy? hierarchy = BadgeHierarchy.primary}){
    Color bgColor = _getBGColor(context, color);
    Color contentColor = hierarchy == BadgeHierarchy.primary ? _getContentColor(context, color) : bgColor;

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 4),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Dalai.spacing.borderRadius/2),
          color: bgColor.withOpacity(hierarchy == BadgeHierarchy.primary ? 1 : 0.1)
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          icon != null
              ? Dalai.icon.dalaiIcons(context, icon, size: CXIconSize.x_small, mainColor: contentColor)
              : const SizedBox.shrink(),
          icon != null
              ? Dalai.spacing.hSpacer(small: true)
              : const SizedBox.shrink(),
          Dalai.text.xs(context, text, bold: true, color: contentColor)
        ],),
    );
  }

  Widget badgeOutline(BuildContext context, String text, {CXIcon? icon, BadgeColor color = BadgeColor.primary, BadgeHierarchy? hierarchy = BadgeHierarchy.primary}){
    Color outlineColor = _getBGColor(context, color);
    Color bgColor = hierarchy == BadgeHierarchy.primary ? Colors.transparent : outlineColor.withOpacity(0.1);

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 4),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Dalai.spacing.borderRadius/2),
          border: Border.all(
            color: outlineColor,
            width: 1.5
          ),
        color: bgColor
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          icon != null
              ? Dalai.icon.dalaiIcons(context, icon, size: CXIconSize.x_small, mainColor: outlineColor)
              : const SizedBox.shrink(),
          icon != null
              ? Dalai.spacing.hSpacer(small: true)
              : const SizedBox.shrink(),
          Dalai.text.xs(context, text, bold: true, color: outlineColor)
        ],),
    );
  }

  Widget tagSolid(BuildContext context, String text, {CXIcon? icon, BadgeColor color = BadgeColor.primary, BadgeHierarchy? hierarchy = BadgeHierarchy.primary, Function? onDelete, Function? onTap}){
    Color bgColor = _getBGColor(context, color);
    Color contentColor = hierarchy == BadgeHierarchy.primary ? _getContentColor(context, color) : bgColor;
    return GestureDetector(
      onTap: (){
        if(onTap != null){
          onTap();
        }
      },
      child: Chip(
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        labelPadding: EdgeInsets.zero,
          padding: EdgeInsets.symmetric(vertical: Dalai.spacing.lateralPaddingValue / 2, horizontal: Dalai.spacing.lateralPaddingValue),
          backgroundColor: bgColor.withOpacity(hierarchy == BadgeHierarchy.primary ? 1 : 0.1),
          label: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              icon != null
                  ? Dalai.icon.dalaiIcons(context, icon, size: CXIconSize.x_small, mainColor: contentColor)
                  : const SizedBox.shrink(),
              icon != null
                  ? Dalai.spacing.hSpacer(small: true)
                  : const SizedBox.shrink(),
              Dalai.text.xs(context, text, bold: true, color: contentColor)
            ],),
        onDeleted: onDelete != null ? (){
            onDelete();
        } : null,
        deleteIconColor: contentColor,
        deleteIcon: Padding(
          padding: EdgeInsets.only(left: Dalai.spacing.lateralPaddingValue/2),
          child: Dalai.icon.dalaiIcons(context, CXIcon.xmark_circle, size: CXIconSize.x_small, mainColor: contentColor),
        ),
      ),
    );
  }

  Widget tagOutline(BuildContext context, String text, {CXIcon? icon, BadgeColor color = BadgeColor.primary, BadgeHierarchy? hierarchy = BadgeHierarchy.primary, Function? onDelete, Function? onTap}){
    Color outlineColor = _getBGColor(context, color);
    Color bgColor = hierarchy == BadgeHierarchy.primary ? Colors.transparent : outlineColor.withOpacity(0.1);

    return GestureDetector(
      onTap: (){
        if(onTap != null){
          onTap();
        }
      },
      child: Chip(
        side: BorderSide(
            color: outlineColor,
            width: 1.5
        ),
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        labelPadding: EdgeInsets.zero,
        padding: EdgeInsets.symmetric(vertical: Dalai.spacing.lateralPaddingValue / 2, horizontal: Dalai.spacing.lateralPaddingValue),
        backgroundColor: bgColor,
        label: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            icon != null
                ? Dalai.icon.dalaiIcons(context, icon, size: CXIconSize.x_small, mainColor: outlineColor)
                : const SizedBox.shrink(),
            icon != null
                ? Dalai.spacing.hSpacer(small: true)
                : const SizedBox.shrink(),
            Dalai.text.xs(context, text, bold: true, color: outlineColor)
          ],),
        onDeleted: onDelete != null ? (){
          onDelete();
        } : null,
        deleteIconColor: outlineColor,
        deleteIcon: Padding(
          padding: EdgeInsets.only(left: Dalai.spacing.lateralPaddingValue/2),
          child: Dalai.icon.dalaiIcons(context, CXIcon.xmark_circle, size: CXIconSize.x_small, mainColor: outlineColor),
        ),
      ),
    );
  }

  Color _getBGColor(BuildContext context, BadgeColor color){
    switch(color){
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
      default: return Theme.of(context).colorScheme.primary;
    }
  }

  Color _getContentColor(BuildContext context, BadgeColor color){
    switch(color){
      case BadgeColor.white:
        return Theme.of(context).textTheme.bodyMedium!.color!;
      default:
        return Theme.of(context).colorScheme.background;
    }
  }
}