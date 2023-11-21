import 'package:dui/common_utils/color_extension.dart';
import 'package:flutter/material.dart';

import '../../common_utils/common_utils.dart';
import '../../dui.dart';

class CustomButton extends StatefulWidget {
  String? text;
  Function? onPressed;
  IconData? icon;
  Widget? leading;
  Widget? trailing;
  Widget? content;
  Color? color;
  Color? textColor;
  bool loading;
  bool small;
  bool expanded;
  bool outlined = false;
  Color? bgColor;
  double? borderRadius;

  CustomButton(
      {Key? key,
      required this.text,
      required this.onPressed,
      this.icon,
      this.leading,
      this.trailing,
      this.content,
      this.color,
      this.textColor,
      this.loading = false,
      this.small = false,
      this.expanded = false,
      this.outlined = false,
      this.bgColor,
      this.borderRadius})
      : super(key: key);

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  var currentValue = 0;
  final double buttonMinHeight = 64.0;
  final double smallButtonMinHeight = 42.0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.small) {
      return AnimatedContainer(
        constraints: BoxConstraints(
            minWidth: widget.loading ? (buttonMinHeight + 24) : 100,
            maxWidth: MediaQuery.of(context).size.width),
        duration: Duration(milliseconds: 400),
        curve: Curves.ease,
        width: widget.expanded
            ? double.infinity
            : widget.loading
                ? (buttonMinHeight + 24)
                : null,
        child: ElevatedButton(
            onPressed: widget.onPressed != null
                ? () {
                    if (widget.onPressed != null && !widget.loading) {
                      Utils.vibrateOnTap();
                      widget.onPressed!();
                    }
                  }
                : null,
            style: ElevatedButton.styleFrom(
              elevation: 0,
              shadowColor: Colors.transparent,
              backgroundColor: widget.bgColor ?? Colors.transparent,
              foregroundColor: Theme.of(context).colorScheme.primary.lighten(),
              disabledBackgroundColor: Colors.transparent,
              padding: DUI.spacing.lateralPadding,
              shape: RoundedRectangleBorder(
                side: BorderSide(
                    color: widget.color?.withOpacity(widget.onPressed != null ? 0.2 : 0.1) ??
                        Theme.of(context)
                            .textTheme
                            .bodyMedium!
                            .color!
                            .withOpacity(widget.onPressed != null ? 0.2 : 0.1),
                    width: DUI.spacing.borderWidth),
                borderRadius: BorderRadius.circular(widget.borderRadius ?? DUI.spacing.borderRadius),
              ),
            ),
            child: widget.loading
                ? DUI.misc.loadingAnimation(context, size: 18)
                : Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      widget.icon != null
                          ? Row(
                              children: [
                                Icon(widget.icon!,
                                    color: (widget.color ??
                                            Theme.of(context)
                                                .textTheme
                                                .bodyMedium!
                                                .color!)
                                        .withOpacity(
                                            widget.onPressed != null ? 1 : 0.5),
                                    size: 12),
                                DUI.spacing.hSpacer(small: true)
                              ],
                            )
                          : const SizedBox.shrink(),
                      widget.text != null
                          ? DUI.text.small(context, widget.text,
                              color: (widget.color ??
                                      Theme.of(context)
                                          .textTheme
                                          .bodyMedium!
                                          .color!)
                                  .withOpacity(
                                      widget.onPressed != null ? 1 : 0.5),
                              bold: true)
                          : const SizedBox.shrink(),
                    ],
                  )),
      );
    }
    return AnimatedContainer(
        height: buttonMinHeight,
        constraints: BoxConstraints(
            minWidth: widget.loading ? (buttonMinHeight + 24) : 200,
            maxWidth: MediaQuery.of(context).size.width),
        width: widget.loading
            ? (buttonMinHeight + 24)
            : MediaQuery.of(context).size.width,
        duration: Duration(milliseconds: 400),
        curve: Curves.ease,
        child: ElevatedButton(
          onPressed: widget.onPressed != null
              ? () {
                  if (widget.onPressed != null && widget.loading == false) {
                    Utils.vibrateOnTap();
                    widget.onPressed!();
                  }
                }
              : null,
          style: ElevatedButton.styleFrom(
            elevation: 0,
            shadowColor: Colors.transparent,
            padding: DUI.spacing.lateralPadding,
            backgroundColor: widget.outlined
                ? Colors.transparent
                : widget.color ?? Theme.of(context).colorScheme.primary,
            disabledBackgroundColor: widget.outlined
                ? widget.bgColor ?? Colors.transparent
                : (widget.color ?? Theme.of(context).colorScheme.primary)
                    .lighten(0.2),
            shape: widget.outlined
                ? RoundedRectangleBorder(
                    side: BorderSide(
                        color: (widget.color ??
                                Theme.of(context).colorScheme.primary)
                            .withOpacity(widget.onPressed != null ? 1 : 0.5),
                        width: 2),
                    borderRadius:
                        BorderRadius.circular(widget.borderRadius ?? DUI.spacing.borderRadius),
                  )
                : RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(widget.borderRadius ?? DUI.spacing.borderRadius),
                  ),
          ),
          child: widget.loading
              ? DUI.misc.loadingAnimation(context,
                  light: (widget.textColor ?? Theme.of(context).colorScheme.onPrimary)
                          .computeLuminance() >
                      0.5)
              : Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    widget.leading ?? const SizedBox.shrink(),
                    Expanded(
                        child: Center(
                      child: widget.content ??
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              widget.icon != null
                                  ? Row(
                                      children: [
                                        Icon(
                                          widget.icon!,
                                          color: (widget.textColor ??
                                                  Theme.of(context).colorScheme.onPrimary)
                                              .withOpacity(
                                                  widget.onPressed == null
                                                      ? 0.5
                                                      : 1),
                                        ),
                                        DUI.spacing.hSpacer(small: true)
                                      ],
                                    )
                                  : const SizedBox.shrink(),
                              widget.text != null
                                  ? DUI.text.title3(
                                      context,
                                      widget.text,
                                      color: (widget.textColor ??
                                              Theme.of(context).colorScheme.onPrimary)
                                          .withOpacity(widget.onPressed == null
                                              ? 0.5
                                              : 1),
                                    )
                                  : const SizedBox.shrink(),
                            ],
                          ),
                    )),
                    widget.trailing ?? const SizedBox.shrink(),
                  ],
                ),
        ));
  }
}
