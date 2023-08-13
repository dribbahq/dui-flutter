import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../dalai.dart';

class DalaiCards{
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

  Widget cardTitle(context, text,
      {color, maxLines, align, double? fontSize}) {
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
            color:
            color ?? Theme.of(context).colorScheme.primary,
            decoration: decoration ?? TextDecoration.none,
            fontSize: Dalai.text.h2));
  }
}