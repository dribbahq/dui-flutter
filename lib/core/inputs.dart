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
    FocusNode? focusNode,
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
                          width: isFocusEnabled
                              ? Theme.of(context)
                                  .inputDecorationTheme
                                  .focusedBorder!
                                  .borderSide
                                  .width
                              : Theme.of(context)
                                  .inputDecorationTheme
                                  .enabledBorder!
                                  .borderSide
                                  .width)),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        vertical: Dalai.spacing.lateralPaddingValue + 4,
                        horizontal: Dalai.spacing.lateralPaddingValue),
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
                              if (focusNode != null) {
                                focusNode.unfocus();
                              }
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
                              if (focusNode != null) {
                                focusNode.unfocus();
                              }
                            },
                            inputFormatters: inputFormatters,
                            autocorrect: false,
                            keyboardType: keyboardType ?? TextInputType.text,
                            textCapitalization: textCapitalization ??
                                TextCapitalization.sentences,
                            autofocus: false,
                            controller: controller,
                            focusNode: focusNode,
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
                )),
                error != null && error.isNotEmpty
                    ? Column(
                        children: [
                          Dalai.spacing.spacer(small: true),
                          Dalai.text.small(context, error,
                              color: Dalai.color.error, maxLines: 1),
                        ],
                      )
                    : helpMessage != null && helpMessage.isNotEmpty
                        ? Column(
                            children: [
                              Dalai.spacing.spacer(small: true),
                              Dalai.text
                                  .small(context, helpMessage, maxLines: 2),
                            ],
                          )
                        : const SizedBox.shrink()
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
    FocusNode? focusNode,
    BuildContext context, {
    bool? enabled,
    TextInputType? keyboardType,
    TextCapitalization? textCapitalization,
    bool? obscure,
    TextInputAction? textInputAction,
    FocusNode? nextFocusNode,
    CXIcon? prefixIcon,
    Widget? suffixIcon,
    Color? colorText,
    Color? bgColor,
    bool? expands,
    String? hint,
    Function()? onChange,
    Function(String)? onSubmit,
    Function()? onTap,
    int? maxLines,
    int? minLines,
    int? maxLength,
    List<TextInputFormatter>? inputFormatters,
    String? error,
    String? helpMessage,
    bool? showSuffixSeparator = false,
  }) {
    StreamController<bool> streamController = StreamController<bool>();

    return StreamBuilder<bool>(
        stream: streamController.stream,
        builder: (context, snapshot) {
          bool isFocusEnabled = snapshot.data ?? false;
          return Focus(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Flexible(
                  child: Container(
                    decoration: BoxDecoration(
                        color: bgColor ??
                            Theme.of(context).inputDecorationTheme.fillColor,
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
                                    : Colors.transparent,
                            width: isFocusEnabled
                                ? Theme.of(context)
                                    .inputDecorationTheme
                                    .focusedBorder!
                                    .borderSide
                                    .width
                                : 0)),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: Dalai.spacing.lateralPaddingValue,
                          horizontal: Dalai.spacing.lateralPaddingValue),
                      child: Row(
                        children: [
                          Dalai.icon.dalaiIcons(
                              context, prefixIcon ?? CXIcon.search,
                              mainColor: colorText),
                          Dalai.spacing.hSpacer(),
                          Expanded(
                            child: TextField(
                              onTap: () {
                                if (onTap != null) {
                                  onTap();
                                }
                              },
                              onTapOutside: (event) {
                                if (focusNode != null) {
                                  focusNode.unfocus();
                                }
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
                                if (focusNode != null) {
                                  focusNode.unfocus();
                                }
                              },
                              inputFormatters: inputFormatters,
                              autocorrect: false,
                              keyboardType: keyboardType ?? TextInputType.text,
                              textCapitalization: textCapitalization ??
                                  TextCapitalization.sentences,
                              autofocus: false,
                              controller: controller,
                              focusNode: focusNode,
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
                                      expands == null
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
                                      color: colorText ??
                                          (enabled == null || enabled
                                              ? isFocusEnabled ||
                                                      controller!
                                                          .text.isNotEmpty
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
                                                  .withOpacity(0.3))),
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
                error != null && error.isNotEmpty
                    ? Column(
                        children: [
                          Dalai.spacing.spacer(small: true),
                          Dalai.text.small(context, error,
                              color: Dalai.color.error, maxLines: 1),
                        ],
                      )
                    : helpMessage != null && helpMessage.isNotEmpty
                        ? Column(
                            children: [
                              Dalai.spacing.spacer(small: true),
                              Dalai.text
                                  .small(context, helpMessage, maxLines: 2),
                            ],
                          )
                        : const SizedBox.shrink()
              ],
            ),
            onFocusChange: (hasFocus) {
              streamController.add(hasFocus);
            },
          );
        });
  }

  Widget chatInputField(BuildContext context, String? label,
      TextEditingController? controller, FocusNode? focusNode,
      {Function(String)? onSubmit, double? height, bool? enabled}) {
    StreamController<bool> streamController = StreamController<bool>();

    return StreamBuilder<bool>(
        stream: streamController.stream,
        builder: (context, snapshot) {
          bool isFocusEnabled = snapshot.data ?? false;
          return Focus(
            child: Container(
              height: height,
              alignment: Alignment.centerLeft,
              decoration: BoxDecoration(
                  color: Theme.of(context).inputDecorationTheme.fillColor,
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
                      width: isFocusEnabled
                          ? Theme.of(context)
                              .inputDecorationTheme
                              .focusedBorder!
                              .borderSide
                              .width
                          : 0)),
              child: Padding(
                padding: EdgeInsets.symmetric(
                    vertical: Dalai.spacing.lateralPaddingValue,
                    horizontal: Dalai.spacing.lateralPaddingValue * 2),
                child: TextField(
                  onTapOutside: (event) {
                    if (focusNode != null) {
                      focusNode.unfocus();
                    }
                  },
                  onChanged: (text) {},
                  onSubmitted: (text) {
                    if (onSubmit != null) {
                      onSubmit(text)!;
                    }
                  },
                  enabled: enabled ?? true,
                  autocorrect: false,
                  keyboardType: TextInputType.text,
                  textCapitalization: TextCapitalization.sentences,
                  controller: controller,
                  focusNode: focusNode,
                  cursorColor:
                      Theme.of(context).inputDecorationTheme.focusColor,
                  textInputAction: TextInputAction.done,
                  maxLines: 1,
                  textAlign: TextAlign.start,
                  style: TextStyle(
                      fontSize: Dalai.text.regularText,
                      color: Theme.of(context).textTheme.bodyMedium!.color),
                  decoration: InputDecoration(
                    isDense: true,
                    contentPadding: EdgeInsets.only(
                        top: Dalai.spacing.lateralPaddingValue, bottom: 0),
                    filled: false,
                    focusedBorder: const OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.transparent, width: 0)),
                    enabledBorder: const OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.transparent, width: 0)),
                    disabledBorder: const OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.transparent, width: 0)),
                    alignLabelWithHint: true,
                    hintText: label,
                  ),
                ),
              ),
            ),
            onFocusChange: (hasFocus) {
              streamController.add(hasFocus);
            },
          );
        });
  }

  Widget phoneTextField(
      BuildContext context,
      String? label,
      TextEditingController? controller,
      FocusNode? focusNode,
      String initialPhonePrefix,
      Function(String) onPrefixChange,
      {bool isEnabled = true,
      Widget? trailing,
      Function()? onChange}) {
    return Dalai.input
        .textField(label, controller, focusNode ?? FocusNode(), context,
            enabled: isEnabled,
            suffixIcon: trailing ?? const SizedBox.shrink(),
            prefixIcon: CountryPicker(
              initialSelection: initialPhonePrefix,
              favorite: ['+376', '+34', '+33', '+351'],
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
