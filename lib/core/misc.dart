import 'package:cityxerpa_icons/cityxerpa_symbols.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:lottie/lottie.dart';
import '../common_utils/common_utils.dart';
import '../dalai.dart';
import 'external/svg_content.dart';
import 'dart:ui' as ui;
import 'package:xml/xml.dart';
import 'package:flutter_svg/flutter_svg.dart';

enum MapMarker { origin, destination, shop, rider, car, van, currentLocation }

enum MapMarkerState { selected, unselected }

enum PlaceholderImage { courier, partner, experienceZone }

class Misc {
  /*
  * Map styles
  * */
  String lightMapStyle =
      '[{"featureType": "administrative","stylers": [{"visibility": "off"}]},{"featureType": "administrative","elementType": "labels.text.fill","stylers": [{"color": "#444444"}]},{"featureType": "administrative.country","stylers": [{"color": "#ababab"},{"visibility": "on"},{"weight": 2}]},{"featureType": "administrative.country","elementType": "labels","stylers": [{"visibility": "off"}]},{"featureType": "administrative.locality","stylers": [{"visibility": "on"}]},{"featureType": "administrative.province","stylers": [{"visibility": "on"}]},{"featureType": "administrative.province","elementType": "labels.text","stylers": [{"visibility": "on"}]},{"featureType": "landscape","stylers": [{"color": "#f2f2f2"}]},{"featureType": "landscape.man_made","stylers": [{"visibility": "simplified"}]},{"featureType": "landscape.man_made","elementType": "geometry","stylers": [{"visibility": "off"}]},{"featureType": "landscape.man_made","elementType": "geometry.fill","stylers": [{"color": "#dbdbdb"},{"saturation": "-100"},{"visibility": "on"},{"weight": "0.01"}]},{"featureType": "landscape.man_made","elementType": "geometry.stroke","stylers": [{"color": "#131313"},{"visibility": "off"}]},{"featureType": "landscape.man_made","elementType": "labels","stylers": [{"visibility": "off"}]},{"featureType": "poi","stylers": [{"visibility": "off"}]},{"featureType": "poi.business","stylers": [{"visibility": "on"}]},{"featureType": "poi.business","elementType": "labels.icon","stylers": [{"color": "#aaa7a7"},{"visibility": "on"}]},{"featureType": "poi.business","elementType": "labels.text","stylers": [{"hue": "#ff0000"},{"visibility": "off"}]},{"featureType": "poi.business","elementType": "labels.text.fill","stylers": [{"color": "#000000"},{"visibility": "on"}]},{"featureType": "poi.business","elementType": "labels.text.stroke","stylers": [{"color": "#ffffff"},{"visibility": "on"}]},{"featureType": "poi.park","stylers": [{"color": "#aff5a7"},{"visibility": "off"}]},{"featureType": "poi.park","elementType": "geometry.fill","stylers": [{"color": "#e7fbdd"},{"visibility": "on"}]},{"featureType": "road","stylers": [{"saturation": -100},{"lightness": 45}]},{"featureType": "road.arterial","elementType": "labels.icon","stylers": [{"visibility": "off"}]},{"featureType": "road.highway","stylers": [{"visibility": "simplified"}]},{"featureType": "transit","stylers": [{"visibility": "off"}]},{"featureType": "water","stylers": [{"color": "#46bcec"},{"visibility": "on"}]}]';
  String darkMapStyle =
      '[{"elementType": "geometry","stylers": [{"color": "#202c3e"}]},{"elementType": "labels.icon","stylers": [{"visibility": "off"}]},{"elementType": "labels.text.fill","stylers": [{"color": "#ffffff"},{"lightness": 20},{"gamma": 0.01},{"weight": "1.39"}]},{"elementType": "labels.text.stroke","stylers": [{"color": "#000000"},{"saturation": "9"},{"visibility": "on"},{"weight": "0.96"}]},{"featureType": "administrative","stylers": [{"color": "#ffffff"},{"visibility": "on"},{"weight": 2}]},{"featureType": "administrative.country","elementType": "labels","stylers": [{"visibility": "off"}]},{"featureType": "administrative.locality","stylers": [{"color": "#ffffff"},{"visibility": "on"}]},{"featureType": "administrative.locality","elementType": "labels.text.stroke","stylers": [{"visibility": "off"}]},{"featureType": "administrative.neighborhood","elementType": "labels.text","stylers": [{"visibility": "off"}]},{"featureType": "administrative.neighborhood","elementType": "labels.text.stroke","stylers": [{"visibility": "off"}]},{"featureType": "administrative.province","stylers": [{"visibility": "off"}]},{"featureType": "administrative.province","elementType": "labels.text.stroke","stylers": [{"visibility": "off"}]},{"featureType": "landscape","elementType": "geometry","stylers": [{"color": "#29446b"},{"saturation": 10},{"lightness": 30},{"visibility": "on"}]},{"featureType": "landscape.man_made","stylers": [{"color": "#1e0e44"}]},{"featureType": "landscape.man_made","elementType": "geometry.stroke","stylers": [{"color": "#ffffff"},{"visibility": "off"}]},{"featureType": "poi","stylers": [{"visibility": "off"}]},{"featureType": "poi","elementType": "geometry","stylers": [{"saturation": 20}]},{"featureType": "poi.business","elementType": "geometry.fill","stylers": [{"visibility": "off"}]},{"featureType": "poi.business","elementType": "labels","stylers": [{"visibility": "on"}]},{"featureType": "poi.business","elementType": "labels.icon","stylers": [{"color": "#686262"},{"visibility": "on"}]},{"featureType": "poi.business","elementType": "labels.text.fill","stylers": [{"color": "#ffffff"},{"visibility": "on"}]},{"featureType": "poi.business","elementType": "labels.text.stroke","stylers": [{"color": "#000000"},{"visibility": "on"}]},{"featureType": "poi.park","elementType": "geometry","stylers": [{"color": "#618365"},{"saturation": -20},{"lightness": 20},{"visibility": "on"}]},{"featureType": "road","elementType": "geometry","stylers": [{"saturation": -30},{"lightness": 10}]},{"featureType": "road","elementType": "geometry.fill","stylers": [{"color": "#2c4d68"}]},{"featureType": "road","elementType": "geometry.stroke","stylers": [{"saturation": 25},{"lightness": 25}]},{"featureType": "water","stylers": [{"color": "#2ee8f5"},{"lightness": -20},{"visibility": "simplified"}]}]';

  /*
  * Widgets
  * */
  Widget checkoutHeader(context, String preTitle, String business,
      {Color? color,
      int? maxLines,
      double? size,
      TextAlign? textAlign,
      TextDecoration? decoration}) {
    return RichText(
      textAlign: textAlign ?? TextAlign.start,
      maxLines: maxLines,
      text: TextSpan(
        children: <TextSpan>[
          TextSpan(
            text: preTitle,
            style: TextStyle(
                fontFamily: 'metropolis',
                color: color ?? Theme.of(context).textTheme.bodyMedium!.color,
                fontSize: size ?? Dalai.text.h2,
                fontWeight: Dalai.text.regularWeight,
                decoration: decoration ?? TextDecoration.none),
          ),
          TextSpan(
            text: business,
            style: TextStyle(
                fontFamily: 'metropolis',
                color: color ?? Theme.of(context).textTheme.bodyMedium!.color,
                fontSize: size ?? Dalai.text.h2,
                fontWeight: Dalai.text.semiBoldWeight,
                decoration: decoration ?? TextDecoration.none),
          )
        ],
      ),
    );
  }

  Widget spanWithBoldTitle(
    context,
    String title,
    String text, {
    Color? color,
    int? maxLines,
    double? size,
  }) {
    return RichText(
      maxLines: maxLines,
      text: TextSpan(
        style: TextStyle(
          fontFamily: 'metropolis',
          color: color ?? Theme.of(context).textTheme.bodyMedium!.color,
          fontSize: size ?? Dalai.text.regularText,
          fontWeight: Dalai.text.regularWeight,
        ),
        children: <TextSpan>[
          TextSpan(
            text: title,
            style: TextStyle(
              fontWeight: Dalai.text.semiBoldWeight,
            ),
          ),
          TextSpan(
            text: text,
          )
        ],
      ),
    );
  }

  getSlideTransition(Animation<Offset>? offsetFloat, BuildContext context,
      String imagePath, bool fullWidth, bool alignRight) {
    if (fullWidth) {
      return SlideTransition(
          position: offsetFloat!,
          child: SizedBox(
            height: MediaQuery.of(context).size.width / 2.1 -
                Dalai.spacing.lateralPaddingValue / 2,
            width: MediaQuery.of(context).size.width,
            child: Image.asset(
              imagePath,
              alignment: alignRight ? Alignment.centerRight : Alignment.center,
              height: MediaQuery.of(context).size.width / 2.1 -
                  Dalai.spacing.lateralPaddingValue / 2,
              width: MediaQuery.of(context).size.width -
                  2 * Dalai.spacing.lateralPaddingValue,
            ),
          ));
    }
    return SlideTransition(
        position: offsetFloat!,
        child: SizedBox(
          height: MediaQuery.of(context).size.width / 2.1 -
              Dalai.spacing.lateralPaddingValue / 2,
          width: MediaQuery.of(context).size.width / 2.1 -
              Dalai.spacing.lateralPaddingValue / 2,
          child: Image.asset(
            imagePath,
            height: MediaQuery.of(context).size.width / 2.1 -
                Dalai.spacing.lateralPaddingValue / 2,
            width: MediaQuery.of(context).size.width / 2.1 -
                Dalai.spacing.lateralPaddingValue / 2,
          ),
        ));
  }

  Widget getProductPlaceholder(BuildContext context,
      {bool forceLight = false}) {
    return Padding(
      padding: EdgeInsets.all(Dalai.spacing.lateralPaddingValue),
      child: Center(
        child: Opacity(
          opacity: 0.2,
          child: Dalai.icon.dalaiIcons(context, CXIcon.image,
              secondaryColor: Dalai.color.primary,
              mainColor: forceLight ? Dalai.color.secondary : null,
              size: CXIconSize.x_large),
        ),
      ),
    );
  }

  Widget noResultsWidget(BuildContext context,
      {required String crashErrorTitle, required String crashErrorMessage}) {
    var title = crashErrorTitle;
    var message = crashErrorMessage;

    return SafeArea(
      bottom: false,
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            const Expanded(
              child: SizedBox.shrink(),
            ),
            Center(
              child: Lottie.asset(
                'assets/animations.dart/ax_error_search.json',
                width: MediaQuery.of(context).size.width * 0.8,
              ),
            ),
            const Expanded(
              child: SizedBox.shrink(),
            ),
            Dalai.text.regular(context, title, bold: true),
            Dalai.spacing.spacer(small: true),
            Dalai.text.regular(context, message),
            const SizedBox(
              height: 8,
            ),
            const Expanded(
              child: SizedBox.shrink(),
            ),
          ],
        ),
      ),
    );
  }

  Widget defaultUserProfileImage(BuildContext context, String? initials) {
    if (initials != null && initials.isNotEmpty) {
      return Center(
        child: Opacity(
            opacity: 0.2,
            child: Dalai.text
                .title1(context, initials, color: Dalai.color.secondary)),
      );
    }
    return getProductPlaceholder(context);
  }

  Widget loadingAnimation(BuildContext context,
      {double size = 24.0, bool light = false}) {
    return SizedBox(
        width: (2 * size * 0.88),
        height: (2 * size * 0.88),
        child: Center(
          child: LoadingAnimationWidget.discreteCircle(
            color: light ? Dalai.color.white : Dalai.color.primary,
            secondRingColor: light
                ? Dalai.color.primaryContrast
                : Dalai.color.primaryAlternativeDark,
            thirdRingColor: light
                ? Dalai.color.primaryAlternativeDark
                : Dalai.color.primaryAlternativeLight,
            size: size,
          ),
        ));
  }

  bottomSheetPicker(
      BuildContext context, String? title, String? subtitle, Widget content,
      {String? dismissText,
      String? buttonText,
      Function? onButtonPressed,
      Function? onDismissPressed}) {
    Utils.showBottomSheet(context,
        skipPadding: false,
        content: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Dalai.spacing.spacer(small: true),
            title != null
                ? Dalai.text.small(context, title, bold: true)
                : SizedBox.shrink(),
            subtitle != null
                ? Dalai.spacing.spacer(small: true)
                : SizedBox.shrink(),
            subtitle != null
                ? Dalai.text.title3(context, subtitle)
                : SizedBox.shrink(),
            Dalai.spacing.spacer(multiplier: 1),
            content,
            Row(
              children: [
                dismissText == null
                    ? const SizedBox.shrink()
                    : Expanded(
                        flex: 1,
                        child: SizedBox(
                          width: double.infinity,
                          child:
                              Dalai.button.noBgButton(context, dismissText, () {
                            if (onDismissPressed != null) {
                              onDismissPressed();
                            }
                            Navigator.pop(context);
                          }),
                        ),
                      ),
                Dalai.spacing.hSpacer(),
                buttonText == null
                    ? const SizedBox.shrink()
                    : Expanded(
                        flex: 2,
                        child: SizedBox(
                          width: double.infinity,
                          child: Dalai.button.button(context, buttonText, () {
                            if (onButtonPressed != null) {
                              onButtonPressed();
                            }
                            Navigator.pop(context);
                          }),
                        ),
                      )
              ],
            )
          ],
        ));
  }

  Widget noticeCard(BuildContext context, String? text,
      {Function? onTap,
      String? title,
      CXIcon? leadingIcon,
      CXIcon? trailingIcon}) {
    return GestureDetector(
        onTap: () {
          if (onTap != null) {
            onTap();
          }
        },
        child: Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(
                horizontal: Dalai.spacing.lateralPaddingValue,
                vertical: Dalai.spacing.lateralPaddingValue),
            decoration: BoxDecoration(
                color: Theme.of(context).brightness == Brightness.light
                    ? Dalai.color.cream
                    : Dalai.color.cream.withOpacity(0.1),
                borderRadius:
                    BorderRadius.circular(Dalai.spacing.borderRadius)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                leadingIcon != null
                    ? Padding(
                        padding: EdgeInsets.only(
                            right: Dalai.spacing.lateralPaddingValue),
                        child: Dalai.icon.dalaiIcons(context, leadingIcon),
                      )
                    : SizedBox.shrink(),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      title == null
                          ? SizedBox.shrink()
                          : Dalai.text.small(context, title, bold: true),
                      Dalai.text.small(context, text,
                          color: Theme.of(context).textTheme.bodyMedium!.color!)
                    ],
                  ),
                ),
                trailingIcon != null
                    ? Padding(
                        padding: EdgeInsets.only(
                            left: Dalai.spacing.lateralPaddingValue),
                        child: Dalai.icon.dalaiIcons(context, trailingIcon),
                      )
                    : SizedBox.shrink(),
              ],
            )));
  }

  Widget nutriscoreItem(Color color, String letter, BuildContext context,
      {bool isFirst = false, bool isLast = false, bool selected = false}) {
    return Stack(
      alignment: AlignmentDirectional.center,
      children: [
        Container(
            padding: EdgeInsets.only(
                left: Dalai.spacing.lateralPaddingValue / 2 +
                    (selected
                        ? 0
                        : isFirst
                            ? 2
                            : 1),
                right: Dalai.spacing.lateralPaddingValue / 2 +
                    (selected
                        ? 0
                        : isLast
                            ? 2
                            : 1),
                top: Dalai.spacing.lateralPaddingValue / 2,
                bottom: (Dalai.spacing.lateralPaddingValue / 2) - 1),
            decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(
                        isFirst ? Dalai.spacing.borderRadius / 2 : 0),
                    bottomLeft: Radius.circular(
                        isFirst ? Dalai.spacing.borderRadius / 2 : 0),
                    topRight: Radius.circular(
                        isLast ? Dalai.spacing.borderRadius / 2 : 0),
                    bottomRight: Radius.circular(
                        isLast ? Dalai.spacing.borderRadius / 2 : 0))),
            child: Dalai.text.title3(context, letter, color: Colors.white)),
        selected
            ? Container(
                padding: EdgeInsets.only(
                  left: (Dalai.spacing.lateralPaddingValue / 2),
                  right: (Dalai.spacing.lateralPaddingValue / 2),
                  top: 12,
                  bottom: 11,
                ),
                decoration: BoxDecoration(
                    color: color,
                    border: selected
                        ? Border.all(
                            color: Colors.white,
                            width: 1.5 * Dalai.spacing.borderWidth)
                        : null,
                    borderRadius: selected
                        ? BorderRadius.circular(200)
                        : BorderRadius.only(
                            topLeft: Radius.circular(
                                isFirst ? Dalai.spacing.borderRadius / 2 : 0),
                            bottomLeft: Radius.circular(
                                isFirst ? Dalai.spacing.borderRadius / 2 : 0),
                            topRight: Radius.circular(
                                isLast ? Dalai.spacing.borderRadius / 2 : 0),
                            bottomRight: Radius.circular(
                                isLast ? Dalai.spacing.borderRadius / 2 : 0))),
                child: Dalai.text.title3(context, letter, color: Colors.white))
            : SizedBox.shrink()
      ],
    );
  }

  Widget getNutriscoreImage(
      NutriscoreLevel nutriscoreLevel, BuildContext context,
      {double size = 44}) {
    return Container(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      padding: EdgeInsets.all(Dalai.spacing.lateralPaddingValue / 2),
      decoration: BoxDecoration(
          color: Colors.transparent,
          border: Border.all(
              color: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .color!
                  .withOpacity(0.8),
              width: Dalai.spacing.borderWidth),
          borderRadius: BorderRadius.circular(Dalai.spacing.borderRadius)),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Dalai.text.xs(context, 'Nutriscore',
              bold: true,
              color: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .color!
                  .withOpacity(0.8)),
          nutriscoreLevel == NutriscoreLevel.none
              ? Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    nutriscoreItem(
                        Color(0xff50A591).withOpacity(0.25), 'A', context,
                        isFirst: true,
                        selected: nutriscoreLevel == NutriscoreLevel.A),
                    nutriscoreItem(
                        Color(0xff90C580).withOpacity(0.25), 'B', context,
                        selected: nutriscoreLevel == NutriscoreLevel.B),
                    nutriscoreItem(
                        Color(0xffF6BE56).withOpacity(0.25), 'C', context,
                        selected: nutriscoreLevel == NutriscoreLevel.C),
                    nutriscoreItem(
                        Color(0xffED7E46).withOpacity(0.25), 'D', context,
                        selected: nutriscoreLevel == NutriscoreLevel.D),
                    nutriscoreItem(
                        Color(0xffD2293A).withOpacity(0.25), 'E', context,
                        isLast: true,
                        selected: nutriscoreLevel == NutriscoreLevel.E)
                  ],
                )
              : Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    nutriscoreItem(Color(0xff50A591), 'A', context,
                        isFirst: true,
                        selected: nutriscoreLevel == NutriscoreLevel.A),
                    nutriscoreItem(Color(0xff90C580), 'B', context,
                        selected: nutriscoreLevel == NutriscoreLevel.B),
                    nutriscoreItem(Color(0xffF6BE56), 'C', context,
                        selected: nutriscoreLevel == NutriscoreLevel.C),
                    nutriscoreItem(Color(0xffED7E46), 'D', context,
                        selected: nutriscoreLevel == NutriscoreLevel.D),
                    nutriscoreItem(Color(0xffD2293A), 'E', context,
                        isLast: true,
                        selected: nutriscoreLevel == NutriscoreLevel.E)
                  ],
                ),
        ],
      ),
    );
  }

  Widget getCarPlate(String plateNumber, BuildContext context) {
    return Container(
      width: 96,
      height: 36,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(4),
          border: Border.all(color: Colors.black.withOpacity(0.1), width: 1.5)),
      child: Stack(
        alignment: Alignment.center,
        children: [
          SvgPicture.string(
            plateBackground,
            color: Colors.black.withOpacity(
              0.05,
            ),
            fit: BoxFit.cover,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Dalai.spacing.hSpacer(small: true),
              SvgPicture.string(
                andorraBadge,
                fit: BoxFit.cover,
                width: 16,
              ),
              Dalai.spacing.hSpacer(small: true),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Dalai.text.regular(context, plateNumber.replaceAll(" ", ""),
                        bold: true, color: Dalai.color.text),
                    Text('PRINCIPAT D\'ANDORRA',
                        maxLines: 1,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          letterSpacing: 0,
                          fontWeight: FontWeight.bold,
                          height: 1,
                          color: Colors.blue,
                          fontSize: 5.0,
                        )),
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  Future<Uint8List?> getMapMarker(MapMarker marker, BuildContext context,
      {MapMarkerState state = MapMarkerState.selected}) async {
    String rawSvg = '';
    if (marker == MapMarker.shop) {
      if (state == MapMarkerState.selected) {
        rawSvg = markerPartnerSelected;
      } else {
        rawSvg = markerPartnerUnselected;
      }
    } else if (marker == MapMarker.currentLocation) {
      rawSvg = markerCurrentLocation;
    } else if (marker == MapMarker.origin) {
      if (Theme.of(context).brightness == Brightness.light) {
        if (state == MapMarkerState.selected) {
          rawSvg = markerOriginUp;
        } else {
          rawSvg = markerOriginDown;
        }
      } else {
        if (state == MapMarkerState.selected) {
          rawSvg = markerOriginUpDark;
        } else {
          rawSvg = markerOriginDownDark;
        }
      }
    } else if (marker == MapMarker.destination) {
      if (state == MapMarkerState.selected) {
        rawSvg = markerDestinationUp;
      } else {
        rawSvg = markerDestinationDown;
      }
    } else if (marker == MapMarker.car) {
      rawSvg = markerCar;
    } else if (marker == MapMarker.rider) {
      rawSvg = markerRider;
    } else if (marker == MapMarker.van) {
      rawSvg = markerCar;
    }

    return svgToPng(rawSvg);
  }

  Future<Uint8List> getBytesFromPng(String path, int width) async {
    ByteData data = await rootBundle.load(path);
    ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List(),
        targetWidth: width);
    ui.FrameInfo fi = await codec.getNextFrame();
    return (await fi.image.toByteData(format: ui.ImageByteFormat.png))!
        .buffer
        .asUint8List();
  }

  Future<Uint8List?> svgToPng(String svgString) async {
    final document = XmlDocument.parse(svgString);
    final svgElement = document.rootElement;
    final widthAttribute =
        svgElement.getAttribute('width')!.replaceAll("px", "");
    final heightAttribute =
        svgElement.getAttribute('height')!.replaceAll("px", "");

    final svgDrawableRoot =
        await vg.loadPicture(SvgStringLoader(svgString), null);

    final image = await svgDrawableRoot.picture.toImage(
        int.parse(widthAttribute.toString()),
        int.parse(heightAttribute.toString()));
    ByteData? bytes = await image.toByteData(format: ui.ImageByteFormat.png);

    return (bytes?.buffer.asUint8List());
  }

  Image getPlaceholderImage(PlaceholderImage image,
      {BoxFit fit = BoxFit.cover}) {
    if (image == PlaceholderImage.courier) {
      return Image.asset(
          'lib/assets/images/placeholders/placeholder_courier.jpg',
          package: 'dalai',
          fit: fit);
    } else if (image == PlaceholderImage.partner) {
      return Image.asset(
        'lib/assets/images/placeholders/placeholder_anything.jpg',
        package: 'dalai',
        fit: fit,
      );
    } else if (image == PlaceholderImage.experienceZone) {
      return Image.asset(
        'lib/assets/images/placeholders/placeholder_experiences.jpg',
        package: 'dalai',
        fit: fit,
      );
    }
    return Image.asset(
      'packages/dalai/assets/images/placeholders/placeholder_anything.jpg',
      fit: fit,
    );
  }

  ImageProvider getPlaceholderImageProvider(PlaceholderImage image,
      {BoxFit fit = BoxFit.cover}) {
    return getPlaceholderImage(image, fit: fit).image;
  }

  Widget checkboxList(
      List<String> titles, List<String?> subtitles, List<CXIcon?> icons,
      {int selected = 0, required Function(int value) onSelect}) {
    return ListView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: titles.length,
        itemBuilder: (context, index) {
          return Dalai.tile.listTileWithSub(
              titles[index], context, subtitles[index],
              leading: icons[index] == null
                  ? null
                  : Dalai.icon.dalaiIcons(context, icons[index]!,
                      secondaryColor: Theme.of(context).colorScheme.primary),
              trailing: Dalai.button.checkbox(selected == index, (value) {
                onSelect(index);
              }, context));
        });
  }
}
