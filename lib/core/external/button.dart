import 'package:dui/common_utils/color_extension.dart';
import 'package:flutter/material.dart';
import 'package:smooth_corner/smooth_corner.dart';
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
  bool enableGlass;
  Color? glassTintColor;
  int? glassDensityMultiplier;
  double? glassBlur;
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
        this.enableGlass = false,
        this.glassDensityMultiplier,
        this.glassTintColor,
        this.glassBlur,
        this.borderRadius,
      })
      : super(key: key);

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  var currentValue = 0;
  final double buttonMinHeight = 64.0;
  final double smallButtonMinHeight = 42.0;
  var _isCurrentlyLoading = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _isCurrentlyLoading = widget.loading;

    if (widget.small) {
      return AnimatedContainer(
        height: smallButtonMinHeight,
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
        child: DUI.misc.glassContainer(
          glassTintColor: widget.glassTintColor,
          densityMultiplier: widget.glassDensityMultiplier,
          blurRadius: widget.glassBlur,
          enabled: widget.enableGlass,
          child: ElevatedButton(
              onPressed: widget.onPressed != null
                  ? () {
                if (widget.onPressed != null && widget.loading == false) {
                  Utils.vibrateOnTap();
                  _isCurrentlyLoading = true;
                  widget.onPressed!();
                } else {
                  _isCurrentlyLoading = false;
                }
                setState(() {});
              }
                  : null,
              style: ElevatedButton.styleFrom(
                  elevation: 0,
                  shadowColor: Colors.transparent,
                  backgroundColor: widget.bgColor ?? Colors.transparent,
                  foregroundColor: DUI.color.primaryOutlinedNestingBackground,
                  disabledBackgroundColor: Colors.transparent,
                  padding: DUI.spacing.lateralPadding,
                  shape: SmoothRectangleBorder(
                    borderRadius:
                    BorderRadius.circular(widget.borderRadius ?? DUI.spacing.borderRadius),
                    side: BorderSide(
                        color: widget.enableGlass ? Colors.transparent : widget.color?.withOpacity(
                            widget.onPressed != null ? 0.2 : 0.1) ??
                            Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .color!
                                .withOpacity(
                                widget.onPressed != null ? 0.2 : 0.1),
                        width: DUI.spacing.borderWidth),
                    smoothness: 1.0,
                  )),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  ClipRect(
                    child: AnimatedOpacity(
                      opacity: _isCurrentlyLoading ? 0.0 : 1.0,
                      duration: Duration(milliseconds: 401),
                      curve: Curves.easeInOut,
                      child: Row(
                        mainAxisSize: widget.expanded ? MainAxisSize.max : MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
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
                      ),
                    ),
                  ),
                  widget.loading
                      ? DUI.misc.loadingAnimation(context, size: 18)
                      : SizedBox.shrink()
                ],
              )),
        ),
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
        child: DUI.misc.glassContainer(
          glassTintColor: widget.glassTintColor,
          densityMultiplier: widget.glassDensityMultiplier,
          blurRadius: widget.glassBlur,
          enabled: widget.enableGlass,
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
                    ? widget.bgColor ?? Colors.transparent
                    : widget.color ?? Theme.of(context).colorScheme.primary,
                disabledBackgroundColor: widget.outlined
                    ? Colors.transparent
                    : (widget.color ?? Theme.of(context).colorScheme.primary)
                    .lighten(0.2),
                shape: widget.outlined
                    ? SmoothRectangleBorder(
                  side: BorderSide(
                      color: (widget.color ??
                          Theme.of(context).colorScheme.primary)
                          .withOpacity(
                          widget.onPressed != null ? 1 : 0.5),
                      width: 2),
                  borderRadius:
                  BorderRadius.circular(widget.borderRadius ?? DUI.spacing.borderRadius),
                  smoothness: 1.0,
                )
                    : SmoothRectangleBorder(
                  borderRadius:
                  BorderRadius.circular(widget.borderRadius ?? DUI.spacing.borderRadius),
                  smoothness: 1.0,
                )),
            child: widget.loading
                ? DUI.misc.loadingAnimation(context,
                light: (widget.textColor ?? DUI.color.primaryContrast)
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
                                  ? DUI.text.title3(
                                context,
                                widget.text,
                                color: (widget.textColor ??
                                    DUI.color.primaryContrast)
                                    .withOpacity(
                                    widget.onPressed == null
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
          ),
        ));
  }
}
