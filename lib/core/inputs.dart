import 'dart:async';

import 'package:cityxerpa_icons/cityxerpa_symbols.dart';
import 'package:dalai/core/external/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../dalai.dart';

class DalaiInputs {
  Widget textField(
    String? label,
    TextEditingController? controller,
    FocusNode focusNode,
    BuildContext context, {
    bool? enabled,
    TextInputType? keyboardType,
    TextCapitalization? textCapitalization,
    bool? obscure,
    TextInputAction? textInputAction,
    FocusNode? nextFocusNode,
    Widget? suffixIcon,
    Widget? prefixIcon,
    Color? colorText,
    bool? expands,
    String? hint,
    Function()? onChange,
    Function(String)? onSubmit,
    int? maxLines,
    int? minLines,
    int? maxLength,
    List<TextInputFormatter>? inputFormatters,
    String? error,
    String? helpMessage,
    bool? showPrefixSeparator = false,
    bool? showSuffixSeparator = false,
  }) {
    StreamController<bool> streamController = StreamController<bool>();
    return StreamBuilder<bool>(
        stream: streamController.stream,
        builder: (context, snapshot) {
          bool isFocusEnabled = snapshot.data ?? false;
          return Focus(
            focusNode: focusNode,
            onFocusChange: (hasFocus) {
              streamController.add(hasFocus);
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Flexible(
                  child: Container(
                    decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.background,
                        borderRadius:
                            BorderRadius.circular(Dalai.spacing.borderRadius),
                        border: Border.all(
                            color: error != null && error.isNotEmpty
                                ? Dalai.color.error
                                : isFocusEnabled
                                    ? Theme.of(context)
                                        .inputDecorationTheme
                                        .focusedBorder!
                                        .borderSide
                                        .color
                                    : Theme.of(context)
                                        .inputDecorationTheme
                                        .enabledBorder!
                                        .borderSide
                                        .color,
                            width: Dalai.spacing.borderWidth)),
                    child: Padding(
                      padding: EdgeInsets.only(
                          top: Dalai.spacing.lateralPaddingValue,
                          right: Dalai.spacing.lateralPaddingValue,
                          left: Dalai.spacing.lateralPaddingValue,
                          bottom: Dalai.spacing.lateralPaddingValue),
                      child: Row(
                        children: [
                          prefixIcon != null
                              ? Row(
                                  children: [
                                    prefixIcon,
                                    Dalai.spacing.hSpacer(),
                                    showPrefixSeparator!
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
                                              Dalai.spacing.hSpacer()
                                            ],
                                          )
                                        : const SizedBox.shrink(),
                                  ],
                                )
                              : const SizedBox.shrink(),
                          Expanded(
                            child: TextField(
                              onChanged: (value) {
                                if (onChange != null) {
                                  onChange();
                                }
                              },
                              onTapOutside: (event) {
                                focusNode.unfocus();
                              },
                              onSubmitted: (term) {
                                if (textInputAction != null &&
                                    textInputAction == TextInputAction.next) {
                                  FocusScope.of(context)
                                      .requestFocus(nextFocusNode);
                                }
                                if (onSubmit != null) {
                                  onSubmit(term)!;
                                }
                              },
                              inputFormatters: inputFormatters,
                              autocorrect: false,
                              keyboardType: keyboardType ?? TextInputType.text,
                              textCapitalization: textCapitalization ??
                                  TextCapitalization.sentences,
                              autofocus: false,
                              controller: controller,
                              enabled: enabled ?? true,
                              maxLength: maxLength,
                              obscureText: obscure ?? false,
                              cursorColor: Theme.of(context)
                                  .inputDecorationTheme
                                  .focusColor,
                              textInputAction:
                                  textInputAction ?? TextInputAction.done,
                              maxLines: expands != null && expands
                                  ? null
                                  : maxLines ?? 1,
                              minLines: minLines,
                              expands: expands ?? false,
                              textAlign: TextAlign.start,
                              textAlignVertical: (isFocusEnabled ||
                                          controller!.text.isNotEmpty) &&
                                      expands == null &&
                                      label != null
                                  ? TextAlignVertical.bottom
                                  : TextAlignVertical.top,
                              style: TextStyle(
                                  fontSize: Dalai.text.regularText,
                                  color: colorText ??
                                      (enabled == null || enabled
                                          ? Theme.of(context)
                                              .textTheme
                                              .bodyMedium!
                                              .color
                                          : Theme.of(context)
                                              .textTheme
                                              .bodyMedium!
                                              .color!
                                              .withOpacity(0.3))),
                              decoration: InputDecoration(
                                  isDense: true,
                                  contentPadding: EdgeInsets.only(
                                      top: Dalai.spacing.lateralPaddingValue,
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
                                  labelText: label,
                                  labelStyle: TextStyle(
                                      fontWeight: isFocusEnabled ||
                                              controller!.text.isNotEmpty
                                          ? Dalai.text.semiBoldWeight
                                          : Dalai.text.regularWeight,
                                      color: enabled == null || enabled
                                          ? isFocusEnabled ||
                                                  controller!.text.isNotEmpty
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
                                  hintText: hint,
                                  hintMaxLines: maxLines),
                            ),
                          ),
                          suffixIcon != null
                              ? Row(
                                  children: [
                                    showSuffixSeparator!
                                        ? Row(
                                            children: [
                                              Dalai.spacing.hSpacer(),
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
                                    Dalai.spacing.hSpacer(),
                                    suffixIcon
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
                    (error != null && error.isNotEmpty) ||
                            (helpMessage != null && helpMessage.isNotEmpty)
                        ? Dalai.spacing.spacer(small: true)
                        : SizedBox.shrink(),
                    Row(
                      children: [
                        error != null && error.isNotEmpty
                            ? Expanded(
                                child: Dalai.text.xs(context, error,
                                    color: Dalai.color.error, maxLines: 2),
                              )
                            : SizedBox.shrink(),
                        Dalai.spacing.hSpacer(),
                        helpMessage != null && helpMessage.isNotEmpty
                            ? Expanded(
                                child: Dalai.text.xs(context, helpMessage,
                                    maxLines: 2, textAlign: TextAlign.end),
                              )
                            : SizedBox.shrink(),
                      ],
                    ),
                  ],
                )
              ],
            ),
          );
        });
  }

  Widget smallTextField(
    TextEditingController? controller,
    FocusNode focusNode,
    BuildContext context, {
    bool? enabled,
    TextInputType? keyboardType,
    TextCapitalization? textCapitalization,
    bool? obscure,
    TextInputAction? textInputAction,
    FocusNode? nextFocusNode,
    Widget? suffixIcon,
    Widget? prefixIcon,
    Color? colorText,
    bool? expands,
    String? hint,
    Function()? onChange,
    Function(String)? onSubmit,
    int? maxLines,
    int? minLines,
    int? maxLength,
    List<TextInputFormatter>? inputFormatters,
    String? error,
    String? helpMessage,
    bool? showPrefixSeparator = false,
    bool? showSuffixSeparator = false,
  }) {
    StreamController<bool> streamController = StreamController<bool>();

    return StreamBuilder<bool>(
        stream: streamController.stream,
        builder: (context, snapshot) {
          bool isFocusEnabled = snapshot.data ?? false;
          return Focus(
            focusNode: focusNode,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Flexible(
                    child: Container(
                  decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.background,
                      borderRadius:
                          BorderRadius.circular(Dalai.spacing.borderRadius),
                      border: Border.all(
                          color: error != null && error.isNotEmpty
                              ? Dalai.color.error
                              : isFocusEnabled
                                  ? Theme.of(context)
                                      .inputDecorationTheme
                                      .focusedBorder!
                                      .borderSide
                                      .color
                                  : Theme.of(context)
                                      .inputDecorationTheme
                                      .enabledBorder!
                                      .borderSide
                                      .color,
                          width: Dalai.spacing.borderWidth)),
                  child: Padding(
                    padding: EdgeInsets.only(
                        top: Dalai.spacing.lateralPaddingValue,
                        right: Dalai.spacing.lateralPaddingValue,
                        left: Dalai.spacing.lateralPaddingValue,
                        bottom: Dalai.spacing.lateralPaddingValue),
                    child: Row(
                      children: [
                        prefixIcon != null
                            ? Row(
                                children: [
                                  prefixIcon,
                                  Dalai.spacing.hSpacer(),
                                  showPrefixSeparator!
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
                                            Dalai.spacing.hSpacer()
                                          ],
                                        )
                                      : const SizedBox.shrink(),
                                ],
                              )
                            : const SizedBox.shrink(),
                        Expanded(
                          child: TextField(
                            onTapOutside: (event) {
                              focusNode.unfocus();
                            },
                            onChanged: (value) {
                              if (onChange != null) {
                                onChange();
                              }
                            },
                            onSubmitted: (term) {
                              if (textInputAction != null &&
                                  textInputAction == TextInputAction.next) {
                                FocusScope.of(context)
                                    .requestFocus(nextFocusNode);
                              }
                              if (onSubmit != null) {
                                onSubmit(term)!;
                              }
                              focusNode.unfocus();
                            },
                            inputFormatters: inputFormatters,
                            autocorrect: false,
                            keyboardType: keyboardType ?? TextInputType.text,
                            textCapitalization: textCapitalization ??
                                TextCapitalization.sentences,
                            autofocus: false,
                            controller: controller,
                            enabled: enabled ?? true,
                            maxLength: maxLength,
                            obscureText: obscure ?? false,
                            cursorColor: Theme.of(context)
                                .inputDecorationTheme
                                .focusColor,
                            textInputAction:
                                textInputAction ?? TextInputAction.done,
                            maxLines: expands != null && expands
                                ? null
                                : maxLines ?? 1,
                            minLines: minLines,
                            expands: expands ?? false,
                            textAlign: TextAlign.start,
                            textAlignVertical: TextAlignVertical.top,
                            style: TextStyle(
                                fontSize: Dalai.text.regularText,
                                color: colorText ??
                                    (enabled == null || enabled
                                        ? Theme.of(context)
                                            .textTheme
                                            .bodyMedium!
                                            .color
                                        : Theme.of(context)
                                            .textTheme
                                            .bodyMedium!
                                            .color!
                                            .withOpacity(0.3))),
                            decoration: InputDecoration(
                                isDense: true,
                                contentPadding:
                                    EdgeInsets.only(top: 0, bottom: 0),
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
                                labelText: null,
                                labelStyle: TextStyle(
                                    fontWeight: isFocusEnabled ||
                                            controller!.text.isNotEmpty
                                        ? Dalai.text.semiBoldWeight
                                        : Dalai.text.regularWeight,
                                    color: enabled == null || enabled
                                        ? isFocusEnabled ||
                                                controller!.text.isNotEmpty
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
                                hintText: hint,
                                hintMaxLines: maxLines),
                          ),
                        ),
                        suffixIcon != null
                            ? Row(
                                children: [
                                  showSuffixSeparator!
                                      ? Row(
                                          children: [
                                            Dalai.spacing.hSpacer(),
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
                                  Dalai.spacing.hSpacer(),
                                  suffixIcon
                                ],
                              )
                            : const SizedBox.shrink(),
                      ],
                    ),
                  ),
                )),
                Column(
                  children: [
                    (error != null && error.isNotEmpty) ||
                            (helpMessage != null && helpMessage.isNotEmpty)
                        ? Dalai.spacing.spacer(small: true)
                        : SizedBox.shrink(),
                    Row(
                      children: [
                        error != null && error.isNotEmpty
                            ? Expanded(
                                child: Dalai.text.xs(context, error,
                                    color: Dalai.color.error, maxLines: 2),
                              )
                            : SizedBox.shrink(),
                        Dalai.spacing.hSpacer(),
                        helpMessage != null && helpMessage.isNotEmpty
                            ? Expanded(
                                child: Dalai.text.xs(context, helpMessage,
                                    maxLines: 2, textAlign: TextAlign.end),
                              )
                            : SizedBox.shrink(),
                      ],
                    ),
                  ],
                )
              ],
            ),
            onFocusChange: (hasFocus) {
              streamController.add(hasFocus);
            },
          );
        });
  }

  Widget searchField(
    String? label,
    TextEditingController? controller,
    FocusNode focusNode,
    BuildContext context, {
    TextInputType? keyboardType,
    TextCapitalization? textCapitalization,
    TextInputAction? textInputAction,
    FocusNode? nextFocusNode,
    Color? colorText,
    Color? bgColor,
    bool? expands,
    String? hint,
    Function()? onChange,
    Function(String)? onSubmit,
    Function()? onTap,
    int? maxLines,
    Widget? suffixIcon,
    int? minLines,
    List<TextInputFormatter>? inputFormatters,
    bool loading = false,
    bool enabled = true,
  }) {
    StreamController<bool> streamController = StreamController<bool>();

    return StreamBuilder<bool>(
        stream: streamController.stream,
        builder: (context, snapshot) {
          bool isFocusEnabled = snapshot.data ?? false;
          return Focus(
            focusNode: focusNode,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Flexible(
                    child: Container(
                  decoration: BoxDecoration(
                      color: bgColor ?? Theme.of(context).inputDecorationTheme.fillColor,
                      borderRadius:
                          BorderRadius.circular(Dalai.spacing.borderRadius),
                      border: Border.all(
                          color: isFocusEnabled
                              ? Theme.of(context)
                                  .inputDecorationTheme
                                  .focusedBorder!
                                  .borderSide
                                  .color
                              : Colors.transparent,
                          width: Dalai.spacing.borderWidth)),
                  child: Padding(
                    padding: EdgeInsets.only(
                        top: Dalai.spacing.lateralPaddingValue,
                        right: Dalai.spacing.lateralPaddingValue,
                        left: Dalai.spacing.lateralPaddingValue,
                        bottom: Dalai.spacing.lateralPaddingValue),
                    child: Row(
                      children: [
                        Row(
                          children: [
                            Dalai.icon.dalaiIcons(context, CXIcon.search,
                                mainColor: colorText),
                            Dalai.spacing.hSpacer()
                          ],
                        ),
                        Expanded(
                          child: TextField(
                            onTapOutside: (event) {
                              focusNode.unfocus();
                            },
                            onChanged: (value) {
                              if (onChange != null) {
                                onChange();
                              }
                            },
                            onSubmitted: (term) {
                              if (textInputAction != null &&
                                  textInputAction == TextInputAction.next) {
                                FocusScope.of(context)
                                    .requestFocus(nextFocusNode);
                              }
                              if (onSubmit != null) {
                                onSubmit(term)!;
                              }
                              focusNode.unfocus();
                            },
                            inputFormatters: inputFormatters,
                            autocorrect: false,
                            keyboardType: keyboardType ?? TextInputType.text,
                            textCapitalization: textCapitalization ??
                                TextCapitalization.sentences,
                            autofocus: false,
                            controller: controller,
                            enabled: enabled,
                            cursorColor: Theme.of(context)
                                .inputDecorationTheme
                                .focusColor,
                            textInputAction:
                                textInputAction ?? TextInputAction.done,
                            maxLines: expands != null && expands
                                ? null
                                : maxLines ?? 1,
                            minLines: minLines,
                            expands: expands ?? false,
                            textAlign: TextAlign.start,
                            textAlignVertical: (isFocusEnabled ||
                                        controller!.text.isNotEmpty) &&
                                    expands == null &&
                                    label != null
                                ? TextAlignVertical.bottom
                                : TextAlignVertical.top,
                            style: TextStyle(
                                fontSize: Dalai.text.regularText,
                                color: colorText ??
                                    (enabled
                                        ? Theme.of(context)
                                            .textTheme
                                            .bodyMedium!
                                            .color
                                        : Theme.of(context)
                                            .textTheme
                                            .bodyMedium!
                                            .color!
                                            .withOpacity(0.3))),
                            decoration: InputDecoration(
                                isDense: true,
                                contentPadding: EdgeInsets.only(
                                    top: Dalai.spacing.lateralPaddingValue,
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
                                labelText: label,
                                labelStyle: TextStyle(
                                    fontWeight: isFocusEnabled ||
                                            controller!.text.isNotEmpty
                                        ? Dalai.text.semiBoldWeight
                                        : Dalai.text.regularWeight,
                                    color: enabled
                                        ? isFocusEnabled ||
                                                controller!.text.isNotEmpty
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
                                hintText: hint,
                                hintMaxLines: maxLines),
                          ),
                        ),
                        loading
                            ? Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  loading
                                      ? Dalai.misc
                                          .loadingAnimation(context, size: 16)
                                      : SizedBox.shrink(),
                                  loading
                                      ? Dalai.spacing.hSpacer(small: true)
                                      : SizedBox.shrink(),
                                ],
                              )
                            : Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Dalai.spacing.hSpacer(),
                                  suffixIcon ?? SizedBox.shrink()
                                ],
                              )
                      ],
                    ),
                  ),
                )),
              ],
            ),
            onFocusChange: (hasFocus) {
              streamController.add(hasFocus);
            },
          );
        });
  }

  Widget chatInputField(BuildContext context, String? label,
      TextEditingController? controller, FocusNode focusNode,
      {Function(String)? onSubmit, double? height, bool? enabled}) {
    return Dalai.input.smallTextField(controller, focusNode, context,
        hint: label,
        onSubmit: onSubmit,
        enabled: enabled,
        maxLines: 3,
        minLines: 1);
  }

  Widget phoneTextField(
      BuildContext context,
      String? label,
      TextEditingController? controller,
      FocusNode focusNode,
      String initialPhonePrefix,
      Function(String) onPrefixChange,
      {bool isEnabled = true,
      Widget? trailing,
      Function()? onChange}) {
    return Dalai.input.textField(label, controller, focusNode, context,
        enabled: isEnabled,
        suffixIcon: trailing ?? const SizedBox.shrink(),
        prefixIcon: CountryPicker(
          initialSelection: initialPhonePrefix,
          favorite: const ['+376', '+34', '+33', '+351'],
          onChanged: (country) {
            onPrefixChange(country!.countryCode ?? '');
          },
        ),
        showPrefixSeparator: true,
        inputFormatters: <TextInputFormatter>[
          LengthLimitingTextInputFormatter(12),
        ],
        keyboardType: TextInputType.phone,
        onChange: onChange);
  }
}
