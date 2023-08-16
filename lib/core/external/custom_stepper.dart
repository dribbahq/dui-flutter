import 'package:cityxerpa_icons/cityxerpa_symbols.dart';
import 'package:flutter/material.dart';

import '../../common_utils/common_utils.dart';
import '../../dalai.dart';

class CustomStepper extends StatefulWidget {
  final void Function(int value) onChange;
  int initialValue = 0;
  int upperLimit = 100000000;
  int lowerLimit = 0;
  String? appendString;
  bool loading;

  CustomStepper({Key? key,
    required this.onChange,
    required this.initialValue,
    this.upperLimit = 100000000,
    this.lowerLimit = 0,
    this.loading = false,
    this.appendString})
      : super(key: key);

  @override
  State<CustomStepper> createState() => _CustomStepperState();
}

class _CustomStepperState extends State<CustomStepper> {
  var currentValue = 0;

  @override
  void initState() {
    currentValue = widget.initialValue;
    super.initState();
  }

  plus() {
    if (widget.loading) {
      return;
    }
    setState(() {
      if (currentValue < widget.upperLimit) {
        Utils.vibrateOnTap();
        currentValue = currentValue + 1;
      } else {
        Utils.vibrateOnErrorTap();
        currentValue = widget.upperLimit;
      }
    });
    widget.onChange(currentValue);
  }

  minus() {
    if (widget.loading) {
      return;
    }
    setState(() {
      if (currentValue > widget.lowerLimit) {
        Utils.vibrateOnTap();
        currentValue = currentValue - 1;
      } else {
        Utils.vibrateOnErrorTap();
        currentValue = widget.lowerLimit;
      }
    });
    widget.onChange(currentValue);
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      constraints: const BoxConstraints(maxWidth: 180, minWidth: 90),
      height: 36,
      duration: const Duration(milliseconds: 200),
      curve: Curves.easeInOutSine,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: Theme.of(context).textTheme.bodyMedium!.color!.withOpacity(0.1)),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Dalai.spacing.hSpacer(small: true),
          GestureDetector(
              onTap: minus,
              child: Container(
                height: 28,
                width: 32,
                padding: EdgeInsets.symmetric(vertical: 2),
                decoration: BoxDecoration(
                    borderRadius:
                    BorderRadius.circular(Dalai.spacing.largeBorderRadius)),
                child: Opacity(
                  opacity: widget.loading ? 0.1 : currentValue ==
                      widget.lowerLimit ? 0.3 : 1.0,
                  child: Dalai.icon.dalaiIcons(context, CXIcon.minus),
                ),
              )),
          Dalai.spacing.hSpacer(small: true),
          Container(
            constraints: const BoxConstraints(maxWidth: 140, minWidth: 50),
            child: widget.loading
                ? Dalai.misc.loadingAnimation(context)
                : Dalai.text.title2(
                context, '$currentValue${widget.appendString ?? ''}',
                textAlign: TextAlign.center, maxLines: 1),
          ),
          Dalai.spacing.hSpacer(small: true),
          GestureDetector(
              onTap: plus,
              child: Container(
                height: 28,
                width: 32,
                padding: EdgeInsets.symmetric(vertical: 2),
                decoration: BoxDecoration(
                    borderRadius:
                    BorderRadius.circular(Dalai.spacing.largeBorderRadius)),
                child: Opacity(
                  opacity: widget.loading ? 0.1 : currentValue ==
                      widget.upperLimit ? 0.3 : 1.0,
                  child: Dalai.icon.dalaiIcons(context, CXIcon.plus),
                ),
              )),
          Dalai.spacing.hSpacer(small: true)
        ],
      ),
    );
  }
}
