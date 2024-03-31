import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../dui.dart';

class CustomTextField extends StatefulWidget {
  final String? label;
  final TextEditingController? controller;
  final FocusNode focusNode;
  final bool? enabled;
  final TextInputType? keyboardType;
  final TextCapitalization? textCapitalization;
  final bool? obscure;
  final TextInputAction? textInputAction;
  final FocusNode? nextFocusNode;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final Color? colorText;
  final bool? expands;
  final String? hint;
  final Function(String)? onChange;
  final Function(String)? onSubmit;
  final int? maxLines;
  final int? minLines;
  final int? maxLength;
  final List<TextInputFormatter>? inputFormatters;
  final String? error;
  final String? helpMessage;
  final bool? showPrefixSeparator;
  final bool? showSuffixSeparator;
  final Color? borderColor;
  final Color? bgColor;
  final bool? loading;
  final bool? ignorePointer;
  final bool? isSmall;

  const CustomTextField(this.label, this.controller, this.focusNode,
      {Key? key,
      this.enabled,
      this.keyboardType,
      this.textCapitalization,
      this.obscure,
      this.textInputAction,
      this.nextFocusNode,
      this.suffixIcon,
      this.prefixIcon,
      this.colorText,
      this.expands,
      this.hint,
      this.onChange,
      this.onSubmit,
      this.maxLines,
      this.minLines,
      this.maxLength,
      this.inputFormatters,
      this.error,
      this.helpMessage,
      this.showPrefixSeparator = false,
      this.showSuffixSeparator = false,
      this.loading = false,
      this.ignorePointer = false,
      this.isSmall = false,
      this.borderColor,
      this.bgColor})
      : super(key: key);

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  StreamController<bool> streamController = StreamController<bool>();

  @override
  void initState() {
    super.initState();
    widget.focusNode.addListener(() {
      if (widget.focusNode.hasFocus) {
        streamController.add(true);
      } else {
        streamController.add(false);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<bool>(
        stream: streamController.stream,
        builder: (context, snapshot) {
          bool isFocusEnabled = snapshot.data ?? false;
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Flexible(
                child: Container(
                  decoration: BoxDecoration(
                    color: widget.bgColor ??
                        Theme.of(context).colorScheme.background,
                    borderRadius:
                        BorderRadius.circular(DUI.spacing.borderRadius),
                    border: Border.all(
                        color: widget.error != null && widget.error!.isNotEmpty
                            ? Theme.of(context).colorScheme.error
                            : isFocusEnabled
                                ? Theme.of(context)
                                    .inputDecorationTheme
                                    .focusedBorder!
                                    .borderSide
                                    .color
                                : widget.borderColor ??
                                    Theme.of(context)
                                        .inputDecorationTheme
                                        .enabledBorder!
                                        .borderSide
                                        .color,
                        width: Theme.of(context)
                            .inputDecorationTheme
                            .enabledBorder!
                            .borderSide
                            .width),
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(
                        top: DUI.spacing.lateralPaddingValue,
                        right: DUI.spacing.lateralPaddingValue,
                        left: DUI.spacing.lateralPaddingValue,
                        bottom: DUI.spacing.lateralPaddingValue),
                    child: Row(
                      children: [
                        widget.prefixIcon != null
                            ? Row(
                                children: [
                                  widget.prefixIcon!,
                                  DUI.spacing.hSpacer(),
                                  widget.showPrefixSeparator!
                                      ? Row(
                                          children: [
                                            SizedBox(
                                              height: 24,
                                              child: VerticalDivider(
                                                width: 1,
                                                thickness: 1,
                                                color: Theme.of(context)
                                                    .inputDecorationTheme
                                                    .enabledBorder!
                                                    .borderSide
                                                    .color,
                                              ),
                                            ),
                                            DUI.spacing.hSpacer()
                                          ],
                                        )
                                      : const SizedBox.shrink(),
                                ],
                              )
                            : const SizedBox.shrink(),
                        Expanded(
                          child: AbsorbPointer(
                            absorbing: widget.ignorePointer!,
                            child: TextField(
                              focusNode: widget.focusNode,
                              onChanged: (value) {
                                if (widget.onChange != null) {
                                  widget.onChange!(value);
                                }
                              },
                              onTapOutside: (event) {
                                widget.focusNode.unfocus();
                              },
                              onSubmitted: (term) {
                                if (widget.textInputAction != null &&
                                    widget.textInputAction ==
                                        TextInputAction.next) {
                                  FocusScope.of(context)
                                      .requestFocus(widget.nextFocusNode);
                                }
                                if (widget.onSubmit != null) {
                                  widget.onSubmit!(term);
                                }
                              },
                              inputFormatters: widget.inputFormatters,
                              autocorrect: false,
                              keyboardType:
                                  widget.keyboardType ?? TextInputType.text,
                              textCapitalization: widget.textCapitalization ??
                                  TextCapitalization.sentences,
                              autofocus: false,
                              controller: widget.controller,
                              enabled: widget.enabled ?? true,
                              maxLength: widget.maxLength,
                              obscureText: widget.obscure ?? false,
                              cursorColor: Theme.of(context)
                                  .inputDecorationTheme
                                  .focusColor,
                              textInputAction: widget.textInputAction ??
                                  TextInputAction.done,
                              maxLines:
                                  widget.expands != null && widget.expands!
                                      ? null
                                      : widget.maxLines ?? 1,
                              minLines: widget.minLines,
                              expands: widget.expands ?? false,
                              textAlign: TextAlign.start,
                              textAlignVertical: (isFocusEnabled ||
                                          widget.controller!.text.isNotEmpty) &&
                                      widget.expands == null &&
                                      widget.label != null
                                  ? TextAlignVertical.bottom
                                  : TextAlignVertical.top,
                              style: TextStyle(
                                  fontSize: DUI.text.regularText,
                                  color: widget.colorText ??
                                      (widget.enabled == null || widget.enabled!
                                          ? Theme.of(context)
                                              .textTheme
                                              .bodyLarge!
                                              .color
                                          : Theme.of(context)
                                              .textTheme
                                              .bodyLarge!
                                              .color!
                                              .withOpacity(0.75))),
                              decoration: InputDecoration(
                                  isDense: true,
                                  contentPadding: EdgeInsets.only(
                                      top: widget.isSmall!
                                          ? 0
                                          : DUI.spacing.lateralPaddingValue,
                                      bottom: 0),
                                  filled: false,
                                  focusedBorder: const OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.transparent, width: 0)),
                                  enabledBorder: const OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.transparent, width: 0)),
                                  disabledBorder: const OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.transparent, width: 0)),
                                  labelText:
                                      widget.isSmall! ? null : widget.label,
                                  labelStyle: TextStyle(
                                      fontWeight: isFocusEnabled ||
                                              widget.controller!.text.isNotEmpty
                                          ? DUI.text.semiBoldWeight
                                          : DUI.text.regularWeight,
                                      color: widget.enabled == null ||
                                              widget.enabled!
                                          ? isFocusEnabled ||
                                                  widget.controller!.text
                                                      .isNotEmpty
                                              ? Theme.of(context)
                                                  .inputDecorationTheme
                                                  .focusColor
                                              : Theme.of(context)
                                                  .textTheme
                                                  .bodySmall!
                                                  .color
                                          : Theme.of(context)
                                              .inputDecorationTheme
                                              .focusColor!
                                              .withOpacity(0.3)),
                                  alignLabelWithHint: true,
                                  hintText: widget.isSmall!
                                      ? widget.label
                                      : widget.hint,
                                  hintStyle: Theme.of(context)
                                      .textTheme
                                      .bodyLarge!
                                      .copyWith(
                                          color: widget.enabled == null ||
                                                  widget.enabled!
                                              ? isFocusEnabled ||
                                                      widget.controller!.text.isNotEmpty
                                                  ? Theme.of(context).inputDecorationTheme.focusColor
                                                  : Theme.of(context).textTheme.bodySmall!.color
                                              : Theme.of(context).inputDecorationTheme.focusColor!.withOpacity(0.3)),
                                  hintMaxLines: widget.maxLines),
                            ),
                          ),
                        ),
                        widget.loading!
                            ? Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  DUI.misc.loadingAnimation(context, size: 16),
                                  DUI.spacing.hSpacer(small: true),
                                ],
                              )
                            : widget.suffixIcon != null
                                ? Row(
                                    children: [
                                      widget.showSuffixSeparator!
                                          ? Row(
                                              children: [
                                                DUI.spacing.hSpacer(),
                                                SizedBox(
                                                  height: 24,
                                                  child: VerticalDivider(
                                                    width: 1,
                                                    thickness: 1,
                                                    color: Theme.of(context)
                                                        .inputDecorationTheme
                                                        .enabledBorder!
                                                        .borderSide
                                                        .color,
                                                  ),
                                                )
                                              ],
                                            )
                                          : const SizedBox.shrink(),
                                      DUI.spacing.hSpacer(),
                                      widget.suffixIcon!
                                    ],
                                  )
                                : const SizedBox.shrink(),
                      ],
                    ),
                  ),
                ),
              ),
              Column(
                children: [
                  (widget.error != null && widget.error!.isNotEmpty) ||
                          (widget.helpMessage != null &&
                              widget.helpMessage!.isNotEmpty)
                      ? DUI.spacing.spacer(small: true)
                      : SizedBox.shrink(),
                  Row(
                    children: [
                      widget.error != null && widget.error!.isNotEmpty
                          ? Expanded(
                              child: DUI.text.xs(context, widget.error,
                                  color: Theme.of(context).colorScheme.error,
                                  maxLines: 2),
                            )
                          : SizedBox.shrink(),
                      DUI.spacing.hSpacer(),
                      widget.helpMessage != null &&
                              widget.helpMessage!.isNotEmpty
                          ? Expanded(
                              child: DUI.text.xs(context, widget.helpMessage,
                                  maxLines: 2, textAlign: TextAlign.end),
                            )
                          : SizedBox.shrink(),
                    ],
                  ),
                ],
              )
            ],
          );
        });
  }
}
