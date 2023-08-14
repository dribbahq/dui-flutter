import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../dalai.dart';
import 'badges.dart';
import 'external/promo_banner.dart';

class DalaiCards {
  Widget cardDescription(context, text, {color, maxLines, textAlign}) {
    return Text(
      text,
      maxLines: maxLines,
      overflow: TextOverflow.ellipsis,
      textAlign: textAlign ?? TextAlign.start,
      style: TextStyle(
          color: color == null
              ? Theme
              .of(context)
              .textTheme
              .bodyMedium!
              .color!
              .withOpacity(0.9)
              : color.withOpacity(0.9),
          fontSize: Dalai.text.smallText,
          fontFamily: 'metropolis',
          height: 1.5),
    );
  }

  Widget cardTitle(context, text, {color, maxLines, align, double? fontSize}) {
    return AutoSizeText(text,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        maxFontSize: fontSize ?? Dalai.text.h1,
        minFontSize: Dalai.text.h2,
        textAlign: align ?? TextAlign.start,
        style: TextStyle(
          fontFamily: 'metropolis',
          color: color ?? Theme
              .of(context)
              .textTheme
              .bodyMedium!
              .color,
          fontSize: fontSize ?? Dalai.text.h1,
          shadows: <Shadow>[
            Shadow(
                offset: Offset.zero,
                blurRadius: 10.0,
                color: Colors.black.withOpacity(0.7)),
            Shadow(
                offset: Offset.zero,
                blurRadius: 60.0,
                color: Colors.black.withOpacity(0.9)),
          ],
          fontWeight: Dalai.text.boldWeight,
        ));
  }

  Widget cardTitleSmall(context, text, {color, maxLines}) {
    return Text(
      text,
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
          shadows: const <Shadow>[
            Shadow(
              offset: Offset(1, 1),
              blurRadius: 2.0,
              color: Color.fromARGB(200, 0, 0, 0),
            ),
          ],
          color: color ?? Theme
              .of(context)
              .textTheme
              .bodyMedium!
              .color,
          fontSize: Dalai.text.h2,
          height: 1.2,
          fontWeight: Dalai.text.boldWeight),
    );
  }

  Widget cardPrice(context, text,
      {Color? color,
        int? maxLines,
        TextAlign? textAlign,
        TextDecoration? decoration}) {
    return Text(text,
        maxLines: maxLines,
        textAlign: textAlign ?? TextAlign.start,
        overflow: maxLines != null ? TextOverflow.ellipsis : null,
        style: TextStyle(
            fontWeight: Dalai.text.semiBoldWeight,
            color: color ?? Theme
                .of(context)
                .colorScheme
                .primary,
            decoration: decoration ?? TextDecoration.none,
            fontSize: Dalai.text.h2));
  }

  Widget banner(BuildContext context, String title, String? message,
      Function() onTap, String? imageURL, Color mainColor) {
    return CustomCXBanner(
      title: title,
      message: message,
      imageURL: imageURL,
      mainColor: mainColor,
      onTap: () {},
    );
  }

  Widget order(BuildContext context,
      {String? title,
        String? leadingSubtitle,
        String? trailingSubtitle,
        Function? onTap,
        String? imageURL,
        String? highlightText,
        String? accessoryTitle,
        String? status, BadgeColor? badgeColor}) {
    return GestureDetector(
      onTap: () {
        onTap!();
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Dalai.spacing.borderRadius),
        ),
        padding: EdgeInsets.symmetric(vertical: 12, horizontal: 12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  title == null
                      ? const SizedBox.shrink()
                      : Dalai.text.regular(
                      context, title, highlightText: highlightText, bold: true),
                  highlightText == null
                      ? const SizedBox.shrink()
                      : SizedBox(height: 3),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      leadingSubtitle == null
                          ? const SizedBox.shrink()
                          : Dalai.text.small(context, leadingSubtitle),
                      trailingSubtitle == null
                          ? const SizedBox.shrink()
                          : Dalai.text.small(context, ' • '),
                      trailingSubtitle == null
                          ? const SizedBox.shrink()
                          : Dalai.text.small(context, trailingSubtitle),
                      status == null
                          ? const SizedBox.shrink()
                          : Dalai.spacing.hSpacer(),
                      status == null
                          ? const SizedBox.shrink()
                          : Dalai.badge.badgeSolid(context, status,
                          color: badgeColor ?? BadgeColor.primary)
                    ],
                  ),
                  Dalai.spacing.spacer(),
                  Dalai.text.small(context, accessoryTitle)
                ],
              ),
            ),
            Dalai.spacing.hSpacer(),
            imageURL == null
                ? const SizedBox.shrink()
                : ClipRRect(
                borderRadius:
                BorderRadius.circular(Dalai.spacing.borderRadius),
                child: Container(
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                            Dalai.spacing.smallBorderRadius),
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: CachedNetworkImageProvider(imageURL),
                        )))),
          ],
        ),
      ),
    );
  }
}
