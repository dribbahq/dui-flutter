import 'package:cityxerpa_icons/cityxerpa_symbols.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import '../dalai.dart';

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
                decoration:
                    decoration ?? TextDecoration.none),
          ),
          TextSpan(
            text: business,
            style: TextStyle(
                fontFamily: 'metropolis',
                color: color ?? Theme.of(context).textTheme.bodyMedium!.color,
                fontSize: size ?? Dalai.text.h2,
                fontWeight: Dalai.text.semiBoldWeight,
                decoration:
                    decoration ?? TextDecoration.none),
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
                'assets/animations/ax_error_search.json',
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

  Widget defaultUserProfileImage(BuildContext context,
      {required dynamic userManager}) {
    if (userManager.getUser() != null &&
        userManager.getUser()!.getNameInitials() != null) {
      return Center(
        child: Opacity(
            opacity: 0.2,
            child: Dalai.text.title1(
                context, userManager.getUser()!.getNameInitials(),
                color: Dalai.color.secondary)),
      );
    }
    return getProductPlaceholder(context);
  }
}
