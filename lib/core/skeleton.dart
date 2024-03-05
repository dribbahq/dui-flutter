import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../dui.dart';

class DUISkeleton {
  Widget emptyRegularTileList(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Expanded(
            child: Shimmer.fromColors(
              baseColor: Theme.of(context).brightness == Brightness.light
                  ? DUI.color.loadingLightPrimary!
                  : DUI.color.loadingDarkPrimary,
              highlightColor: Theme.of(context).brightness == Brightness.light
                  ? DUI.color.loadingLightSecondary!
                  : DUI.color.loadingDarkSecondary,
              enabled: true,
              child: ListView.builder(
                padding: EdgeInsets.zero,
                itemBuilder: (_, __) => Padding(
                  padding: const EdgeInsets.only(bottom: 6.0),
                  child: Container(
                    decoration: BoxDecoration(
                        color: DUI.color.white,
                        borderRadius: BorderRadius.all(
                            Radius.circular(DUI.spacing.borderRadius))),
                    width: MediaQuery.of(context).size.width,
                    height: 54,
                  ),
                ),
                itemCount: 6,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget emptySimpleContainer(double height, double width, BuildContext context) {
    return Shimmer.fromColors(
        baseColor: Theme.of(context).brightness == Brightness.light
            ? DUI.color.loadingLightPrimary!
            : DUI.color.loadingDarkPrimary,
        highlightColor: Theme.of(context).brightness == Brightness.light
            ? DUI.color.loadingLightSecondary!
            : DUI.color.loadingDarkSecondary,
        enabled: true,
        child: Padding(
          padding: const EdgeInsets.only(bottom: 6.0),
          child: Container(
            decoration: BoxDecoration(
                color: DUI.color.white, borderRadius: BorderRadius.all(Radius.circular(DUI.spacing.borderRadius))),
            width: width,
            height: height,
          ),
        ));
  }

}
