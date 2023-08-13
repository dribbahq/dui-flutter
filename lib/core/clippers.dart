import 'package:flutter/material.dart';

class HomeCurvedBottomClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    //topLine (xPointTo, yPointTo)
    path.lineTo(size.width, 0);

    //rightLine (xPointTo, yPointTo)
    path.lineTo(size.width, size.height * .5);

    //bottomLineCurved (xCurvePoint, yCurvePoint, xPointTo, yPointTo)
    path.quadraticBezierTo(size.width *.5, size.height, 0, size.height * .5);

    //leftLine (xPointTo, yPointTo)
    path.lineTo(0, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}

class CurvedTopClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    /*final roundingHeight = size.height * 2 / 40;
    final filledRectangle =
    Rect.fromLTRB(0, 0, size.width, size.height - roundingHeight);
    final roundingRectangle = Rect.fromLTRB(
        -5, size.height - roundingHeight * 2, size.width + 5, size.height);

    final path = Path();
    path.addRect(filledRectangle);
    path.arcTo(roundingRectangle, pi, -pi, true);
    path.close();

    return path;*/

    final path = Path();
    //topLineCurved (xCurvePoint, yCurvePoint, xPointTo, yPointTo)
    path.quadraticBezierTo(size.width * .5, 80, size.width, 0);

    //rightLine (xPointTo, yPointTo)
    path.lineTo(size.width, size.height);

    //topLine (xPointTo, yPointTo)
    path.lineTo(0, size.height);

    //leftLine (xPointTo, yPointTo)
    path.lineTo(0, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}

class CurvedBannerClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();

    //topLine (xPointTo, yPointTo)
    path.lineTo(size.width * .8, 0);

    //rightLineCurved (xCurve, yCurve, xPointTo, yPointTo)
    path.quadraticBezierTo(size.width, size.height * .5, size.width * .8, size.height);

    //bottomLine (xPointTo, yPointTo)
    path.lineTo(0, size.height);

    //leftLine (xPointTo, yPointTo)
    path.lineTo(0, 0);
    path.close();


    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}