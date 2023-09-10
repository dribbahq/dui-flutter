import 'dart:math';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../dui.dart';

class DUICard {
  Widget iconSmallCard(
      BuildContext context, String title, dynamic imageUrl, Function() onTap,
      {bool isSelected = false}) {
    return GestureDetector(
        onTap: () {
          onTap();
        },
        child: Container(
          constraints: BoxConstraints(
              minWidth: min(200, (MediaQuery.of(context).size.width / 3) - 24),
              maxWidth: (MediaQuery.of(context).size.width / 3) - 24),
          padding: EdgeInsets.symmetric(
              vertical: DUI.spacing.lateralPaddingValue,
              horizontal: DUI.spacing.lateralPaddingValue),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(DUI.spacing.borderRadius),
              border: isSelected
                  ? Border.all(
                      color: Theme.of(context).colorScheme.primary,
                      width: DUI.spacing.borderWidth)
                  : null,
              color: isSelected
                  ? Colors.transparent
                  : Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .color!
                      .withOpacity(0.05)),
          child: Column(
            children: [
              imageUrl == null
                  ? SizedBox.shrink()
                  : SizedBox(
                      height: 72,
                      width: 72,
                      child: imageUrl is String
                          ? CachedNetworkImage(
                              imageUrl: imageUrl,
                              fit: BoxFit.cover,
                            )
                          : imageUrl is Widget
                              ? imageUrl
                              : SizedBox.shrink()),
              imageUrl == null ? SizedBox.shrink() : DUI.spacing.spacer(),
              AutoSizeText(
                title,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
                minFontSize: DUI.text.smallTextStyle(context).fontSize! - 4,
                style: DUI.text.smallTextStyle(context,
                    color: Theme.of(context).textTheme.bodyMedium!.color,
                    bold: true),
              ),
            ],
          ),
        ));
  }
}
