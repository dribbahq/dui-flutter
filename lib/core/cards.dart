import 'dart:math';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cityxerpa_icons/cityxerpa_symbols.dart';
import 'package:dalai/common_utils/color_extension.dart';
import 'package:dalai/core/misc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../common_utils/common_utils.dart';
import '../dalai.dart';
import 'badges.dart';
import 'external/promo_banner.dart';
import 'external/svg_content.dart';

enum ComponentImage { beltImage, covidImage, musicImage }

enum PartnerCardType {
  fullWidth,
  fullWidthCarousel,
  squared,
  promoted,
  withPartnerLogo
}

class DalaiCards {
  @Deprecated(
      'This widget will be removed in the future. Use Dalai.text elements instead.')
  Widget cardDescription(context, text, {color, maxLines, textAlign}) {
    return Text(
      text,
      maxLines: maxLines,
      overflow: TextOverflow.ellipsis,
      textAlign: textAlign ?? TextAlign.start,
      style: TextStyle(
          color: color == null
              ? Theme.of(context).textTheme.bodyMedium!.color!.withOpacity(0.9)
              : color.withOpacity(0.9),
          fontSize: Dalai.text.smallText,
          fontFamily: 'metropolis',
          height: 1.5),
    );
  }

  @Deprecated(
      'This widget will be removed in the future. Use Dalai.text elements instead.')
  Widget cardTitle(context, text, {color, maxLines, align, double? fontSize}) {
    return AutoSizeText(text,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        maxFontSize: fontSize ?? Dalai.text.h1,
        minFontSize: Dalai.text.h2,
        textAlign: align ?? TextAlign.start,
        style: TextStyle(
          fontFamily: 'metropolis',
          color: color ?? Theme.of(context).textTheme.bodyMedium!.color,
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

  @Deprecated(
      'This widget will be removed in the future. Use Dalai.text elements instead.')
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
          color: color ?? Theme.of(context).textTheme.bodyMedium!.color,
          fontSize: Dalai.text.h2,
          height: 1.2,
          fontWeight: Dalai.text.boldWeight),
    );
  }

  @Deprecated(
      'This widget will be removed in the future. Use Dalai.text elements instead.')
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
            color: color ?? Theme.of(context).colorScheme.primary,
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
      onTap: () {
        onTap();
      },
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
    if (loading) {
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
                    shape: BoxShape.circle,
                    color: Theme.of(context).brightness == Brightness.light
                        ? Dalai.color.cream
                        : Dalai.color.cream.withOpacity(0.1)),
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
                          return Dalai.misc
                              .defaultUserProfileImage(context, initials);
                        },
                      )
                    : Dalai.misc.defaultUserProfileImage(context, initials)),
            onTap != null
                ? Align(
                    alignment: Alignment.bottomRight,
                    child: CircleAvatar(
                      backgroundColor: Theme.of(context).colorScheme.background,
                      child: Dalai.icon.dalaiIcons(context, CXIcon.pencil),
                    ),
                  )
                : SizedBox.shrink()
          ],
        ),
      ),
    );
  }

  Widget iconSmallCard(
      BuildContext context, String title, dynamic? imageUrl, Function() onTap,
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
              vertical: Dalai.spacing.lateralPaddingValue,
              horizontal: Dalai.spacing.lateralPaddingValue),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(Dalai.spacing.borderRadius),
              border: isSelected
                  ? Border.all(
                      color: Theme.of(context).colorScheme.primary,
                      width: Dalai.spacing.borderWidth)
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
              imageUrl == null ? SizedBox.shrink() : Dalai.spacing.spacer(),
              AutoSizeText(
                title,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
                minFontSize: Dalai.text.smallTextStyle(context).fontSize! - 4,
                style: Dalai.text.smallTextStyle(context,
                    color: Theme.of(context).textTheme.bodyMedium!.color,
                    bold: true),
              ),
            ],
          ),
        ));
  }

  Widget disclaimerTextWithImage(String title, String content,
      ComponentImage imageType, BuildContext context) {
    String image = '';
    if (imageType == ComponentImage.beltImage) {
      image = rawBeltImage;
    } else if (imageType == ComponentImage.covidImage) {
      image = rawCovidImage;
    } else if (imageType == ComponentImage.musicImage) {
      image = rawMusicImage;
    } else {
      throw Exception('Image type not found');
    }

    return Container(
      padding:
          EdgeInsets.symmetric(vertical: Dalai.spacing.lateralPaddingValue),
      child: Row(
        children: [
          SvgPicture.string(
            image,
            height: 84,
            width: 84,
          ),
          Dalai.spacing.hSpacer(multiplier: 2),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Dalai.text.regular(context, title, bold: true),
                Dalai.text.small(context, content),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget partnerCard(String partnerName, String? imageURL, BuildContext context,
      Function() onTap,
      {PartnerCardType type = PartnerCardType.fullWidth,
      String? partnerAccessory,
      String? partnerDeliveryPrice,
      String? partnerDeliveryTime,
      Widget? badge,
      String? ratingTitle,
      String? promotionTitle,
      bool partnerIsClosed = false,
      bool showFastBadge = false,
      bool allowToSchedule = true}) {
    if (type == PartnerCardType.fullWidth ||
        type == PartnerCardType.fullWidthCarousel) {
      return Material(
        color: Colors.transparent,
        child: GestureDetector(
          onTap: partnerIsClosed && !allowToSchedule
              ? () {
                  Utils.vibrateOnHeavyTap();
                }
              : () {
                  Utils.vibrateOnTap();
                  onTap();
                },
          child: Container(
              height: 180,
              width: double.infinity,
              padding: EdgeInsets.zero,
              margin: EdgeInsets.only(
                  bottom: 0,
                  left: Dalai.spacing.lateralPaddingValue,
                  right: Dalai.spacing.lateralPaddingValue),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Expanded(
                    child: Stack(
                      fit: StackFit.loose,
                      alignment: Alignment.topRight,
                      children: [
                        CachedNetworkImage(
                          imageUrl: imageURL ?? '',
                          imageBuilder: (context, imageProvider) => Container(
                            padding: EdgeInsets.zero,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                  Dalai.spacing.borderRadius),
                              image: DecorationImage(
                                colorFilter: partnerIsClosed
                                    ? ColorFilter.mode(
                                        Dalai.color.black, BlendMode.color)
                                    : null,
                                fit: BoxFit.cover,
                                image: imageProvider,
                              ),
                            ),
                          ),
                          progressIndicatorBuilder:
                              (context, url, downloadProgress) => Container(
                            padding: EdgeInsets.zero,
                            width: double.infinity,
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color: Theme.of(context)
                                        .textTheme
                                        .bodyMedium!
                                        .color!
                                        .withOpacity(0.2),
                                    width: 0.2),
                                borderRadius: BorderRadius.circular(
                                    Dalai.spacing.borderRadius),
                                color: Dalai.color.black.withOpacity(0.05)),
                            child: Center(
                              child: Dalai.misc.loadingAnimation(context),
                            ),
                          ),
                          errorWidget: (context, url, error) => Container(
                            padding: EdgeInsets.zero,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                  Dalai.spacing.borderRadius),
                              image: DecorationImage(
                                colorFilter: partnerIsClosed
                                    ? ColorFilter.mode(
                                        Dalai.color.black, BlendMode.color)
                                    : null,
                                fit: BoxFit.cover,
                                image: Dalai.misc.getPlaceholderImageProvider(
                                    PlaceholderImage.partner),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(
                              Dalai.spacing.lateralPaddingValue / 2),
                          child: partnerIsClosed || promotionTitle == null
                              ? SizedBox.shrink()
                              : Dalai.badge.badgeSolid(context, promotionTitle,
                                  color: BadgeColor.white, icon: CXIcon.deal),
                        ),
                      ],
                    ),
                  ),
                  Dalai.spacing.spacer(small: true),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Dalai.spacing.spacer(small: true),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Wrap(
                                alignment: WrapAlignment.start,
                                clipBehavior: Clip.antiAliasWithSaveLayer,
                                crossAxisAlignment: WrapCrossAlignment.center,
                                spacing: 6,
                                children: [
                                  Dalai.text.regular(context, "$partnerName",
                                      maxLines: 1, bold: true),
                                ]),
                          ),
                          badge != null
                              ? Column(
                                  children: [
                                    Dalai.spacing.hSpacer(small: true),
                                    badge
                                  ],
                                )
                              : SizedBox.shrink(),
                        ],
                      ),
                      Row(
                        children: [
                          Dalai.text.xs(context, partnerDeliveryPrice,
                              bold: true,
                              color: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .color),
                          partnerDeliveryTime != null
                              ? Dalai.text.xs(context, " · ", bold: true)
                              : SizedBox.shrink(),
                          partnerDeliveryTime != null &&
                                  !partnerIsClosed &&
                                  showFastBadge
                              ? Dalai.icon.dalaiIcons(context, CXIcon.fast,
                                  size: CXIconSize.x_small)
                              : SizedBox.shrink(),
                          partnerDeliveryTime != null
                              ? Dalai.text.xs(context, " ", bold: true)
                              : SizedBox.shrink(),
                          partnerDeliveryTime != null
                              ? Dalai.text.xs(context, partnerDeliveryTime,
                                  color: Theme.of(context)
                                      .textTheme
                                      .bodyMedium!
                                      .color)
                              : SizedBox.shrink(),
                          ratingTitle != null
                              ? Dalai.text.xs(context, " · ", bold: true)
                              : SizedBox.shrink(),
                          ratingTitle != null
                              ? Dalai.text.xs(context, ratingTitle,
                                  bold: true,
                                  color: Theme.of(context)
                                      .textTheme
                                      .bodyMedium!
                                      .color)
                              : SizedBox.shrink(),
                          Expanded(
                            child: SizedBox.shrink(),
                          ),
                        ],
                      ),
                      // Row(
                      //   children: [
                      //     widget.localFiltered != null &&
                      //             widget.localFiltered!
                      //         ? FutureBuilder<String?>(
                      //             builder: (context, snapshot) {
                      //               if (!snapshot.hasData ||
                      //                   snapshot.data == null) {
                      //                 return SizedBox.shrink();
                      //               }
                      //               return Dalai.text.small(context,
                      //                   '${MyLocalizations.of(context, 'distance_title')} ${snapshot.data}',
                      //                   bold: true);
                      //             },
                      //             future: _business!
                      //                 .getDistanceFromBusiness(context),
                      //           )
                      //         : Dalai.text.small(
                      //             context,
                      //             Utils.getPriceText(
                      //                 context, _deliveryCost),
                      //             bold: true),
                      //     _readyTime(context) != null
                      //         ? Row(
                      //             children: [
                      //               Dalai.text
                      //                   .small(context, ' · ', bold: true),
                      //               Dalai.text.small(
                      //                   context, _readyTime(context)),
                      //             ],
                      //           )
                      //         : SizedBox.shrink(),
                      //     widget.isSquare!
                      //         ? SizedBox.shrink()
                      //         : Expanded(
                      //             child: Row(
                      //               children: [
                      //                 Dalai.text.small(context, ' · ',
                      //                     bold: true),
                      //                 Expanded(
                      //                   child: Dalai.text.small(context,
                      //                       _business!.getSubtitle(),
                      //                       maxLines: 1),
                      //                 ),
                      //               ],
                      //             ),
                      //           ),
                      //   ],
                      // ),
                    ],
                  ),
                ],
              )),
        ),
      );
    }
    if (type == PartnerCardType.squared) {
      return Material(
        color: Colors.transparent,
        child: GestureDetector(
            onTap: partnerIsClosed && !allowToSchedule
                ? () {
                    Utils.vibrateOnHeavyTap();
                  }
                : () {
                    Utils.vibrateOnTap();
                    onTap();
                  },
            child: Container(
                width: 180,
                padding: EdgeInsets.zero,
                margin: EdgeInsets.only(
                    bottom: 0,
                    left: Dalai.spacing.lateralPaddingValue,
                    right: Dalai.spacing.lateralPaddingValue),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    AspectRatio(
                      aspectRatio: 1,
                      child: Expanded(
                        child: Stack(
                          fit: StackFit.loose,
                          alignment: Alignment.topRight,
                          children: [
                            CachedNetworkImage(
                              imageUrl: imageURL ?? '',
                              imageBuilder: (context, imageProvider) =>
                                  Container(
                                padding: EdgeInsets.zero,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(
                                      Dalai.spacing.borderRadius),
                                  image: DecorationImage(
                                    colorFilter: partnerIsClosed
                                        ? ColorFilter.mode(
                                            Dalai.color.black, BlendMode.color)
                                        : null,
                                    fit: BoxFit.cover,
                                    image: imageProvider,
                                  ),
                                ),
                              ),
                              progressIndicatorBuilder:
                                  (context, url, downloadProgress) => Container(
                                padding: EdgeInsets.zero,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Theme.of(context)
                                            .textTheme
                                            .bodyMedium!
                                            .color!
                                            .withOpacity(0.2),
                                        width: 0.2),
                                    borderRadius: BorderRadius.circular(
                                        Dalai.spacing.borderRadius),
                                    color: Dalai.color.black.withOpacity(0.05)),
                                child: Center(
                                  child: Dalai.misc.loadingAnimation(context),
                                ),
                              ),
                              errorWidget: (context, url, error) => Container(
                                padding: EdgeInsets.zero,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(
                                      Dalai.spacing.borderRadius),
                                  image: DecorationImage(
                                    colorFilter: partnerIsClosed
                                        ? ColorFilter.mode(
                                            Dalai.color.black, BlendMode.color)
                                        : null,
                                    fit: BoxFit.cover,
                                    image: Dalai.misc
                                        .getPlaceholderImageProvider(
                                            PlaceholderImage.partner),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(
                                  Dalai.spacing.lateralPaddingValue / 2),
                              child: partnerIsClosed || promotionTitle == null
                                  ? SizedBox.shrink()
                                  : Dalai.badge.badgeSolid(
                                      context, promotionTitle,
                                      color: BadgeColor.white,
                                      icon: CXIcon.deal),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Dalai.spacing.spacer(small: true),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Dalai.spacing.spacer(small: true),
                        badge != null
                            ? Column(
                                children: [
                                  badge,
                                  Dalai.spacing.spacer(small: true),
                                ],
                              )
                            : SizedBox.shrink(),

                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Wrap(
                                  alignment: WrapAlignment.start,
                                  clipBehavior: Clip.antiAliasWithSaveLayer,
                                  crossAxisAlignment: WrapCrossAlignment.center,
                                  spacing: 6,
                                  children: [
                                    Dalai.text.regular(context, "$partnerName",
                                        maxLines: 1, bold: true),
                                  ]),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Dalai.text.xs(context, partnerDeliveryPrice,
                                bold: true,
                                color: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .color),
                            partnerDeliveryTime != null
                                ? Dalai.text.xs(context, " · ", bold: true)
                                : SizedBox.shrink(),
                            partnerDeliveryTime != null &&
                                    !partnerIsClosed &&
                                    showFastBadge
                                ? Dalai.icon.dalaiIcons(context, CXIcon.fast,
                                    size: CXIconSize.x_small)
                                : SizedBox.shrink(),
                            partnerDeliveryTime != null
                                ? Dalai.text.xs(context, " ", bold: true)
                                : SizedBox.shrink(),
                            partnerDeliveryTime != null
                                ? Dalai.text.xs(context, partnerDeliveryTime,
                                    color: Theme.of(context)
                                        .textTheme
                                        .bodyMedium!
                                        .color)
                                : SizedBox.shrink(),
                            Expanded(
                              child: SizedBox.shrink(),
                            ),
                          ],
                        ),
                        // Row(
                        //   children: [
                        //     widget.localFiltered != null &&
                        //             widget.localFiltered!
                        //         ? FutureBuilder<String?>(
                        //             builder: (context, snapshot) {
                        //               if (!snapshot.hasData ||
                        //                   snapshot.data == null) {
                        //                 return SizedBox.shrink();
                        //               }
                        //               return Dalai.text.small(context,
                        //                   '${MyLocalizations.of(context, 'distance_title')} ${snapshot.data}',
                        //                   bold: true);
                        //             },
                        //             future: _business!
                        //                 .getDistanceFromBusiness(context),
                        //           )
                        //         : Dalai.text.small(
                        //             context,
                        //             Utils.getPriceText(
                        //                 context, _deliveryCost),
                        //             bold: true),
                        //     _readyTime(context) != null
                        //         ? Row(
                        //             children: [
                        //               Dalai.text
                        //                   .small(context, ' · ', bold: true),
                        //               Dalai.text.small(
                        //                   context, _readyTime(context)),
                        //             ],
                        //           )
                        //         : SizedBox.shrink(),
                        //     widget.isSquare!
                        //         ? SizedBox.shrink()
                        //         : Expanded(
                        //             child: Row(
                        //               children: [
                        //                 Dalai.text.small(context, ' · ',
                        //                     bold: true),
                        //                 Expanded(
                        //                   child: Dalai.text.small(context,
                        //                       _business!.getSubtitle(),
                        //                       maxLines: 1),
                        //                 ),
                        //               ],
                        //             ),
                        //           ),
                        //   ],
                        // ),
                      ],
                    ),
                  ],
                ))),
      );
    }
    if (type == PartnerCardType.promoted) {
      return Material(
        color: Colors.transparent,
        child: GestureDetector(
            onTap: partnerIsClosed && !allowToSchedule
                ? () {
                    Utils.vibrateOnHeavyTap();
                  }
                : () {
                    Utils.vibrateOnTap();
                    onTap();
                  },
            child: Container(
                width: 180,
                padding: EdgeInsets.zero,
                margin: EdgeInsets.only(
                    bottom: 0,
                    left: Dalai.spacing.lateralPaddingValue,
                    right: Dalai.spacing.lateralPaddingValue),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    AspectRatio(
                      aspectRatio: 1,
                      child: Expanded(
                        child: Stack(
                          fit: StackFit.loose,
                          alignment: Alignment.topRight,
                          children: [
                            CachedNetworkImage(
                              imageUrl: imageURL ?? '',
                              imageBuilder: (context, imageProvider) =>
                                  Container(
                                padding: EdgeInsets.zero,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(
                                      Dalai.spacing.borderRadius),
                                  image: DecorationImage(
                                    colorFilter: partnerIsClosed
                                        ? ColorFilter.mode(
                                            Dalai.color.black, BlendMode.color)
                                        : null,
                                    fit: BoxFit.cover,
                                    image: imageProvider,
                                  ),
                                ),
                              ),
                              progressIndicatorBuilder:
                                  (context, url, downloadProgress) => Container(
                                padding: EdgeInsets.zero,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Theme.of(context)
                                            .textTheme
                                            .bodyMedium!
                                            .color!
                                            .withOpacity(0.2),
                                        width: 0.2),
                                    borderRadius: BorderRadius.circular(
                                        Dalai.spacing.borderRadius),
                                    color: Dalai.color.black.withOpacity(0.05)),
                                child: Center(
                                  child: Dalai.misc.loadingAnimation(context),
                                ),
                              ),
                              errorWidget: (context, url, error) => Container(
                                padding: EdgeInsets.zero,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(
                                      Dalai.spacing.borderRadius),
                                  image: DecorationImage(
                                    colorFilter: partnerIsClosed
                                        ? ColorFilter.mode(
                                            Dalai.color.black, BlendMode.color)
                                        : null,
                                    fit: BoxFit.cover,
                                    image: Dalai.misc
                                        .getPlaceholderImageProvider(
                                            PlaceholderImage.partner),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Dalai.spacing.spacer(small: true),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Dalai.spacing.spacer(small: true),
                        Dalai.text.regular(context, partnerName,
                            maxLines: 1, bold: true),
                      ],
                    ),
                  ],
                ))),
      );
    }
    if (type == PartnerCardType.withPartnerLogo) {
      return FutureBuilder<Color>(
        future:
            Utils.getImagePalette(CachedNetworkImageProvider(imageURL ?? '')),
        builder: (context, snapshot) {
          return Material(
            color: Colors.transparent,
            child: GestureDetector(
                onTap: partnerIsClosed && !allowToSchedule
                    ? () {
                        Utils.vibrateOnHeavyTap();
                      }
                    : () {
                        Utils.vibrateOnTap();
                        onTap();
                      },
                child: AspectRatio(
                    aspectRatio: 0.9,
                    child: Container(
                      decoration: BoxDecoration(
                          color: Theme.of(context).scaffoldBackgroundColor,
                          borderRadius: BorderRadius.circular(
                              Dalai.spacing.borderRadius)),
                      child: Stack(
                          fit: StackFit.loose,
                          alignment: Alignment.topCenter,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  color: snapshot.data == null
                                      ? Colors.transparent
                                      : snapshot.data!.withOpacity(0.08),
                                  borderRadius: BorderRadius.circular(
                                      Dalai.spacing.borderRadius)),
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                promotionTitle == null
                                    ? Dalai.spacing.spacer(multiplier: 2)
                                    : Container(
                                        margin: EdgeInsets.only(
                                            bottom: Dalai
                                                .spacing.lateralPaddingValue),
                                        padding: EdgeInsets.only(
                                            left: Dalai
                                                .spacing.lateralPaddingValue,
                                            right: Dalai
                                                .spacing.lateralPaddingValue,
                                            top: 4,
                                            bottom: 2),
                                        decoration: BoxDecoration(
                                            color: Dalai.color.discount,
                                            borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(
                                                    Dalai.spacing.borderRadius),
                                                topRight: Radius.circular(Dalai
                                                    .spacing.borderRadius))),
                                        width: double.infinity,
                                        child: Center(
                                          child: Dalai.text.xs(
                                              context, promotionTitle ?? '',
                                              color: Dalai.color.discount
                                                  .calculateLuminance(),
                                              bold: true),
                                        ),
                                      ),
                                CachedNetworkImage(
                                  imageUrl: imageURL ?? '',
                                  imageBuilder: (context, imageProvider) =>
                                      Container(
                                    padding: EdgeInsets.zero,
                                    width: 120,
                                    height: 60,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        fit: BoxFit.fitHeight,
                                        image: imageProvider,
                                      ),
                                    ),
                                  ),
                                  progressIndicatorBuilder:
                                      (context, url, downloadProgress) =>
                                          Container(
                                    padding: EdgeInsets.zero,
                                    width: 60,
                                    height: 60,
                                    decoration: BoxDecoration(
                                      color: Theme.of(context)
                                          .textTheme
                                          .bodyMedium!
                                          .color!
                                          .withOpacity(0.05),
                                      borderRadius: BorderRadius.circular(200),
                                    ),
                                    child: Center(
                                      child:
                                          Dalai.misc.loadingAnimation(context),
                                    ),
                                  ),
                                  errorWidget: (context, url, error) =>
                                      Container(
                                    padding: EdgeInsets.zero,
                                    width: 60,
                                    height: 60,
                                    decoration: BoxDecoration(
                                      color: Theme.of(context)
                                          .textTheme
                                          .bodyMedium!
                                          .color!
                                          .withOpacity(0.05),
                                      borderRadius: BorderRadius.circular(200),
                                    ),
                                    child: Center(
                                        child: Dalai.icon.dalaiIcons(
                                      context,
                                      CXIcon.shop,
                                    )),
                                  ),
                                ),
                                Expanded(
                                  child: Dalai.spacing.spacer(),
                                ),
                                Dalai.text.small(context, partnerName,
                                    bold: true,
                                    color: Theme.of(context)
                                        .textTheme
                                        .bodyMedium!
                                        .color,
                                    maxLines: 1,
                                    textAlign: TextAlign.center),
                                Dalai.spacing.spacer(small: true),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Dalai.text.xs(context, partnerDeliveryPrice,
                                        bold: true,
                                        color: Theme.of(context)
                                            .textTheme
                                            .bodyMedium!
                                            .color),
                                    partnerDeliveryTime != null
                                        ? Dalai.text
                                            .xs(context, " · ", bold: true)
                                        : SizedBox.shrink(),
                                    partnerDeliveryTime != null
                                        ? Dalai.text.xs(
                                            context, partnerDeliveryTime,
                                            color: Theme.of(context)
                                                .textTheme
                                                .bodyMedium!
                                                .color)
                                        : SizedBox.shrink(),
                                  ],
                                ),
                                partnerAccessory == null
                                    ? SizedBox.shrink()
                                    : Dalai.spacing.spacer(small: true),
                                partnerAccessory == null
                                    ? SizedBox.shrink()
                                    : Dalai.badge.badgeSolid(
                                        context, partnerAccessory,
                                        color: BadgeColor.white,
                                        hierarchy: BadgeHierarchy.secondary),
                                Expanded(
                                  flex: 2,
                                  child: Dalai.spacing.spacer(),
                                ),
                              ],
                            ),
                          ]),
                    ))),
          );
        },
      );
    }
    return Container();
  }

  Widget gridProductItem(
    BuildContext context,
    String title,
    String? price,
    String? productImageURL,
    Function? onTap, {
    String? priceAccessory,
  }) {
    return Material(
        color: Colors.transparent,
        child: GestureDetector(
            onTap: onTap == null
                ? () {
                    Utils.vibrateOnHeavyTap();
                  }
                : () {
                    Utils.vibrateOnTap();
                    onTap();
                  },
            child: AspectRatio(
                aspectRatio: 0.65,
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Stack(
                        fit: StackFit.loose,
                        alignment: Alignment.bottomRight,
                        children: [
                          AspectRatio(
                              aspectRatio: 1.0,
                              child: Container(
                                padding: EdgeInsets.all(
                                    Dalai.spacing.lateralPaddingValue),
                                decoration: BoxDecoration(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .background,
                                    borderRadius: BorderRadius.circular(
                                        Dalai.spacing.borderRadius)),
                                width: double.infinity,
                                child: CachedNetworkImage(
                                  imageUrl: productImageURL ?? '',
                                  imageBuilder: (context, imageProvider) =>
                                      Container(
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: imageProvider,
                                      ),
                                    ),
                                  ),
                                  progressIndicatorBuilder:
                                      (context, url, downloadProgress) =>
                                          Container(
                                    padding: EdgeInsets.zero,
                                    width: 60,
                                    height: 60,
                                    child: Center(
                                        child: Dalai.icon.dalaiIcons(
                                            context, CXIcon.image,
                                            size: CXIconSize.large,
                                            mainColor: Theme.of(context)
                                                .textTheme
                                                .bodyMedium!
                                                .color!
                                                .lighten(0.3),
                                            secondaryColor: Theme.of(context)
                                                .colorScheme
                                                .primary)),
                                  ),
                                  errorWidget: (context, url, error) =>
                                      Container(
                                    padding: EdgeInsets.zero,
                                    width: 60,
                                    height: 60,
                                    child: Center(
                                        child: Dalai.icon.dalaiIcons(
                                            context, CXIcon.image,
                                            size: CXIconSize.large,
                                            mainColor: Theme.of(context)
                                                .textTheme
                                                .bodyMedium!
                                                .color!
                                                .lighten(0.3),
                                            secondaryColor: Theme.of(context)
                                                .colorScheme
                                                .primary)),
                                  ),
                                ),
                              )),
                          Dalai.button.stepper(
                              context, 0, (value, under, uper) {},
                              reduced: true),
                        ],
                      ),
                      Dalai.spacing.spacer(small: true),
                      price != null
                          ? Row(
                              children: [
                                Dalai.text.xs(context, price,
                                    maxLines: 1,
                                    bold: true,
                                    color: Theme.of(context)
                                        .textTheme
                                        .bodyMedium!
                                        .color),
                                Dalai.text.xs(context, '/ ' + priceAccessory!,
                                    maxLines: 1,
                                    color: Theme.of(context)
                                        .textTheme
                                        .bodyMedium!
                                        .color!
                                        .withOpacity(0.8))
                              ],
                            )
                          : SizedBox.shrink(),
                      Dalai.text.xs(context, title,
                          maxLines: 2,
                          color: Theme.of(context).textTheme.bodyMedium!.color),
                    ],
                  ),
                ))));
  }
}
