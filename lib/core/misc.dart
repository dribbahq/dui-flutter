import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import '../common_utils/common_utils.dart';
import '../dui.dart';


class DUIMisc {
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
          fontFamily: Theme.of(context).textTheme.bodyMedium!.fontFamily,
          color: color ?? Theme.of(context).textTheme.bodyMedium!.color,
          fontSize: size ?? DUI.text.regularText,
          fontWeight: DUI.text.regularWeight,
        ),
        children: <TextSpan>[
          TextSpan(
            text: title,
            style: TextStyle(
              fontWeight: DUI.text.semiBoldWeight,
            ),
          ),
          TextSpan(
            text: text,
          )
        ],
      ),
    );
  }

  Widget loadingAnimation(BuildContext context,
      {double size = 24.0, bool light = false}) {
    return SizedBox(
        width: (2 * size * 0.88),
        height: (2 * size * 0.88),
        child: Center(
          child: LoadingAnimationWidget.discreteCircle(
            color: light ? DUI.color.white : DUI.color.primary,
            secondRingColor: light
                ? DUI.color.primaryContrast
                : DUI.color.primaryAlternativeDark,
            thirdRingColor: light
                ? DUI.color.primaryAlternativeDark
                : DUI.color.primaryAlternativeLight,
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
            DUI.spacing.spacer(small: true),
            title != null
                ? DUI.text.small(context, title, bold: true)
                : SizedBox.shrink(),
            subtitle != null
                ? DUI.spacing.spacer(small: true)
                : SizedBox.shrink(),
            subtitle != null
                ? DUI.text.title3(context, subtitle)
                : SizedBox.shrink(),
            DUI.spacing.spacer(multiplier: 1),
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
                              DUI.button.noBgButton(context, dismissText, () {
                            if (onDismissPressed != null) {
                              onDismissPressed();
                            }
                            Navigator.pop(context);
                          }),
                        ),
                      ),
                DUI.spacing.hSpacer(),
                buttonText == null
                    ? const SizedBox.shrink()
                    : Expanded(
                        flex: 2,
                        child: SizedBox(
                          width: double.infinity,
                          child: DUI.button.button(context, buttonText, () {
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
}
