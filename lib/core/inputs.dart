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
    BuildContext context, {
    FocusNode? focusNode,
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
    FocusNode focus = focusNode ?? FocusNode();

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
                          width: Dalai.spacing.borderWidth)),
                  child: Padding(
                    padding: EdgeInsets.only(
                        top: Dalai.spacing.lateralPaddingValue + 2,
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
                              focus.unfocus();
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
                              focus.unfocus();
                            },
                            inputFormatters: inputFormatters,
                            autocorrect: false,
                            keyboardType: keyboardType ?? TextInputType.text,
                            textCapitalization: textCapitalization ??
                                TextCapitalization.sentences,
                            autofocus: false,
                            controller: controller,
                            focusNode: focus,
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

  Widget smallTextField(
    TextEditingController? controller,
    BuildContext context, {
    bool? enabled,
    TextInputType? keyboardType,
    TextCapitalization? textCapitalization,
    bool? obscure,
    TextInputAction? textInputAction,
    FocusNode? focusNode,
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
    FocusNode focus = focusNode ?? FocusNode();

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
                              focus.unfocus();
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
                              focus.unfocus();
                            },
                            inputFormatters: inputFormatters,
                            autocorrect: false,
                            keyboardType: keyboardType ?? TextInputType.text,
                            textCapitalization: textCapitalization ??
                                TextCapitalization.sentences,
                            autofocus: false,
                            controller: controller,
                            focusNode: focus,
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
    BuildContext context, {
    FocusNode? focusNode,
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
    int? minLines,
    List<TextInputFormatter>? inputFormatters,
    bool loading = false,
    bool enabled = true,
  }) {
    StreamController<bool> streamController = StreamController<bool>();
    FocusNode focus = focusNode ?? FocusNode();

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
                          color: isFocusEnabled
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
                        top: Dalai.spacing.lateralPaddingValue + 2,
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
                              focus.unfocus();
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
                              focus.unfocus();
                            },
                            inputFormatters: inputFormatters,
                            autocorrect: false,
                            keyboardType: keyboardType ?? TextInputType.text,
                            textCapitalization: textCapitalization ??
                                TextCapitalization.sentences,
                            autofocus: false,
                            controller: controller,
                            focusNode: focus,
                            enabled: enabled ?? true,
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
                            ? Dalai.misc.loadingAnimation(context, size: 16)
                            : SizedBox.shrink(),
                        loading
                            ? Dalai.spacing.hSpacer(small: true)
                            : SizedBox.shrink(),
                        // enabled && controller!.text.isNotEmpty
                        //     ? GestureDetector(
                        //         child: Dalai.icon.dalaiIcons(
                        //           context,
                        //           CXIcon.xmark_circle,
                        //           size: CXIconSize.small,
                        //           mainColor: colorText,
                        //         ),
                        //         onTap: () {
                        //           controller!.clear();
                        //           focus.unfocus();
                        //           if (onChange != null) {
                        //             onChange();
                        //           }
                        //           if (onSubmit != null) {
                        //             onSubmit('');
                        //           }
                        //         },
                        //       )
                        //     : SizedBox.shrink(),
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

  Widget chatInputField(
      BuildContext context, String? label, TextEditingController? controller,
      {FocusNode? focusNode,
      Function(String)? onSubmit,
      double? height,
      bool? enabled}) {
    return Dalai.input.smallTextField(controller, context,
        hint: label,
        focusNode: focusNode,
        onSubmit: onSubmit,
        enabled: enabled, maxLines: 3, minLines: 1);
  }

  Widget phoneTextField(
      BuildContext context,
      String? label,
      TextEditingController? controller,
      String initialPhonePrefix,
      Function(String) onPrefixChange,
      {bool isEnabled = true,
      FocusNode? focusNode,
      Widget? trailing,
      Function()? onChange}) {
    return Dalai.input.textField(label, controller, context,
        enabled: isEnabled,
        focusNode: focusNode,
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
