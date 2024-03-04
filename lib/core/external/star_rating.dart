import 'package:flutter/material.dart';

import '../../dui.dart';

class CustomStarRating extends StatelessWidget {
  final double? rating;
  final int? length;
  final Widget? customStarIcon;
  final Widget? customEmptyStarIcon;
  final Widget? customHalfStarIcon;
  final Color? color;
  final double? iconSize;
  final Function(double rating)? onChange;
  final double? spacing;
  final bool allowHalfRating;
  const CustomStarRating(
      {Key? key,
      this.length,
      this.customEmptyStarIcon,
      this.customHalfStarIcon,
      this.customStarIcon,
      this.rating,
      this.color,
      this.iconSize,
      this.onChange,
      this.spacing,
      this.allowHalfRating = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: iconSize ?? 24,
      child: ListView.separated(
          shrinkWrap: true,
          padding: EdgeInsets.zero,
          physics: NeverScrollableScrollPhysics(),
          scrollDirection: Axis.horizontal,
          separatorBuilder: (BuildContext context, int index) {
            return SizedBox(
              width: spacing ?? DUI.spacing.lateralPaddingValue,
            );
          },
          itemCount: length ?? 5,
          itemBuilder: (BuildContext context, int index) {
            var indexAsRating = index + 1;
            if (rating == null) {
              return _getEmptyStarIcon(context, indexAsRating);
            }
            if (rating! < indexAsRating &&
                rating! > indexAsRating - 1 &&
                allowHalfRating) {
              return _getHalfStarIcon(context, indexAsRating);
            }
            if (rating! >= indexAsRating) {
              return _getFillStarIcon(context, indexAsRating);
            }
            return _getEmptyStarIcon(context, indexAsRating);
          }),
    );
  }

  Widget _getFillStarIcon(BuildContext context, int rating) {
    Widget icon = Icon(
      Icons.star,
      color: color ?? Theme.of(context).colorScheme.primary,
      size: iconSize ?? 24,
    );
    if (customStarIcon != null) {
      icon = customStarIcon!;
    }
    return GestureDetector(
      onTap: () {
        if (onChange != null) {
          onChange!(rating.toDouble());
        }
      },
      child: icon,
    );
  }

  Widget _getEmptyStarIcon(BuildContext context, int rating) {
    Widget icon = Icon(
      Icons.star_border,
      color: color ?? Theme.of(context).colorScheme.primary,
      size: iconSize ?? 24,
    );
    if (customEmptyStarIcon != null) {
      icon = customEmptyStarIcon!;
    }
    return GestureDetector(
      onTap: () {
        if (onChange != null) {
          onChange!(rating.toDouble());
        }
      },
      child: icon,
    );
  }

  Widget _getHalfStarIcon(BuildContext context, int rating) {
    Widget icon = Icon(
      Icons.star_half,
      color: color ?? Theme.of(context).colorScheme.primary,
      size: iconSize ?? 24,
    );
    if (customHalfStarIcon != null) {
      icon = customHalfStarIcon!;
    }
    return GestureDetector(
      onTap: () {
        if (onChange != null) {
          onChange!(rating.toDouble());
        }
      },
      child: icon,
    );
  }
}
