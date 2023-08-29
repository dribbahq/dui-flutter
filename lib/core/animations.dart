import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../dalai.dart';

enum AnimationType {
  errorData,
  errorGeneric,
  errorMap,
  errorSearch,
  errorUpdate,
  errorWorking,
  trackingDelivering,
  trackingDropoff,
  trackingOngoingDelivery,
  trackingOngoingMarket,
  trackingOngoingSuper,
  trackingPickup,
  trackingQueued,
  paymentProcessing,
  orderCancelled,
  orderDelivered
}

class DalaiAnimations {
  Widget animation(BuildContext context, AnimationType type,
      {String? title,
        String? subtitle,
        String? disclaimer,
        String? buttonText,
        Function? onButtonTap,
        bool loading = false,
        double? size,
        BoxFit boxFit = BoxFit.contain,
        bool circled = false,
        Color? backgroundColor,
        double? animationPadding = 0}) {
    double computedSize = size ?? MediaQuery
        .of(context)
        .size
        .width * 0.6;

    return Container(
      padding: Dalai.spacing.lateralPadding,
      child: Column(
        children: [
          Container(
              clipBehavior: circled ? Clip.antiAliasWithSaveLayer : Clip.none,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50000),
                  color: circled
                      ? (backgroundColor ??
                      Theme
                          .of(context)
                          .colorScheme
                          .background)
                      : Colors.transparent),
              child: Lottie.asset(_extractAnimation(type), height: computedSize,
                  width: computedSize,
                  package: 'dalai',
                  fit: boxFit)),
          circled ? Dalai.spacing.spacer() : SizedBox(height: animationPadding),
          title == null
              ? SizedBox.shrink()
              : Dalai.text.title3(context, title, textAlign: TextAlign.center),
          subtitle == null
              ? SizedBox.shrink()
              : Dalai.spacing.spacer(small: true),
          subtitle == null
              ? SizedBox.shrink()
              : Dalai.text
              .regular(context, subtitle, textAlign: TextAlign.center),
          onButtonTap == null ? SizedBox.shrink() : Dalai.spacing.spacer(),
          onButtonTap == null
              ? SizedBox.shrink()
              : Dalai.button.smallButton(context, buttonText ?? '', onButtonTap,
              loading: loading),
          disclaimer == null ? SizedBox.shrink() : Dalai.spacing.spacer(),
          disclaimer == null
              ? SizedBox.shrink()
              : Dalai.text.xs(context, disclaimer, textAlign: TextAlign.center),
          Dalai.spacing.spacer(),
        ],
      ),
    );
  }

  String _extractAnimation(AnimationType animationType) {
    if (animationType == AnimationType.errorData) {
      return 'lib/assets/animations/ax_error_data.json';
    } else if (animationType == AnimationType.errorGeneric) {
      return 'lib/assets/animations/ax_error_generic.json';
    } else if (animationType == AnimationType.errorMap) {
      return 'lib/assets/animations/ax_error_map.json';
    } else if (animationType == AnimationType.errorSearch) {
      return 'lib/assets/animations/ax_error_search.json';
    } else if (animationType == AnimationType.errorUpdate) {
      return 'lib/assets/animations/ax_error_update.json';
    } else if (animationType == AnimationType.errorWorking) {
      return 'lib/assets/animations/ax_error_working.json';
    } else if (animationType == AnimationType.trackingDelivering) {
      return 'lib/assets/animations/ax_tracking_delivering.json';
    } else if (animationType == AnimationType.trackingDropoff) {
      return 'lib/assets/animations/ax_tracking_dropoff.json';
    } else if (animationType == AnimationType.trackingOngoingDelivery) {
      return 'lib/assets/animations/ax_tracking_ongoing_delivery.json';
    } else if (animationType == AnimationType.trackingOngoingMarket) {
      return 'lib/assets/animations/ax_tracking_ongoing_market.json';
    } else if (animationType == AnimationType.trackingOngoingSuper) {
      return 'lib/assets/animations/ax_tracking_ongoing_super.json';
    } else if (animationType == AnimationType.trackingPickup) {
      return 'lib/assets/animations/ax_tracking_pickup.json';
    } else if (animationType == AnimationType.trackingQueued) {
      return 'lib/assets/animations/ax_tracking_queued.json';
    } else if (animationType == AnimationType.paymentProcessing) {
      return 'lib/assets/animations/ax_payment.json';
    } else if (animationType == AnimationType.orderCancelled) {
      return 'lib/assets/animations/ax_order_cancel.json';
    } else if (animationType == AnimationType.orderDelivered) {
      return 'lib/assets/animations/ax_order_delivered.json';
    } else {
      return 'lib/assets/animations/ax_error_generic.json';
    }
  }
}

class CardTest extends StatelessWidget {
  final Widget? header;
  final Widget? body;
  final Widget? footer;
  const CardTest({Key? key, this.body, this.header, this.footer}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        header ?? SizedBox.shrink(),
        Expanded(child: body ?? SizedBox.shrink(),),
        footer ?? SizedBox.shrink(),
      ],
    );
  }
}

