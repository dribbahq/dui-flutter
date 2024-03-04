import 'package:flutter/cupertino.dart';

import '../../dui.dart';

class TimePicker extends StatefulWidget {
  final String? title;
  final String? subtitle;
  final String? buttonText;
  final String? dismissText;
  final Function(dynamic value)? onDone;
  final Function? onCancel;
  final List<DateTime?>? scheduleList;

  const TimePicker({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.buttonText,
    required this.dismissText,
    required this.onDone,
    required this.onCancel,
    required this.scheduleList,
  }) : super(key: key);

  @override
  State<TimePicker> createState() => _TimePickerState();

}

class _TimePickerState extends State<TimePicker> {
  @override
  void initState() {
    super.initState();
    setupHours();
  }

  setupHours() {
    // timePicker.value = hours;
    // selectedTimeShift = hours.first;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        DUI.spacing.spacer(multiplier: 1),
        widget.title != null
            ? DUI.text.small(context, widget.title, bold: true)
            : SizedBox.shrink(),
        widget.subtitle != null
            ? DUI.spacing.spacer(small: true)
            : SizedBox.shrink(),
        // widget.subtitle != null
        //     ? DUI.text.title2(
        //         context,
        //         DateFormat('EEEE, dd MMMM y',
        //                 LanguageManager.getCurrentLanguage())
        //             .format(widget.schedule!.dayDate))
        //     : SizedBox.shrink(),
        DUI.spacing.spacer(),
        DUI.spacing.divider(context),
        // Container(
        //   height: 200,
        //   child: Obx(() {
        //     return Row(children: [
        //       Expanded(
        //           child: CupertinoPicker(
        //         onSelectedItemChanged: (int value) {
        //           selectedTimeShift = timePicker.value[value];
        //         },
        //         itemExtent: 48,
        //         children: List.generate(timePicker.value.length, (index) {
        //           return Container(
        //             height: 48,
        //             child: Center(
        //               child: DUI.text.title1(context,
        //                   '${timePicker.value[index].getText(context)}'),
        //             ),
        //           );
        //         }),
        //       ))
        //     ]);
        //   }),
        // ),
        DUI.spacing.spacer(),
        Row(
          children: [
            widget.dismissText == null ? const SizedBox.shrink() : Expanded(
              flex: 1,
              child: SizedBox(
                width: double.infinity,
                child:
                    DUI.button.noBgButton(context, widget.dismissText!, () {
                  if (widget.onCancel != null) {
                    widget.onCancel!();
                  }
                  Navigator.pop(context);
                }),
              ),
            ),
            DUI.spacing.hSpacer(),
            widget.buttonText == null ? const SizedBox.shrink() : Expanded(
              flex: 2,
              child: SizedBox(
                width: double.infinity,
                child: DUI.button.button(context, widget.buttonText!, () {
                  if (widget.onDone != null) {
                    widget.onDone!(""); // TODO
                  }
                  Navigator.pop(context);
                }),
              ),
            )
          ],
        )
      ],
    );
  }
}
