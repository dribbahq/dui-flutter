import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';

class DUISpacing {
  /// Margins
  ///
  final double smallPaddingValue = 4;
  final double lateralPaddingValue = 12;
  final double largeLateralPaddingValue = 20;
  final EdgeInsets lateralPadding = const EdgeInsets.symmetric(horizontal: 12);

  final double homeCategoriesPadding = 12;

  /// Border Radius
  ///
  final double smallBorderRadius = 4.0;
  final double borderRadius = 12.0;
  final double largeBorderRadius = 24.0;

  /// Border Width
  ///
  final double borderWidth = 1.5;

  /// Widgets
  ///
  Widget spacer({int multiplier = 1, bool small = false}) {
    if (small) {
      return SizedBox(height: smallPaddingValue);
    }
    return SizedBox(
      height: lateralPaddingValue * multiplier,
    );
  }

  Widget hSpacer({int multiplier = 1, bool small = false}) {
    if (small) {
      return SizedBox(width: smallPaddingValue);
    }
    return SizedBox(
      width: lateralPaddingValue * multiplier,
    );
  }

  Widget divider(context) {
    return SizedBox(
      height: 0.5,
      child: Center(
        child: Container(
          padding: const EdgeInsets.all(0),
          margin: const EdgeInsetsDirectional.only(start: 0.0, end: 0.0),
          height: 0.5,
          color:
              Theme.of(context).textTheme.bodyMedium!.color!.withOpacity(0.2),
        ),
      ),
    );
  }

  Widget verticalDivider(BuildContext context, double? height) {
    return SizedBox(
      width: 0.5,
      height: height,
      child: Center(
        child: Container(
          color:
              Theme.of(context).textTheme.bodyMedium!.color!.withOpacity(0.2),
        ),
      ),
    );
  }

  Widget dottedDivider(context) {
    return Padding(
        padding: EdgeInsets.zero,
        child: DottedLine(
          direction: Axis.horizontal,
          lineLength: double.infinity,
          lineThickness: 1.0,
          dashLength: 1.0,
          dashColor:
              Theme.of(context).textTheme.bodyMedium!.color!.withOpacity(0.4),
          dashRadius: 10.0,
          dashGapLength: 4.0,
          dashGapColor: Colors.transparent,
          dashGapRadius: 10.0,
        ));
  }
}
