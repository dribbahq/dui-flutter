import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_vibrate/flutter_vibrate.dart';
import 'package:intl/intl.dart';
import 'package:latlng/latlng.dart';
import 'package:map_launcher/map_launcher.dart';
import 'package:palette_generator/palette_generator.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:vector_math/vector_math.dart' as deg;
import '../dui.dart';
import 'custom_modal_bottom_sheet.dart';

class Utils {
  /*
  * Common Utils
  * */
  static List<bool?> asBools(int? val, int bits) {
    var list = List<bool?>.filled(bits, null, growable: false);

    var mask = 1 << (bits - 1);
    for (var i = 0; i < bits; i++, mask >>= 1) {
      list[i] = val! & mask != 0;
    }
    return list.reversed.toList();
  }

  static int roundUp(int toRound) {
    try {
      if (toRound % 5 == 0) return toRound;
      return (5 - toRound % 5) + toRound;
    } catch (e) {
      return 15;
    }
  }

  static List<Object> rotate(List<Object> list, int v) {
    if (list.isEmpty) return list;
    var i = v % list.length;
    return list.sublist(i)..addAll(list.sublist(0, i));
  }

  /* ------------------------------------------------------------------------- */

  /*
  * Modals and Bottom Sheet Utils
  * */
  static Future showBottomSheet(context,
      {Widget? content, bool dismissible = true, double? maxHeight, bool skipPadding = false}) {
    return CustomShowModalBottomSheet.customShowModalBottomSheet(
      darkMode: Theme.of(context).brightness == Brightness.light,
      context: context,
      dismissible: dismissible,
      builder: (context) {
        return Container(
          constraints: BoxConstraints(maxHeight: maxHeight ?? double.infinity),
          padding: skipPadding
              ? null
              : EdgeInsets.only(
                  bottom: DUI.spacing.lateralPaddingValue,
                  left: DUI.spacing.lateralPaddingValue,
                  right: DUI.spacing.lateralPaddingValue),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.background,
            borderRadius: BorderRadius.vertical(top: Radius.circular(DUI.spacing.largeBorderRadius)),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                blurRadius: 5.0,
                offset: const Offset(0.0, 0.0),
              ),
            ],
          ),
          child: Wrap(
            children: <Widget>[
              SafeArea(
                top: false,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    dismissible == true
                        ? Center(
                            child: Opacity(
                              opacity: 0.2,
                              child: Container(
                                width: 49,
                                height: 5.5,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                            ),
                          )
                        : DUI.spacing.spacer(multiplier: 2),
                    content ?? const SizedBox.shrink()
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  static showBottomPage(
    context, {
    Widget? content,
    bool dismissible = false,
    double? maxHeight,
  }) {
    showModalBottomSheet(
        context: context,
        enableDrag: dismissible,
        isDismissible: dismissible,
        isScrollControlled: true,
        useSafeArea: false,
        constraints: BoxConstraints(maxHeight: maxHeight ?? MediaQuery.of(context).size.height * 0.95),
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(DUI.spacing.borderRadius))),
        clipBehavior: Clip.antiAliasWithSaveLayer,
        builder: (context) {
          return content ?? Container();
        });
  }

  /* ------------------------------------------------------------------------- */

  /*
  * Date Helper Methods
  * */
  static DateFormat dateFormatScheduleSet = DateFormat('yyyy-MM-ddTHH:mm:ss.SSS', 'ca_ES');
  static DateFormat dateFormatScheduleGet = DateFormat('yyyy-MM-ddTHH:mm:ssZ', 'ca_ES');

  static String formatDate(DateTime date, {String? localeCode}) {
    return DateFormat('EEE, dd MMM', localeCode ?? 'ca_ES').format(date);
  }

  static String formatDateTime(DateTime date, {String? localeCode}) {
    return DateFormat('EEEE, dd/MMMM, HH:mm', localeCode ?? 'ca_ES').format(date);
  }

  static String formatDateformatTime(DateTime date, {String? localeCode}) {
    return DateFormat('HH:mm', localeCode ?? 'ca_ES').format(date);
  }

  static String getDate(String date, DateFormat format) {
    return DateFormat('dd/MM/yyyy').format(format.parse(date));
  }

  static String getNiceDateMinus10(String date, DateFormat format, {String? localeCode}) {
    try {
      return '${DateFormat('EE, dd/MM/yy, HH:mm', localeCode ?? 'ca_ES').format(format.parseUTC(date).toLocal())}h';
    } catch (e) {
      return '';
    }
  }

  static String getNiceDate(String date, DateFormat format, {String? localeCode}) {
    try {
      return '${DateFormat('dd MMMM yyyy, HH:mm', localeCode ?? 'ca_ES').format(format.parseUTC(date).toLocal())}h';
    } catch (e) {
      return '';
    }
  }

  static String getNiceSmallDate(String date, DateFormat format, {String? localeCode}) {
    try {
      return '${DateFormat('dd MMM, HH:mm', localeCode ?? 'ca_ES').format(format.parseUTC(date).toLocal())}h';
    } catch (e) {
      return '';
    }
  }

  static String getNiceSmallDateNoHour(String date, DateFormat format, {String? localeCode}) {
    try {
      return DateFormat('dd MMM', localeCode ?? 'ca_ES').format(format.parseUTC(date).toLocal());
    } catch (e) {
      return '';
    }
  }

  /* ------------------------------------------------------------------------- */

  /*
  * Time Helper Methods
  * */
  static String getTime(date, format) {
    return DateFormat('HH:mm').format(format.parseUTC(date).toLocal());
  }

  static bool timeOfDayIsBefore(TimeOfDay a, TimeOfDay b) {
    if (a.hour == b.hour) {
      if (a.minute < b.minute) {
        return true;
      }
      return false;
    }
    if (a.hour < b.hour) {
      return true;
    }
    return false;
  }

  static bool isToday(DateTime other) {
    return DateTime.now().year == other.year && DateTime.now().month == other.month && DateTime.now().day == other.day;
  }

  static bool isTomorrow(DateTime other) {
    return DateTime.now().year == other.year &&
        DateTime.now().month == other.month &&
        DateTime.now().day + 1 == other.day;
  }

  static bool isSameDay(DateTime dateA, DateTime dateB) {
    return dateA.year == dateB.year && dateA.month == dateB.month && dateA.day == dateB.day;
  }

  static bool isWeekend(DateTime dateA) {
    return dateA.weekday == DateTime.saturday || dateA.weekday == DateTime.sunday;
  }

  static bool isExcludedDays(List<int> days, DateTime targetDate) {
    for (int day in days) {
      if (day == targetDate.weekday) {
        return true;
      }
    }
    return false;
  }

  static bool containsDate(List<DateTime> dates, DateTime targetDate) {
    for (DateTime date in dates) {
      if (isSameDay(date, targetDate)) {
        return true;
      }
    }
    return false;
  }

  /* ------------------------------------------------------------------------- */

  /*
  * Launcher Helpers Methods
  * */
  static launchMaps(List<double> geolocation, String? name, {DirectionsMode? directionsMode}) async {
    LatLng location = LatLng(Angle.degree(geolocation[0]), Angle.degree(geolocation[1]));
    final availableMaps = await MapLauncher.installedMaps;
    await availableMaps.first.showDirections(
        destination: Coords(location.longitude.degrees, location.latitude.degrees),
        destinationTitle: name ?? "",
        directionsMode: directionsMode ?? DirectionsMode.walking);
  }

  static launchUrl(url) async {
    if (await canLaunchUrlString(url)) {
      await launchUrlString(url, mode: LaunchMode.externalApplication);
    } else {
      throw 'Could not launch';
    }
  }

  /* ------------------------------------------------------------------------- */

  /*
  * Pricing Helper Methods
  * */
  static String parsePrice(p) {
    String? stringedPrice;
    if (p is double) {
      stringedPrice = "$p";
    } else {
      stringedPrice = p;
    }

    if (stringedPrice != null && double.tryParse(stringedPrice) != null) {
      double price = double.parse(stringedPrice);
      if (price % 1 == 0) {
        return NumberFormat.currency(locale: 'es_ES', symbol: '', decimalDigits: 0).format(price.round());
      }
      return NumberFormat.currency(locale: 'es_ES', symbol: '', decimalDigits: 2).format(price);
    }
    return "0";
  }

  static String parseMeasure(double price) {
    if (price % 1 == 0) {
      return NumberFormat.decimalPattern().format(price.round());
    }
    return NumberFormat.decimalPattern().format(double.parse(price.toStringAsFixed(1)));
  }

  static String parsePriceCents(p) {
    if (p != null && double.tryParse(p) != null) {
      double price = double.parse(p) / 100;
      if (price % 1 == 0) {
        return NumberFormat.currency(locale: 'eu', symbol: '', decimalDigits: 0).format(price.round());
      }
      return NumberFormat.currency(locale: 'eu', symbol: '', decimalDigits: 2).format(price);
    }
    return "0";
  }

  /* ------------------------------------------------------------------------- */

  /*
  * Vibration Helper Methods
  * */
  static vibrateOnTap() async {
    bool canVibrate = await Vibrate.canVibrate;
    if (canVibrate) {
      Vibrate.feedback(FeedbackType.light);
    }
  }

  static vibrateOnImpact() async {
    bool canVibrate = await Vibrate.canVibrate;
    if (canVibrate) {
      Vibrate.feedback(FeedbackType.impact);
    }
  }

  static vibrateOnHeavyTap() async {
    bool canVibrate = await Vibrate.canVibrate;
    if (canVibrate) {
      Vibrate.feedback(FeedbackType.heavy);
    }
  }

  static vibrateOnErrorTap() async {
    bool canVibrate = await Vibrate.canVibrate;
    if (canVibrate) {
      Vibrate.feedback(FeedbackType.error);
    }
  }

  /* ------------------------------------------------------------------------- */

  /*
  * Map Helper Methods
  * */
  static double getDegree(LatLng begin, LatLng end) {
    double lat = (begin.latitude.degrees - end.latitude.degrees).abs();

    double lng = (begin.longitude.degrees - end.longitude.degrees).abs();

    if (begin.latitude.degrees < end.latitude.degrees && begin.longitude.degrees < end.longitude.degrees) {
      return deg.degrees(atan(lng / lat));
    } else if (begin.latitude.degrees >= end.latitude.degrees && begin.longitude.degrees < end.longitude.degrees) {
      return (90 - deg.degrees(atan(lng / lat))) + 90;
    } else if (begin.latitude.degrees >= end.latitude.degrees && begin.longitude.degrees >= end.longitude.degrees) {
      return deg.degrees(atan(lng / lat)) + 180;
    } else if (begin.latitude.degrees < end.latitude.degrees && begin.longitude.degrees >= end.longitude.degrees) {
      return (90 - deg.degrees(atan(lng / lat))) + 270;
    }

    return -1;
  }

  static bool sameCoordinate(LatLng coord1, LatLng coord2) {
    if (coord1.latitude == coord2.latitude && coord1.longitude == coord2.longitude) {
      return true;
    }
    return false;
  }

  /* ------------------------------------------------------------------------- */

  /*
  * Color Helper Methods
  * */
  static Future<Color> getImagePalette(ImageProvider imageProvider) async {
    final PaletteGenerator paletteGenerator = await PaletteGenerator.fromImageProvider(imageProvider);
    return paletteGenerator.dominantColor!.color;
  }
}
