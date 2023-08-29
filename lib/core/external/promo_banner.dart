import 'package:cached_network_image/cached_network_image.dart';
import 'package:dalai/common_utils/color_extension.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../dalai.dart';

class CustomCXBanner extends StatelessWidget {
  final String title;
  final String? message;
  final String? imageURL;
  final Color? mainColor;
  final Function? onTap;

  const CustomCXBanner({Key? key,
    required this.title,
    this.message,
    this.imageURL,
    this.mainColor,
    required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap!();
      },
      child: Container(
        constraints: BoxConstraints(maxWidth: 320, maxHeight: 160),
        width: 320,
        decoration: BoxDecoration(
            borderRadius:
            BorderRadius.circular(Dalai.spacing.lateralPaddingValue)),
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: Stack(
          children: [
            Row(
              children: [
                Expanded(child: Container()),
                Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                          color: Dalai.color.cream,
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: CachedNetworkImageProvider(
                                imageURL ?? '',
                              ))),
                    ))
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Dalai.spacing.spacer(),
                Expanded(
                  flex: 2,
                  child: ClipPath(
                    clipper: CurvedBannerClipper(),
                    child: Container(
                      color: mainColor ?? Dalai.color.primary,
                      padding: EdgeInsets.only(
                          right: Dalai.spacing.lateralPaddingValue),
                      child: Padding(
                        padding:
                        EdgeInsets.all(Dalai.spacing.lateralPaddingValue),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Spacer(),
                            Dalai.text.title1(context, title,
                              maxLines: 2, color: (mainColor ?? Dalai.color.primary).calculateLuminance()),
                            Dalai.spacing.spacer(small: true),
                            Dalai.text.regular(context, message,
                              bold: true,
                              color: (mainColor ?? Dalai.color.primary).calculateLuminance().withOpacity(0.75),
                            ),
                            Spacer()
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Dalai.spacing.spacer(),
                Expanded(child: Container())
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class CurvedBannerClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(size.width * .8, 0);
    path.quadraticBezierTo(
        size.width, size.height * .5, size.width * .8, size.height);
    path.lineTo(0, size.height);
    path.lineTo(0, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
