import 'package:cityxerpa_icons/cityxerpa_symbols.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import 'clippers.dart';
import '../dalai.dart';

class DalaiSkeleton {
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
                  ? Dalai.color.loadingLightPrimary!
                  : Dalai.color.loadingDarkPrimary,
              highlightColor: Theme.of(context).brightness == Brightness.light
                  ? Dalai.color.loadingLightSecondary!
                  : Dalai.color.loadingDarkSecondary,
              enabled: true,
              child: ListView.builder(
                padding: EdgeInsets.zero,
                itemBuilder: (_, __) => Padding(
                  padding: const EdgeInsets.only(bottom: 6.0),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Dalai.color.white,
                        borderRadius: BorderRadius.all(
                            Radius.circular(Dalai.spacing.borderRadius))),
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

  Widget superMarketProductsBlock(double height, BuildContext context) {
    return Container(
        height: 680,
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 0.0, vertical: 0.0),
        child: Shimmer.fromColors(
            baseColor: Theme.of(context).brightness == Brightness.light
                ? Dalai.color.loadingLightPrimary!
                : Dalai.color.loadingDarkPrimary,
            highlightColor: Theme.of(context).brightness == Brightness.light
                ? Dalai.color.loadingLightSecondary!
                : Dalai.color.loadingDarkSecondary,
            enabled: true,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Dalai.spacing.spacer(multiplier: 2),
                Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: Dalai.spacing.lateralPaddingValue),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 24,
                          width: 200,
                          decoration: BoxDecoration(
                              color: Dalai.color.white,
                              borderRadius: BorderRadius.all(
                                  Radius.circular(Dalai.spacing.borderRadius))),
                        ),
                        Dalai.spacing.spacer(small: true),
                        Container(
                          height: 20,
                          width: 180,
                          decoration: BoxDecoration(
                              color: Dalai.color.white,
                              borderRadius: BorderRadius.all(
                                  Radius.circular(Dalai.spacing.borderRadius))),
                        ),
                      ],
                    )),
                Dalai.spacing.spacer(),
                Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                          left: Dalai.spacing.lateralPaddingValue,
                          right: 6,
                          bottom: Dalai.spacing.lateralPaddingValue / 2,
                          top: Dalai.spacing.lateralPaddingValue / 2),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Dalai.color.white,
                            borderRadius: BorderRadius.all(
                                Radius.circular(Dalai.spacing.borderRadius))),
                        width: (MediaQuery.of(context).size.width - 48) / 3,
                        height: (MediaQuery.of(context).size.width - 48) / 3,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          left: Dalai.spacing.lateralPaddingValue / 2,
                          right: 6,
                          bottom: Dalai.spacing.lateralPaddingValue / 2,
                          top: Dalai.spacing.lateralPaddingValue / 2),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Dalai.color.white,
                            borderRadius: BorderRadius.all(
                                Radius.circular(Dalai.spacing.borderRadius))),
                        width: (MediaQuery.of(context).size.width - 48) / 3,
                        height: (MediaQuery.of(context).size.width - 48) / 3,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          left: Dalai.spacing.lateralPaddingValue / 2,
                          right: 6,
                          bottom: Dalai.spacing.lateralPaddingValue / 2,
                          top: Dalai.spacing.lateralPaddingValue / 2),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Dalai.color.white,
                            borderRadius: BorderRadius.all(
                                Radius.circular(Dalai.spacing.borderRadius))),
                        width: (MediaQuery.of(context).size.width - 48) / 3,
                        height: (MediaQuery.of(context).size.width - 48) / 3,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                          left: Dalai.spacing.lateralPaddingValue,
                          right: 6,
                          bottom: Dalai.spacing.lateralPaddingValue / 2,
                          top: Dalai.spacing.lateralPaddingValue / 2),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Dalai.color.white,
                            borderRadius: BorderRadius.all(
                                Radius.circular(Dalai.spacing.borderRadius))),
                        width: (MediaQuery.of(context).size.width - 48) / 3,
                        height: (MediaQuery.of(context).size.width - 48) / 3,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          left: Dalai.spacing.lateralPaddingValue / 2,
                          right: 6,
                          bottom: Dalai.spacing.lateralPaddingValue / 2,
                          top: Dalai.spacing.lateralPaddingValue / 2),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Dalai.color.white,
                            borderRadius: BorderRadius.all(
                                Radius.circular(Dalai.spacing.borderRadius))),
                        width: (MediaQuery.of(context).size.width - 48) / 3,
                        height: (MediaQuery.of(context).size.width - 48) / 3,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          left: Dalai.spacing.lateralPaddingValue / 2,
                          right: 6,
                          bottom: Dalai.spacing.lateralPaddingValue / 2,
                          top: Dalai.spacing.lateralPaddingValue / 2),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Dalai.color.white,
                            borderRadius: BorderRadius.all(
                                Radius.circular(Dalai.spacing.borderRadius))),
                        width: (MediaQuery.of(context).size.width - 48) / 3,
                        height: (MediaQuery.of(context).size.width - 48) / 3,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                          left: Dalai.spacing.lateralPaddingValue,
                          right: 6,
                          bottom: Dalai.spacing.lateralPaddingValue / 2,
                          top: Dalai.spacing.lateralPaddingValue / 2),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Dalai.color.white,
                            borderRadius: BorderRadius.all(
                                Radius.circular(Dalai.spacing.borderRadius))),
                        width: (MediaQuery.of(context).size.width - 48) / 3,
                        height: (MediaQuery.of(context).size.width - 48) / 3,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          left: Dalai.spacing.lateralPaddingValue / 2,
                          right: 6,
                          bottom: Dalai.spacing.lateralPaddingValue / 2,
                          top: Dalai.spacing.lateralPaddingValue / 2),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Dalai.color.white,
                            borderRadius: BorderRadius.all(
                                Radius.circular(Dalai.spacing.borderRadius))),
                        width: (MediaQuery.of(context).size.width - 48) / 3,
                        height: (MediaQuery.of(context).size.width - 48) / 3,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          left: Dalai.spacing.lateralPaddingValue / 2,
                          right: 6,
                          bottom: Dalai.spacing.lateralPaddingValue / 2,
                          top: Dalai.spacing.lateralPaddingValue / 2),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Dalai.color.white,
                            borderRadius: BorderRadius.all(
                                Radius.circular(Dalai.spacing.borderRadius))),
                        width: (MediaQuery.of(context).size.width - 48) / 3,
                        height: (MediaQuery.of(context).size.width - 48) / 3,
                      ),
                    ),
                  ],
                ),
              ],
            )));
  }

  Widget emptyBusinessContainer(double height, BuildContext context) {
    return Shimmer.fromColors(
        baseColor: Theme.of(context).brightness == Brightness.light
            ? Dalai.color.loadingLightPrimary!
            : Dalai.color.loadingDarkPrimary,
        highlightColor: Theme.of(context).brightness == Brightness.light
            ? Dalai.color.loadingLightSecondary!
            : Dalai.color.loadingDarkSecondary,
        enabled: true,
        child: Padding(
          padding: const EdgeInsets.only(bottom: 6.0),
          child: Container(
            decoration: BoxDecoration(
                color: Dalai.color.white,
                borderRadius: BorderRadius.all(
                    Radius.circular(Dalai.spacing.borderRadius))),
            width: MediaQuery.of(context).size.width,
            height: height,
          ),
        ));
  }

  Widget emptySimpleContainer(
      double height, double width, BuildContext context) {
    return Shimmer.fromColors(
        baseColor: Theme.of(context).brightness == Brightness.light
            ? Dalai.color.loadingLightPrimary!
            : Dalai.color.loadingDarkPrimary,
        highlightColor: Theme.of(context).brightness == Brightness.light
            ? Dalai.color.loadingLightSecondary!
            : Dalai.color.loadingDarkSecondary,
        enabled: true,
        child: Padding(
          padding: const EdgeInsets.only(bottom: 6.0),
          child: Container(
            decoration: BoxDecoration(
                color: Dalai.color.white,
                borderRadius: BorderRadius.all(
                    Radius.circular(Dalai.spacing.borderRadius))),
            width: width,
            height: height,
          ),
        ));
  }

  Widget emptyLoadingExperience(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: MediaQuery.of(context).size.height,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Expanded(
            child: Shimmer.fromColors(
                baseColor: Theme.of(context).brightness == Brightness.light
                    ? Dalai.color.loadingLightPrimary!
                    : Dalai.color.loadingDarkPrimary,
                highlightColor: Theme.of(context).brightness == Brightness.light
                    ? Dalai.color.loadingLightSecondary!
                    : Dalai.color.loadingDarkSecondary,
                enabled: true,
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Dalai.color.white,
                      ),
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.4,
                    ),
                    Padding(
                      padding: Dalai.spacing.lateralPadding,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Dalai.spacing.spacer(multiplier: 2),
                          Container(
                            height: 20,
                            width: 220,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6),
                              color: Colors.red,
                            ),
                          ),
                          Dalai.spacing.spacer(multiplier: 1),
                          Container(
                            height: 16,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6),
                              color: Colors.red,
                            ),
                          ),
                          Dalai.spacing.spacer(small: true),
                          Container(
                            height: 16,
                            width: 100,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6),
                              color: Colors.red,
                            ),
                          ),
                          Dalai.spacing.spacer(multiplier: 2),
                        ],
                      ),
                    ),
                    const Spacer(),
                    SafeArea(
                        child: Padding(
                      padding: EdgeInsets.all(
                          Dalai.spacing.largeLateralPaddingValue),
                      child: Row(
                        children: [
                          const Spacer(),
                          Container(
                            height: 56,
                            width: 160,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                  Dalai.spacing.borderRadius),
                              color: Colors.red,
                            ),
                          ),
                        ],
                      ),
                    ))
                  ],
                )),
          ),
        ],
      ),
    );
  }

  Widget emptyExperienceItem(double height, BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: height,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Expanded(
            child: Shimmer.fromColors(
              baseColor: Theme.of(context).brightness == Brightness.light
                  ? Dalai.color.loadingLightPrimary!
                  : Dalai.color.loadingDarkPrimary,
              highlightColor: Theme.of(context).brightness == Brightness.light
                  ? Dalai.color.loadingLightSecondary!
                  : Dalai.color.loadingDarkSecondary,
              enabled: true,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                          color: Dalai.color.white,
                          borderRadius: BorderRadius.all(
                              Radius.circular(Dalai.spacing.borderRadius))),
                      width: MediaQuery.of(context).size.width,
                    ),
                  ),
                  Dalai.spacing.spacer(),
                  Container(
                    decoration: BoxDecoration(
                        color: Dalai.color.white,
                        borderRadius: BorderRadius.all(
                            Radius.circular(Dalai.spacing.borderRadius))),
                    width: MediaQuery.of(context).size.width * 0.34,
                    height: 16,
                  ),
                  Dalai.spacing.spacer(multiplier: 2)
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget emptyLoadingBusiness(double height, BuildContext context,
      {bool? skipPadding = false}) {
    return Container(
      width: double.infinity,
      height: height,
      padding: skipPadding! ? EdgeInsets.zero : Dalai.spacing.lateralPadding,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Expanded(
            child: Shimmer.fromColors(
              baseColor: Theme.of(context).brightness == Brightness.light
                  ? Dalai.color.loadingLightPrimary!
                  : Dalai.color.loadingDarkPrimary,
              highlightColor: Theme.of(context).brightness == Brightness.light
                  ? Dalai.color.loadingLightSecondary!
                  : Dalai.color.loadingDarkSecondary,
              enabled: true,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                          color: Dalai.color.white,
                          borderRadius: BorderRadius.all(
                              Radius.circular(Dalai.spacing.borderRadius))),
                      width: MediaQuery.of(context).size.width,
                    ),
                  ),
                  Dalai.spacing.spacer(),
                  Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Container(
                          height: 20,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6),
                            color: Colors.red,
                          ),
                        ),
                      ),
                      Expanded(flex: 1, child: Container())
                    ],
                  ),
                  Dalai.spacing.spacer(small: true),
                  Row(
                    children: [
                      Expanded(
                        flex: 3,
                        child: Container(
                          height: 20,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6),
                            color: Colors.red,
                          ),
                        ),
                      ),
                      Expanded(flex: 1, child: Container())
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget emptyLoadingContainer(double height, BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: height,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Expanded(
            child: Shimmer.fromColors(
              baseColor: Theme.of(context).brightness == Brightness.light
                  ? Dalai.color.loadingLightPrimary!
                  : Dalai.color.loadingDarkPrimary,
              highlightColor: Theme.of(context).brightness == Brightness.light
                  ? Dalai.color.loadingLightSecondary!
                  : Dalai.color.loadingDarkSecondary,
              enabled: true,
              child: Container(
                decoration: BoxDecoration(
                    color: Dalai.color.white,
                    borderRadius: BorderRadius.all(
                        Radius.circular(Dalai.spacing.borderRadius))),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget emptyLoadingCircle(double height, BuildContext context) {
    return SizedBox(
      width: height,
      height: height,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Expanded(
            child: Shimmer.fromColors(
              baseColor: Theme.of(context).brightness == Brightness.light
                  ? Dalai.color.loadingLightPrimary!
                  : Dalai.color.loadingDarkPrimary,
              highlightColor: Theme.of(context).brightness == Brightness.light
                  ? Dalai.color.loadingLightSecondary!
                  : Dalai.color.loadingDarkSecondary,
              enabled: true,
              child: Container(
                decoration: BoxDecoration(
                    color: Dalai.color.white,
                    shape: BoxShape.circle),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget emptySearchLoadingContainer(double height, BuildContext context) {
    return Container(
      width: double.infinity,
      height: 960,
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Expanded(
            child: Shimmer.fromColors(
              baseColor: Theme.of(context).brightness == Brightness.light
                  ? Dalai.color.loadingLightPrimary!
                  : Dalai.color.loadingDarkPrimary,
              highlightColor: Theme.of(context).brightness == Brightness.light
                  ? Dalai.color.loadingLightSecondary!
                  : Dalai.color.loadingDarkSecondary,
              enabled: true,
              child: ListView.builder(
                shrinkWrap: false,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (_, __) => Padding(
                  padding: const EdgeInsets.only(bottom: 6.0),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Dalai.color.white,
                        borderRadius: BorderRadius.all(
                            Radius.circular(Dalai.spacing.borderRadius))),
                    width: MediaQuery.of(context).size.width,
                    height: height,
                  ),
                ),
                itemCount: 4,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget emptySearchHeader(double height, BuildContext context) {
    return Container(
      width: double.infinity,
      height: 200,
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Expanded(
            child: Shimmer.fromColors(
              baseColor: Theme.of(context).brightness == Brightness.light
                  ? Dalai.color.loadingLightPrimary!
                  : Dalai.color.loadingDarkPrimary,
              highlightColor: Theme.of(context).brightness == Brightness.light
                  ? Dalai.color.loadingLightSecondary!
                  : Dalai.color.loadingDarkSecondary,
              enabled: true,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemBuilder: (_, int index) => Padding(
                  padding: EdgeInsets.only(
                      right: index == 3 ? 12 : 6.0,
                      left: index == 0 ? 12 : 6.0),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Dalai.color.white,
                        borderRadius: BorderRadius.all(
                            Radius.circular(Dalai.spacing.borderRadius))),
                    width: MediaQuery.of(context).size.width / 2.2,
                    height: MediaQuery.of(context).size.width / 2.2,
                  ),
                ),
                itemCount: 4,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget emptyLoadingRegularContainer(BuildContext context) {
    return Container(
        height: 450,
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 0.0, vertical: 0.0),
        child: Shimmer.fromColors(
            baseColor: Theme.of(context).brightness == Brightness.light
                ? Dalai.color.loadingLightPrimary!
                : Dalai.color.loadingDarkPrimary,
            highlightColor: Theme.of(context).brightness == Brightness.light
                ? Dalai.color.loadingLightSecondary!
                : Dalai.color.loadingDarkSecondary,
            enabled: true,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      left: Dalai.spacing.lateralPaddingValue,
                      right: Dalai.spacing.lateralPaddingValue,
                      bottom: Dalai.spacing.lateralPaddingValue,
                      top: 20),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Dalai.color.white,
                        borderRadius: BorderRadius.all(
                            Radius.circular(Dalai.spacing.borderRadius))),
                    width: 120,
                    height: 30,
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.only(bottom: 6),
                    child: Container(
                      decoration: BoxDecoration(color: Dalai.color.white),
                      width: MediaQuery.of(context).size.width,
                      height: 90,
                    )),
                Padding(
                    padding: const EdgeInsets.only(bottom: 6),
                    child: Container(
                      decoration: BoxDecoration(color: Dalai.color.white),
                      width: MediaQuery.of(context).size.width,
                      height: 90,
                    )),
                Padding(
                    padding: const EdgeInsets.only(bottom: 6),
                    child: Container(
                      decoration: BoxDecoration(color: Dalai.color.white),
                      width: MediaQuery.of(context).size.width,
                      height: 90,
                    )),
                Padding(
                    padding: const EdgeInsets.only(bottom: 6),
                    child: Container(
                      decoration: BoxDecoration(color: Dalai.color.white),
                      width: MediaQuery.of(context).size.width,
                      height: 90,
                    )),
              ],
            )));
  }

  Widget emptyLoadingEcommerceContainer(BuildContext context) {
    return Container(
        height: 956,
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 0.0, vertical: 0.0),
        child: Shimmer.fromColors(
            baseColor: Theme.of(context).brightness == Brightness.light
                ? Dalai.color.loadingLightPrimary!
                : Dalai.color.loadingDarkPrimary,
            highlightColor: Theme.of(context).brightness == Brightness.light
                ? Dalai.color.loadingLightSecondary!
                : Dalai.color.loadingDarkSecondary,
            enabled: true,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                          left: Dalai.spacing.lateralPaddingValue,
                          right: Dalai.spacing.lateralPaddingValue,
                          bottom: 0,
                          top: 20),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Dalai.color.white,
                            borderRadius: BorderRadius.all(
                                Radius.circular(Dalai.spacing.borderRadius))),
                        width: 160,
                        height: 30,
                      ),
                    ),
                    Expanded(
                      child: Container(),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          left: Dalai.spacing.lateralPaddingValue,
                          right: Dalai.spacing.lateralPaddingValue,
                          bottom: 0,
                          top: 20),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Dalai.color.white,
                            borderRadius: BorderRadius.all(
                                Radius.circular(Dalai.spacing.borderRadius))),
                        width: 50,
                        height: 30,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                          left: Dalai.spacing.lateralPaddingValue,
                          right: 6,
                          bottom: Dalai.spacing.lateralPaddingValue,
                          top: Dalai.spacing.lateralPaddingValue),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Dalai.color.white,
                            borderRadius: BorderRadius.all(
                                Radius.circular(Dalai.spacing.borderRadius))),
                        width: (MediaQuery.of(context).size.width - 36) / 2,
                        height: (MediaQuery.of(context).size.width - 36) / 2,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          left: 6,
                          right: Dalai.spacing.lateralPaddingValue,
                          bottom: Dalai.spacing.lateralPaddingValue,
                          top: Dalai.spacing.lateralPaddingValue),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Dalai.color.white,
                            borderRadius: BorderRadius.all(
                                Radius.circular(Dalai.spacing.borderRadius))),
                        width: (MediaQuery.of(context).size.width - 36) / 2,
                        height: (MediaQuery.of(context).size.width - 36) / 2,
                      ),
                    )
                  ],
                ),
                Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                          left: Dalai.spacing.lateralPaddingValue,
                          right: 6,
                          bottom: 6,
                          top: 0),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Dalai.color.white,
                            borderRadius: BorderRadius.all(
                                Radius.circular(Dalai.spacing.borderRadius))),
                        width: (MediaQuery.of(context).size.width - 36) / 2,
                        height: (MediaQuery.of(context).size.width - 36) / 2,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          left: 6,
                          right: Dalai.spacing.lateralPaddingValue,
                          bottom: Dalai.spacing.lateralPaddingValue,
                          top: 0),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Dalai.color.white,
                            borderRadius: BorderRadius.all(
                                Radius.circular(Dalai.spacing.borderRadius))),
                        width: (MediaQuery.of(context).size.width - 36) / 2,
                        height: (MediaQuery.of(context).size.width - 36) / 2,
                      ),
                    )
                  ],
                ),
                Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                          left: Dalai.spacing.lateralPaddingValue,
                          right: Dalai.spacing.lateralPaddingValue,
                          bottom: 0,
                          top: 20),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Dalai.color.white,
                            borderRadius: BorderRadius.all(
                                Radius.circular(Dalai.spacing.borderRadius))),
                        width: 160,
                        height: 30,
                      ),
                    ),
                    Expanded(
                      child: Container(),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          left: Dalai.spacing.lateralPaddingValue,
                          right: Dalai.spacing.lateralPaddingValue,
                          bottom: 0,
                          top: 20),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Dalai.color.white,
                            borderRadius: BorderRadius.all(
                                Radius.circular(Dalai.spacing.borderRadius))),
                        width: 50,
                        height: 30,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                          left: Dalai.spacing.lateralPaddingValue,
                          right: 6,
                          bottom: Dalai.spacing.lateralPaddingValue,
                          top: Dalai.spacing.lateralPaddingValue),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Dalai.color.white,
                            borderRadius: BorderRadius.all(
                                Radius.circular(Dalai.spacing.borderRadius))),
                        width: (MediaQuery.of(context).size.width - 36) / 2,
                        height: (MediaQuery.of(context).size.width - 36) / 2,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          left: 6,
                          right: Dalai.spacing.lateralPaddingValue,
                          bottom: Dalai.spacing.lateralPaddingValue,
                          top: Dalai.spacing.lateralPaddingValue),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Dalai.color.white,
                            borderRadius: BorderRadius.all(
                                Radius.circular(Dalai.spacing.borderRadius))),
                        width: (MediaQuery.of(context).size.width - 36) / 2,
                        height: (MediaQuery.of(context).size.width - 36) / 2,
                      ),
                    )
                  ],
                ),
                Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                          left: Dalai.spacing.lateralPaddingValue,
                          right: 6,
                          bottom: 6,
                          top: 0),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Dalai.color.white,
                            borderRadius: BorderRadius.all(
                                Radius.circular(Dalai.spacing.borderRadius))),
                        width: (MediaQuery.of(context).size.width - 36) / 2,
                        height: (MediaQuery.of(context).size.width - 36) / 2,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          left: 6,
                          right: Dalai.spacing.lateralPaddingValue,
                          bottom: Dalai.spacing.lateralPaddingValue,
                          top: 0),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Dalai.color.white,
                            borderRadius: BorderRadius.all(
                                Radius.circular(Dalai.spacing.borderRadius))),
                        width: (MediaQuery.of(context).size.width - 36) / 2,
                        height: (MediaQuery.of(context).size.width - 36) / 2,
                      ),
                    )
                  ],
                ),
              ],
            )));
  }

  Widget emptyHomeContainer(BuildContext context) {
    return Container(
        height: 530,
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 0.0, vertical: 0.0),
        child: Stack(
          children: [
            ClipPath(
                clipper: HomeCurvedBottomClipper(),
                child: Container(
                  height: 500,
                  width: double.infinity,
                  color: Theme.of(context).colorScheme.background,
                )),
            Padding(
                padding:
                    EdgeInsets.only(top: Dalai.spacing.lateralPaddingValue),
                child: Shimmer.fromColors(
                  baseColor: Theme.of(context).brightness == Brightness.light
                      ? Dalai.color.loadingLightPrimary!
                      : Dalai.color.loadingDarkPrimary,
                  highlightColor:
                      Theme.of(context).brightness == Brightness.light
                          ? Dalai.color.loadingLightSecondary!
                          : Dalai.color.loadingDarkSecondary,
                  enabled: true,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: Dalai.spacing.lateralPadding / 2,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Card(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                      Dalai.spacing.borderRadius)),
                              clipBehavior: Clip.antiAliasWithSaveLayer,
                              elevation: 0,
                              child: Container(
                                height:
                                    MediaQuery.of(context).size.width / 2.1 -
                                        Dalai.spacing.lateralPaddingValue / 2,
                                width: MediaQuery.of(context).size.width / 2.1 -
                                    Dalai.spacing.lateralPaddingValue / 2,
                                color: Dalai.color.white,
                              ),
                            ),
                            Card(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                      Dalai.spacing.borderRadius)),
                              clipBehavior: Clip.antiAliasWithSaveLayer,
                              elevation: 0,
                              child: Container(
                                height:
                                    MediaQuery.of(context).size.width / 2.1 -
                                        Dalai.spacing.lateralPaddingValue / 2,
                                width: MediaQuery.of(context).size.width / 2.1 -
                                    Dalai.spacing.lateralPaddingValue / 2,
                                color: Dalai.color.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: Dalai.spacing.lateralPadding / 2,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Card(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                      Dalai.spacing.borderRadius)),
                              clipBehavior: Clip.antiAliasWithSaveLayer,
                              elevation: 0,
                              child: Container(
                                height:
                                    (MediaQuery.of(context).size.width / 3) -
                                        12,
                                width: (MediaQuery.of(context).size.width / 3) -
                                    12,
                                color: Dalai.color.white,
                              ),
                            ),
                            Card(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                      Dalai.spacing.borderRadius)),
                              clipBehavior: Clip.antiAliasWithSaveLayer,
                              elevation: 0,
                              child: Container(
                                height:
                                    (MediaQuery.of(context).size.width / 3) -
                                        12,
                                width: (MediaQuery.of(context).size.width / 3) -
                                    12,
                                color: Dalai.color.white,
                              ),
                            ),
                            Card(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                      Dalai.spacing.borderRadius)),
                              clipBehavior: Clip.antiAliasWithSaveLayer,
                              elevation: 0,
                              child: Container(
                                height:
                                    (MediaQuery.of(context).size.width / 3) -
                                        12,
                                width: (MediaQuery.of(context).size.width / 3) -
                                    12,
                                color: Dalai.color.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: Dalai.spacing.lateralPadding / 2,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Card(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                      Dalai.spacing.borderRadius)),
                              clipBehavior: Clip.antiAliasWithSaveLayer,
                              elevation: 0,
                              child: Container(
                                height:
                                    (MediaQuery.of(context).size.width / 3) -
                                        12,
                                width: (MediaQuery.of(context).size.width / 3) -
                                    12,
                                color: Dalai.color.white,
                              ),
                            ),
                            Card(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                      Dalai.spacing.borderRadius)),
                              clipBehavior: Clip.antiAliasWithSaveLayer,
                              elevation: 0,
                              child: Container(
                                height:
                                    (MediaQuery.of(context).size.width / 3) -
                                        12,
                                width: (MediaQuery.of(context).size.width / 3) -
                                    12,
                                color: Dalai.color.white,
                              ),
                            ),
                            Card(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                      Dalai.spacing.borderRadius)),
                              clipBehavior: Clip.antiAliasWithSaveLayer,
                              elevation: 0,
                              child: Container(
                                height:
                                    (MediaQuery.of(context).size.width / 3) -
                                        12,
                                width: (MediaQuery.of(context).size.width / 3) -
                                    12,
                                color: Dalai.color.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ))
          ],
        ));
  }

  Widget emptyLoadingBusinessTile(BuildContext context){
    return Padding(
      padding: EdgeInsets.all(Dalai.spacing.lateralPaddingValue),
      child: Shimmer.fromColors(
        baseColor: Theme.of(context).brightness == Brightness.light
            ? Dalai.color.loadingLightPrimary!
            : Dalai.color.loadingDarkPrimary,
        highlightColor: Theme.of(context).brightness == Brightness.light
            ? Dalai.color.loadingLightSecondary!
            : Dalai.color.loadingDarkSecondary,
        enabled: true,
        child: Row(
          children: [
            Expanded(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(Dalai.spacing.lateralPaddingValue),
                        color: Colors.red,
                      ),
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                    ),
                    Dalai.spacing.hSpacer(),
                    Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: 100,
                              height: Dalai.text.regularText,
                              color: Colors.red,
                            ),
                            Dalai.spacing.spacer(small: true),
                            Container(
                              width: 150,
                              height: Dalai.text.smallText,
                              color: Colors.red,
                            ),
                            Dalai.spacing.spacer(small: true),
                            Wrap(
                              spacing: 2,
                              direction: Axis.horizontal,
                              children: List.generate(5, (index) {
                                return Dalai.icon.dalaiIcons(context, CXIcon.star_fill, size: CXIconSize.small, mainColor: Theme.of(context).colorScheme.primary);
                              }),
                            )
                          ],
                        )),
                  ],
                )),
            Dalai.spacing.hSpacer(),
            Dalai.icon.dalaiIcons(context, CXIcon.chevron_right, size: CXIconSize.x_small)
          ],
        ),
      ),
    );
  }
}
