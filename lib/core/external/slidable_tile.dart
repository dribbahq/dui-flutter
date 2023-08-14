import 'dart:io';
import 'package:cityxerpa_icons/cityxerpa_symbols.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import '../../dalai.dart';

enum CCBrand { visa, mastercard, amex, discover, other }

class SlidableTile extends StatefulWidget {
  final String title;
  final String? subtitle;
  final String? highlightText;
  final CCBrand? ccBrand;

  final Function? tapped;
  final Function? onRemove;
  final bool? autoDone;

  SlidableTile({Key? key,
    required this.title,
    this.subtitle,
    this.highlightText,
    this.tapped,
    this.onRemove,
    this.ccBrand,
    this.autoDone})
      : super(key: key);

  _SlidableTileState createState() => _SlidableTileState();
}

class _SlidableTileState extends State<SlidableTile> {
  CXIcon getCardIcon() {
    if (widget.ccBrand == null) {
      return CXIcon.creditcard;
    } else if (widget.ccBrand == CCBrand.visa) {
      return CXIcon.visa;
    } else if (widget.ccBrand == CCBrand.mastercard) {
      return CXIcon.mastercard;
    } else {
      return CXIcon.creditcard;
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget item = InkWell(
        onTap: widget.tapped as void Function()?,
        onLongPress:
        Platform.isAndroid ? widget.onRemove as void Function()? : null,
        child: Container(
          color: Theme
              .of(context)
              .colorScheme
              .background,
          child: Column(
            children: <Widget>[
              IntrinsicHeight(
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Dalai.spacing.hSpacer(),
                            Dalai.icon.dalaiIcons(
                                context, getCardIcon(),
                                size: CXIconSize.regular),
                            Dalai.spacing.hSpacer(),
                            Expanded(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Dalai.text.regular(context, widget.title,
                                        bold: true,
                                        highlightText: widget.highlightText),
                                    Dalai.text.small(context, widget.subtitle),
                                  ],)
                            ),
                            Dalai.spacing.hSpacer(),
                            widget.tapped != null && widget.autoDone!
                                ? Dalai.icon.dalaiIcons(
                                context, CXIcon.chevron_right,
                                size: CXIconSize.x_small,
                                mainColor: Theme
                                    .of(context)
                                    .textTheme
                                    .bodySmall!
                                    .color)
                                : Container(),
                            Dalai.spacing.hSpacer(),
                          ],
                        ),
                      ),
                    ),
                    // Container(
                    //   width: 3,
                    //   decoration: BoxDecoration(
                    //       color: widget.cardReference!.isDefault!
                    //           ? Theme.of(context).colorScheme.primary
                    //           : Colors.transparent,
                    //       borderRadius: BorderRadius.only(
                    //           topLeft: Radius.circular(Dalai.spacing.borderRadius),
                    //           bottomLeft:
                    //           Radius.circular(Dalai.spacing.borderRadius))),
                    // ),
                  ],
                ),
              ),
              Dalai.spacing.divider(
                context,
              ),
            ],
          ),
        ));

    return Platform.isAndroid || widget.onRemove == null
        ? item
        : Slidable(
      child: item,
      endActionPane: ActionPane(
        motion: const DrawerMotion(),
        extentRatio: 0.16,
        children: [
          SlidableAction(
              label: 'Remover',
              backgroundColor: Dalai.color.error,
              onPressed: (context) {
                if (widget.onRemove != null) {
                  widget.onRemove!();
                }
              }),
        ],
      ),
    );
  }
}

class SlidableAction extends StatelessWidget {
  const SlidableAction({
    Key? key,
    this.flex = 1,
    this.backgroundColor = Colors.white,
    this.foregroundColor,
    this.autoClose = true,
    required this.onPressed,
    this.spacing = 4,
    this.label,
    this.borderRadius = BorderRadius.zero,
    this.padding,
  }) :
        super(key: key);

  final int flex;

  /// {@macro slidable.actions.backgroundColor}
  final Color backgroundColor;

  /// {@macro slidable.actions.foregroundColor}
  final Color? foregroundColor;

  /// {@macro slidable.actions.autoClose}
  final bool autoClose;

  /// {@macro slidable.actions.onPressed}
  final SlidableActionCallback? onPressed;
  final double spacing;

  final String? label;

  final BorderRadius borderRadius;

  final EdgeInsets? padding;

  @override
  Widget build(BuildContext context) {
    final children = <Widget>[];

    children.add(
        Dalai.icon.dalaiIcons(context, CXIcon.trash, mainColor: Colors.white)
    );

    final child = children.length == 1
        ? children.first
        : Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ...children.map(
              (child) =>
              Flexible(
                child: child,
              ),
        )
      ],
    );

    return CustomSlidableAction(
      borderRadius: BorderRadius.circular(Dalai.spacing.smallBorderRadius),
      padding: EdgeInsets.all(6),
      onPressed: onPressed,
      autoClose: autoClose,
      backgroundColor: backgroundColor,
      foregroundColor: foregroundColor,
      flex: flex,
      child: child,
    );
  }
}
