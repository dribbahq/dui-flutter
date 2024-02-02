import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:substring_highlight/substring_highlight.dart';
import '../common_utils/common_utils.dart';
import '../dui.dart';

class DUIText {
  // font sizes
  final double xxsText = 10.0;
  final double xsText = 12.0;
  final double smallText = 14.0;
  final double regularText = 16.0;
  final double h3 = 18.0;
  final double h2 = 20.0;
  final double h1 = 24.0;
  final double head3 = 34.0;
  final double head2 = 48.0;
  final double head1 = 60.0;

  // font weight
  final FontWeight regularWeight = FontWeight.w400;
  final FontWeight semiBoldWeight = FontWeight.w600;
  final FontWeight boldWeight = FontWeight.w700;

  final double textHeight = 1.3;

  /*
  * Text widgets
  * */
  Widget headline1(BuildContext context, String? text, {int? maxLines, TextAlign? textAlign, Color? color}) {
    return Text(
      text ?? '',
      textAlign: textAlign ?? TextAlign.start,
      maxLines: maxLines,
      overflow: maxLines != null ? TextOverflow.ellipsis : null,
      style: Theme.of(context).textTheme.displayLarge!.copyWith(
        color: color ?? Theme.of(context).textTheme.displayLarge!.color,
      ),
    );
  }

  Widget headline2(BuildContext context, String? text, {int? maxLines, TextAlign? textAlign, Color? color}) {
    return Text(
      text ?? '',
      textAlign: textAlign ?? TextAlign.start,
      maxLines: maxLines,
      overflow: maxLines != null ? TextOverflow.ellipsis : null,
      style: Theme.of(context).textTheme.displayMedium!.copyWith(
        color: color ?? Theme.of(context).textTheme.displayMedium!.color,
      ),
    );
  }

  Widget headline3(BuildContext context, String? text, {int? maxLines, TextAlign? textAlign, Color? color}) {
    return Text(
      text ?? '',
      textAlign: textAlign ?? TextAlign.start,
      maxLines: maxLines,
      overflow: maxLines != null ? TextOverflow.ellipsis : null,
      style: Theme.of(context).textTheme.displaySmall!.copyWith(
        color: color ?? Theme.of(context).textTheme.displayMedium!.color,
      ),
    );
  }


  Widget title1(BuildContext context, String? text,
      {int? maxLines,
      TextAlign? textAlign,
      Color? color,
      TextDecoration? textDecoration}) {
    return Text(
      text ?? '',
      textAlign: textAlign ?? TextAlign.start,
      maxLines: maxLines,
      overflow: maxLines != null ? TextOverflow.ellipsis : null,
      style: TextStyle(
          fontFamily: Theme.of(context).textTheme.bodyMedium!.fontFamily,
          color: color ?? Theme.of(context).textTheme.titleLarge!.color,
          fontSize: h1,
          height: textHeight,
          fontWeight: boldWeight,
          decoration: textDecoration),
    );
  }

  Widget title2(BuildContext context, String? text,
      {int? maxLines,
      TextAlign? textAlign,
      Color? color,
      TextDecoration? textDecoration}) {
    return Text(
      text ?? '',
      textAlign: textAlign ?? TextAlign.start,
      maxLines: maxLines,
      overflow: maxLines != null ? TextOverflow.ellipsis : null,
      style: TextStyle(
          fontFamily: Theme.of(context).textTheme.bodyMedium!.fontFamily,
          color: color ?? Theme.of(context).textTheme.titleLarge!.color,
          fontSize: h2,
          height: textHeight,
          fontWeight: semiBoldWeight,
          decoration: textDecoration),
    );
  }

  Widget title3(BuildContext context, String? text,
      {int? maxLines,
      TextAlign? textAlign,
      Color? color,
      TextDecoration? textDecoration}) {
    return Text(
      text ?? '',
      textAlign: textAlign ?? TextAlign.start,
      maxLines: maxLines,
      overflow: maxLines != null ? TextOverflow.ellipsis : null,
      style: TextStyle(
          fontFamily: Theme.of(context).textTheme.bodyMedium!.fontFamily,
          color: color ?? Theme.of(context).textTheme.titleLarge!.color,
          fontSize: h3,
          height: textHeight,
          fontWeight: semiBoldWeight,
          decoration: textDecoration),
    );
  }

  Widget regular(BuildContext context, String? text,
      {int? maxLines,
      TextAlign? textAlign,
      bool? bold = false,
      Color? color,
      double? height,
      String? highlightText,
      TextDecoration? decoration}) {
    if (highlightText != null) {
      TextStyle selectedTextStyle = TextStyle(
        fontSize: DUI.text.regularText,
        height: DUI.text.textHeight,
        fontWeight: DUI.text.boldWeight,
        fontFamily: Theme.of(context).textTheme.bodyMedium!.fontFamily,
        color: Theme.of(context).textTheme.bodyMedium!.color,
      );
      TextStyle unselectedTextStyle = TextStyle(
        fontSize: DUI.text.regularText,
        height: DUI.text.textHeight,
        fontWeight: DUI.text.semiBoldWeight,
        fontFamily: Theme.of(context).textTheme.bodyMedium!.fontFamily,
        color: highlightText.isNotEmpty
            ? Theme.of(context).textTheme.bodyMedium!.color!.withOpacity(0.85)
            : Theme.of(context).textTheme.bodyMedium!.color,
      );

      return SubstringHighlight(
        text: text ?? '',
        term: highlightText,
        textStyle: unselectedTextStyle,
        textStyleHighlight: selectedTextStyle,
      );
    }

    return Text(
      text ?? '',
      textAlign: textAlign ?? TextAlign.start,
      maxLines: maxLines,
      overflow: maxLines != null ? TextOverflow.ellipsis : null,
      style: regularTextStyle(context,
          bold: bold, color: color, height: height, decoration: decoration),
    );
  }

  Widget small(BuildContext context, String? text,
      {int? maxLines,
      TextAlign? textAlign,
      Color? color,
      double? height,
      TextDecoration? decoration,
      bool? bold = false}) {
    return Text(
      text ?? '',
      textAlign: textAlign ?? TextAlign.start,
      maxLines: maxLines,
      overflow: maxLines != null ? TextOverflow.ellipsis : null,
      style: smallTextStyle(context,
          bold: bold, color: color, height: height, decoration: decoration),
    );
  }

  Widget xs(
    BuildContext context,
    String? text, {
    int? maxLines,
    TextAlign? textAlign,
    Color? color,
    double? height,
    bool? bold = false,
    TextDecoration? decoration,
  }) {
    return Text(
      text ?? '',
      textAlign: textAlign ?? TextAlign.start,
      maxLines: maxLines,
      overflow: maxLines != null ? TextOverflow.ellipsis : null,
      style: TextStyle(
        fontFamily: Theme.of(context).textTheme.bodyMedium!.fontFamily,
        color: color ?? Theme.of(context).textTheme.bodySmall!.color!,
        fontSize: xsText,
        height: height ?? textHeight,
        fontWeight: bold! ? semiBoldWeight : regularWeight,
        decoration: decoration ?? TextDecoration.none,
      ),
    );
  }

  Widget xxs(
      BuildContext context,
      String? text, {
        int? maxLines,
        TextAlign? textAlign,
        Color? color,
        double? height,
        bool? bold = false,
        TextDecoration? decoration,
      }) {
    return Text(
      text ?? '',
      textAlign: textAlign ?? TextAlign.start,
      maxLines: maxLines,
      overflow: maxLines != null ? TextOverflow.ellipsis : null,
      style: TextStyle(
        fontFamily: Theme.of(context).textTheme.bodyMedium!.fontFamily,
        color: color ?? Theme.of(context).textTheme.bodySmall!.color!,
        fontSize: xxsText,
        height: height ?? textHeight,
        fontWeight: bold! ? semiBoldWeight : regularWeight,
        decoration: decoration ?? TextDecoration.none,
      ),
    );
  }

  Widget custom(BuildContext context, String? text,
      {int? maxLines,
      TextAlign? textAlign,
      Color? color,
      double? height,
      TextDecoration? decoration,
      required FontWeight fontWeight,
      required double fontSize,
      String? font}) {
    return Text(
      text ?? '',
      textAlign: textAlign ?? TextAlign.start,
      maxLines: maxLines,
      overflow: maxLines != null ? TextOverflow.ellipsis : null,
      style: TextStyle(
        fontFamily: font ?? Theme.of(context).textTheme.bodyMedium!.fontFamily,
        color: color ?? Theme.of(context).textTheme.bodyMedium!.color,
        fontSize: fontSize,
        fontWeight: fontWeight,
        height: height ?? textHeight,
        decoration: decoration ?? TextDecoration.none,
      ),
    );
  }

  /*
  * HTML
  * */
  Widget htmlBody(text, context, {color, LineHeight? height, int? maxLines}) {
    return Html(
      data: text,
      style: {
        "body": Style(
          maxLines: maxLines,
          color: color ?? Theme.of(context).textTheme.bodyMedium!.color,
          padding: HtmlPaddings.all(0),
          margin: Margins.zero,
          textOverflow: maxLines != null ? TextOverflow.ellipsis : null,
          lineHeight: LineHeight(textHeight),
        ),
        "html": Style(padding: HtmlPaddings.all(0), margin: Margins.zero),
        "div": Style(
            padding: HtmlPaddings.all(0),
            backgroundColor: Colors.transparent,
            fontFamily: Theme.of(context).textTheme.bodyMedium!.fontFamily,
            fontWeight: regularWeight,
            color: color ?? Theme.of(context).textTheme.bodyMedium!.color,
            lineHeight: height ?? LineHeight(textHeight),
            fontSize: FontSize(regularText)),
        "ul": Style(
          listStyleType: ListStyleType.disc,
        ),
        "p": Style(
          fontSize: FontSize(regularText),
          lineHeight: height ?? LineHeight(textHeight),
          color: color ?? Theme.of(context).textTheme.bodyMedium!.color,
        ),
        "small": Style(fontSize: FontSize(smallText)),
        "a": Style(
            color: Theme.of(context).colorScheme.primary,
            fontSize: FontSize(smallText))
      },
      onLinkTap: (url, v1, v2) async {
        await Utils.launchUrl(url);
      },
    );
  }

  Widget htmlBodySmall(text, context, {color, int? maxLines}) {
    return Html(
      data: text,
      style: {
        "body": Style(
          padding: HtmlPaddings.all(0),
          margin: Margins.zero,
          maxLines: maxLines,
          fontSize: FontSize(smallText),
          textOverflow: maxLines != null ? TextOverflow.ellipsis : null,
          lineHeight: LineHeight(textHeight),
          color: Theme.of(context).textTheme.bodySmall!.color,
        ),
        "html": Style(padding: HtmlPaddings.all(0), margin: Margins.zero),
        "div": Style(
            padding: HtmlPaddings.all(0),
            backgroundColor: Colors.transparent,
            fontFamily: Theme.of(context).textTheme.bodyMedium!.fontFamily,
            fontWeight: regularWeight,
            color: Theme.of(context).textTheme.bodySmall!.color,
            lineHeight: LineHeight(textHeight),
            fontSize: FontSize(regularText)),
        "ul": Style(
          listStyleType: ListStyleType.disc,
        ),
        "p": Style(
          fontSize: FontSize(regularText),
        ),
        "small": Style(fontSize: FontSize(smallText)),
        "a": Style(
            color: Theme.of(context).colorScheme.primary,
            fontSize: FontSize(smallText))
      },
      onLinkTap: (url, v1, v2) async {
        await Utils.launchUrl(url);
      },
    );
  }

  Widget superSmallHTMLText(text, context, {color, textAlign, int? maxLines}) {
    return Html(
      data: text,
      style: {
        "body": Style(
          padding: HtmlPaddings.all(0),
          margin: Margins.zero,
          maxLines: maxLines,
          fontSize: FontSize(xsText),
          textOverflow: maxLines != null ? TextOverflow.ellipsis : null,
          lineHeight: LineHeight(textHeight),
          color: Theme.of(context).textTheme.bodySmall!.color,
        ),
        "html": Style(padding: HtmlPaddings.all(0), margin: Margins.zero),
        "div": Style(
            padding: HtmlPaddings.all(0),
            backgroundColor: Colors.transparent,
            fontFamily: Theme.of(context).textTheme.bodyMedium!.fontFamily,
            fontWeight: regularWeight,
            color: Theme.of(context).textTheme.bodySmall!.color,
            lineHeight: LineHeight(textHeight),
            fontSize: FontSize(xsText)),
        "ul": Style(
          listStyleType: ListStyleType.disc,
        ),
        "p": Style(
          fontSize: FontSize(xsText),
        ),
        "small": Style(fontSize: FontSize(xsText)),
        "a": Style(
            color: Theme.of(context).colorScheme.primary,
            fontSize: FontSize(xsText))
      },
      onLinkTap: (url, v1, v2) async {
        await Utils.launchUrl(url);
      },
    );
  }

  /*
  * Text styles
  * */

  TextStyle regularTextStyle(BuildContext context,
      {bool? bold = false,
      Color? color,
      double? height,
      TextDecoration? decoration}) {
    return TextStyle(
      fontFamily: Theme.of(context).textTheme.bodyMedium!.fontFamily,
      color: color ?? Theme.of(context).textTheme.bodyMedium!.color,
      fontSize: regularText,
      fontWeight: bold! ? semiBoldWeight : regularWeight,
      height: height ?? textHeight,
      decoration: decoration ?? TextDecoration.none,
    );
  }

  TextStyle smallTextStyle(BuildContext context,
      {bool? bold = false,
      Color? color,
      double? height,
      TextDecoration? decoration}) {
    return TextStyle(
        fontFamily: Theme.of(context).textTheme.bodyMedium!.fontFamily,
        color: color ?? Theme.of(context).textTheme.bodySmall!.color!,
        fontSize: smallText,
        fontWeight: bold! ? semiBoldWeight : regularWeight,
        decoration: decoration ?? TextDecoration.none,
        height: height ?? textHeight);
  }

  Widget seeAllTrailing(BuildContext context,
      {Function? onTap, required String onSeeAllButtonText}) {
    return InkWell(
      onTap: () {
        if (onTap != null) {
          onTap();
        }
      },
      child: small(context, onSeeAllButtonText,
          color: Theme.of(context).textTheme.displayMedium!.color),
    );
  }

  Widget itemHeader(BuildContext context, String text,
      {Function? onTap, String? onAccessoryButtonText, bool loading = false}) {
    return Container(
      padding: EdgeInsets.only(top: 2 * DUI.spacing.lateralPaddingValue),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: title3(context, text,
                color: Theme.of(context).textTheme.titleLarge!.color),
          ),
          onAccessoryButtonText == null
              ? SizedBox.shrink()
              : DUI.button.smallButton(context, onAccessoryButtonText, onTap,
                  loading: loading)
        ],
      ),
    );
  }

  Widget smallItemHeader(BuildContext context, String text) {
    return Container(
      padding: EdgeInsets.only(
          top: 2 * DUI.spacing.lateralPaddingValue,
          left: DUI.spacing.lateralPaddingValue,
          right: DUI.spacing.lateralPaddingValue),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          small(context, text, bold: true),
        ],
      ),
    );
  }
}
