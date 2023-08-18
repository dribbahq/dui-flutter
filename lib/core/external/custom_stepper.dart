import 'package:cityxerpa_icons/cityxerpa_symbols.dart';
import 'package:flutter/material.dart';

import '../../common_utils/common_utils.dart';
import '../../dalai.dart';

class CustomStepper extends StatefulWidget {
  final void Function(int value, bool underLowerLimit, bool overUpperLimit) onChange;
  int initialValue = 0;
  int? upperLimit;
  int? lowerLimit;
  String? appendString;
  String? customText;
  bool loading;

  CustomStepper({Key? key,
    required this.onChange,
    required this.initialValue,
    this.upperLimit,
    this.lowerLimit,
    this.loading = false,
    this.customText,
    this.appendString})
      : super(key: key);

  @override
  State<CustomStepper> createState() => _CustomStepperState();
}

class _CustomStepperState extends State<CustomStepper> {
  var currentValue = 0;

  late int _upperLimit;
  late int _lowerLimit;

  @override
  void initState() {
    currentValue = widget.initialValue;
    _upperLimit = widget.upperLimit ?? 10000;
    _lowerLimit = widget.lowerLimit ?? 0;
    super.initState();
  }

  plus() {
    if (widget.loading) {
      return;
    }
    setState(() {
      if (currentValue < _upperLimit) {
        Utils.vibrateOnTap();
        currentValue = currentValue + 1;
        widget.onChange(currentValue, currentValue == _lowerLimit, false);
      } else {
        Utils.vibrateOnErrorTap();
        currentValue = _upperLimit;
        widget.onChange(currentValue, currentValue == _lowerLimit, true); //upper limit flag is true only when trying to surpass it, not when reached
      }
    });
  }

  minus() {
    if (widget.loading) {
      return;
    }
    setState(() {
      if (currentValue > _lowerLimit) {
        Utils.vibrateOnTap();
        currentValue = currentValue - 1;
        widget.onChange(currentValue, false, currentValue == _upperLimit);
      } else {
        Utils.vibrateOnErrorTap();
        currentValue = _lowerLimit;
        widget.onChange(currentValue, true, currentValue == _upperLimit); //lower limit flag is true only when trying to surpass it, not when reached
      }
    });
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
                      _lowerLimit ? 0.3 : 1.0,
                  child: Dalai.icon.dalaiIcons(context, CXIcon.minus),
                ),
              )),
          Dalai.spacing.hSpacer(small: true),
          Container(
            constraints: const BoxConstraints(maxWidth: 140, minWidth: 50),
            child: widget.loading
                ? Dalai.misc.loadingAnimation(context)
                : Dalai.text.title2(
                context, widget.customText ?? '$currentValue${widget.appendString ?? ''}',
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
                      _upperLimit ? 0.3 : 1.0,
                  child: Dalai.icon.dalaiIcons(context, CXIcon.plus),
                ),
              )),
          Dalai.spacing.hSpacer(small: true)
        ],
      ),
    );
  }
}
