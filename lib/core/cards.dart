import 'dart:math';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cityxerpa_icons/cityxerpa_symbols.dart';
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

  Widget deliveryOrderCard(BuildContext context,
      {String? title,
        String? leadingSubtitle,
        String? trailingSubtitle,
        Function? onTap,
        String? imageURL,
        String? highlightText,
        String? accessoryTitle,
        Widget? badge}) {
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
                      : Dalai.text.regular(context, title,
                      highlightText: highlightText, bold: true),
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
                          : Dalai.text
                          .small(context, trailingSubtitle, bold: true),
                      badge == null
                          ? const SizedBox.shrink()
                          : Dalai.spacing.hSpacer(),
                      badge ?? const SizedBox.shrink()
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

  Widget mobilityOrderCard(BuildContext context,
      {String? title,
        String? header,
        String? leadingSubtitle,
        String? trailingSubtitle,
        Function? onTap,
        Widget? trailingWidget,
        String? highlightText,
        Widget? badge}) {
    return GestureDetector(
      onTap: () {
        onTap!();
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Dalai.spacing.borderRadius),
        ),
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  header != null
                      ? Dalai.text.xs(context, header, bold: true)
                      : const SizedBox.shrink(),
                  title == null
                      ? const SizedBox.shrink()
                      : Dalai.text.regular(context, title,
                      highlightText: highlightText, bold: true),
                  highlightText == null
                      ? const SizedBox.shrink()
                      : const SizedBox(height: 3),
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
                          : Dalai.text
                          .small(context, trailingSubtitle, bold: true),
                      badge == null
                          ? const SizedBox.shrink()
                          : Dalai.spacing.hSpacer(),
                      badge ?? const SizedBox.shrink()
                    ],
                  ),
                ],
              ),
            ),
            Dalai.spacing.hSpacer(),
            trailingWidget == null
                ? const SizedBox.shrink()
                : ClipRRect(
                borderRadius:
                BorderRadius.circular(Dalai.spacing.borderRadius),
                child:
                SizedBox(height: 60, width: 60, child: trailingWidget)),
          ],
        ),
      ),
    );
  }

  Widget avatar(BuildContext context, String? imageUrl,
      {Function? onTap, bool loading = false, String? initials}) {
    double containerSize = onTap != null ? 90 : 80;
    if(loading){
      return Dalai.skeleton.emptyLoadingCircle(80, context);
    }
    return GestureDetector(
      onTap: () {
        if (onTap != null) {
          onTap();
        }
      },
      child: SizedBox(
        width: containerSize,
        height: containerSize,
        child: Stack(
          children: [
            Container(
                decoration: BoxDecoration(
                    shape: BoxShape.circle, color: Theme.of(context).brightness == Brightness.light ? Dalai.color.cream : Dalai.color.cream.withOpacity(0.1)),
                width: 80,
                height: 80,
                clipBehavior: Clip.antiAliasWithSaveLayer,
                child: imageUrl != null && imageUrl.isNotEmpty
                    ? CachedNetworkImage(
                  imageUrl: imageUrl ?? '',
                  fit: BoxFit.cover,
                  progressIndicatorBuilder: (context, url, progress) =>
                      Dalai.misc.loadingAnimation(context),
                  errorWidget: (error, string, image) {
                    return Dalai.misc.defaultUserProfileImage(context, initials);
                  },
                )
                    :  Dalai.misc.defaultUserProfileImage(context, initials)),
            onTap != null ? Align(
              alignment: Alignment.bottomRight,
              child: CircleAvatar(
                backgroundColor: Theme
                    .of(context)
                    .colorScheme
                    .background,
                child: Dalai.icon.dalaiIcons(context, CXIcon.pencil),
              ),
            ) : SizedBox.shrink()
          ],
        ),
      ),
    );
  }

  Widget iconSmallCard(BuildContext context, String title, dynamic? imageUrl,
      Function() onTap,
      {bool isSelected = false, bool clearBackground = false}) {
    return GestureDetector(
        onTap: () {
          onTap();
        },
        child: Container(
          constraints: BoxConstraints(
              minWidth: min(200, (MediaQuery
                  .of(context)
                  .size
                  .width / 3) - 24),
              maxWidth: (MediaQuery
                  .of(context)
                  .size
                  .width / 3) - 24),
          padding: EdgeInsets.symmetric(
              vertical: Dalai.spacing.lateralPaddingValue,
              horizontal: Dalai.spacing.lateralPaddingValue),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(Dalai.spacing.borderRadius),
              color: isSelected
                  ? clearBackground
                  ? Theme
                  .of(context)
                  .inputDecorationTheme
                  .fillColor
                  : Theme
                  .of(context)
                  .textTheme
                  .bodyMedium!
                  .color!
                  .withOpacity(0.15)
                  : clearBackground
                  ? Colors.transparent
                  : Theme
                  .of(context)
                  .inputDecorationTheme
                  .fillColor),
          child: Column(
            children: [
              imageUrl == null
                  ? SizedBox.shrink()
                  : Container(
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
              imageUrl == null
                  ? SizedBox.shrink()
                  : Dalai.spacing.spacer(small: clearBackground),
              AutoSizeText(
                title,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
                minFontSize: Dalai.text
                    .smallTextStyle(context)
                    .fontSize! - 4,
                style: Dalai.text.smallTextStyle(context,
                    color: Theme
                        .of(context)
                        .textTheme
                        .bodyMedium!
                        .color,
                    bold: true),
              ),
            ],
          ),
        ));
  }
}
