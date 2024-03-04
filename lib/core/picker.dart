import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:dui/common_utils/color_extension.dart';
import 'package:dui/common_utils/time_of_day_extensions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../common_utils/common_utils.dart';
import '../dui.dart';

enum CalendarMode { single, range }

class DUIPicker {
  Widget calendar(BuildContext context,
      Function(DateTime initDate, DateTime? endDate) onSelected,
      {CalendarMode calendarMode = CalendarMode.single,
      bool showToday = true,
      bool disableWeekends = false,
      List<int> disabledDays = const [],
      List<DateTime> selectedDates = const [],
      DateTime? firstDate,
      DateTime? lastDate,
      Widget? footer,
      List<DateTime> disabledDates = const []}) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(DUI.spacing.borderRadius)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          CalendarDatePicker2(
            onValueChanged: (date) {
              if (calendarMode == CalendarMode.single) {
                onSelected(date.first!, null);
              } else {
                onSelected(date.first!, date.length == 2 ? date.last! : null);
              }
            },
            config: CalendarDatePicker2Config(
              selectableDayPredicate: (date) {
                if (disableWeekends) {
                  if (Utils.isWeekend(date)) {
                    return false;
                  }
                }
                if (disabledDays.isNotEmpty) {
                  if (Utils.isExcludedDays(disabledDays, date)) {
                    return false;
                  }
                }

                return !Utils.containsDate(disabledDates, date);
              },
              centerAlignModePicker: true,
              disableModePicker: true,
              lastDate: lastDate,
              firstDate: firstDate,
              calendarViewMode: DatePickerMode.day,
              calendarType: calendarMode == CalendarMode.single
                  ? CalendarDatePicker2Type.single
                  : CalendarDatePicker2Type.range,
              customModePickerIcon: SizedBox.shrink(),
              dayBuilder: ({
                required date,
                textStyle,
                decoration,
                isSelected,
                isDisabled,
                isToday,
              }) {
                if ((isToday != null && isToday) &&
                    !(isSelected != null && isSelected)) {
                  return Container(
                    decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.circular(DUI.spacing.borderRadius),
                        border: Border.all(
                            width: 1,
                            color: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .color!
                                .withOpacity(showToday ? 0.1 : 0.0)),
                        color: Colors.transparent),
                    child: Center(
                      child: Text(
                        MaterialLocalizations.of(context)
                            .formatDecimal(date.day),
                        style: TextStyle(
                          fontFamily: Theme.of(context).textTheme.bodyMedium!.fontFamily,
                          fontWeight: DUI.text.semiBoldWeight,
                          fontSize: DUI.text.smallText,
                          color: Theme.of(context).textTheme.bodyMedium!.color,
                        ),
                      ),
                    ),
                  );
                }

                return Container(
                  decoration: decoration,
                  child: Center(
                    child: Text(
                      MaterialLocalizations.of(context).formatDecimal(date.day),
                      style: textStyle,
                    ),
                  ),
                );
              },
              controlsTextStyle: TextStyle(
                fontFamily: Theme.of(context).textTheme.bodyMedium!.fontFamily,
                fontWeight: DUI.text.semiBoldWeight,
                fontSize: DUI.text.h3,
                color: Theme.of(context).textTheme.bodyMedium!.color,
              ),
              lastMonthIcon: Icon(Icons.arrow_back_ios_new_rounded, size: 14),
              nextMonthIcon: Icon(Icons.arrow_forward_ios_rounded, size: 14),
              selectedDayHighlightColor:
                  Theme.of(context).colorScheme.secondary,
              selectedRangeHighlightColor:
                  Theme.of(context).colorScheme.secondary.withOpacity(0.05),
              selectedRangeDayTextStyle: TextStyle(
                fontFamily: Theme.of(context).textTheme.bodyMedium!.fontFamily,
                fontWeight: DUI.text.semiBoldWeight,
                fontSize: DUI.text.smallText,
                color: Theme.of(context).textTheme.bodyMedium!.color,
              ),
              firstDayOfWeek: 1,
              weekdayLabelTextStyle: TextStyle(
                fontFamily: Theme.of(context).textTheme.bodyMedium!.fontFamily,
                fontWeight: DUI.text.semiBoldWeight,
                fontSize: DUI.text.xsText,
                color: Theme.of(context).textTheme.bodyMedium!.color,
              ),
              disabledDayTextStyle: TextStyle(
                fontFamily: Theme.of(context).textTheme.bodyMedium!.fontFamily,
                fontWeight: DUI.text.semiBoldWeight,
                fontSize: DUI.text.smallText,
                color: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .color!
                    .withOpacity(0.2),
              ),
              dayTextStyle: TextStyle(
                fontFamily: Theme.of(context).textTheme.bodyMedium!.fontFamily,
                fontWeight: DUI.text.semiBoldWeight,
                fontSize: DUI.text.smallText,
                color: Theme.of(context).textTheme.bodyMedium!.color,
              ),
              yearTextStyle: TextStyle(
                fontFamily: Theme.of(context).textTheme.bodyMedium!.fontFamily,
                fontWeight: DUI.text.semiBoldWeight,
                fontSize: DUI.text.regularText,
                color: Theme.of(context).textTheme.bodyMedium!.color,
              ),
              dayBorderRadius: BorderRadius.circular(DUI.spacing.borderRadius),
              selectedDayTextStyle: TextStyle(
                  fontFamily: Theme.of(context).textTheme.bodyMedium!.fontFamily,
                  fontWeight: DUI.text.semiBoldWeight,
                  fontSize: DUI.text.regularText,
                  color: Theme.of(context)
                      .colorScheme
                      .secondary
                      .calculateLuminance()),
            ),
            value: selectedDates,
          ),
          Container(
            padding: EdgeInsets.all(DUI.spacing.lateralPaddingValue),
            child: footer ?? SizedBox.shrink(),
          )
        ],
      ),
    );
  }

  Widget textScrollPicker(BuildContext context, List<String> elements,
      Function(String value) onSelected,
      {double pickerHeight = 180}) {
    return SizedBox(
      height: pickerHeight,
      child: Row(children: [
        Expanded(
            child: CupertinoPicker(
          onSelectedItemChanged: (int value) {
            onSelected(elements[value]);
          },
          itemExtent: 48,
          children: List.generate(elements.length, (index) {
            return SizedBox(
              height: 48,
              child: Center(
                child: DUI.text.title3(context, elements[index]),
              ),
            );
          }),
        ))
      ]),
    );
  }

  Widget dateTimeScrollPicker(
      BuildContext context, List<DateTime> dates, List<TimeOfDay> times,
      {required Function(DateTime dateSelected) onDateSelected,
      required Function(TimeOfDay timeSelected) onTimeSelected,
      String todayString = 'Avui',
      String tomorrowString = 'Demà',
      double pickerHeight = 180}) {
    return SizedBox(
        height: pickerHeight,
        child: Row(children: [
          Expanded(
              child: CupertinoPicker(
            onSelectedItemChanged: (int value) {
              onDateSelected(dates[value]);
            },
            itemExtent: 48,
            children: List.generate(dates.length, (index) {
              return SizedBox(
                height: 48,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Utils.isToday(dates[index])
                          ? DUI.text.xs(context, todayString,
                              color: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .color!
                                  .withOpacity(0.7))
                          : Utils.isTomorrow(dates[index])
                              ? DUI.text.xs(context, tomorrowString,
                                  color: Theme.of(context)
                                      .textTheme
                                      .bodyMedium!
                                      .color!
                                      .withOpacity(0.7))
                              : SizedBox.shrink(),
                      DUI.text.title3(context, Utils.formatDate(dates[index]))
                    ],
                  ),
                ),
              );
            }),
          )),
          DUI.spacing.hSpacer(),
          Expanded(
              child: CupertinoPicker(
            onSelectedItemChanged: (int value) {
              onTimeSelected(times[value]);
            },
            itemExtent: 48,
            children: List.generate(times.length, (index) {
              return SizedBox(
                height: 48,
                child: Center(
                  child: DUI.text
                      .title3(context, '${times[index].format(context)} h'),
                ),
              );
            }),
          ))
        ]));
  }

  Widget dateScrollPicker(BuildContext context, List<DateTime> dates,
      {required Function(DateTime dateSelected) onDateSelected,
      String todayString = 'Avui',
      String tomorrowString = 'Demà',
      double pickerHeight = 180}) {
    return SizedBox(
        height: pickerHeight,
        child: Row(children: [
          Expanded(
              child: CupertinoPicker(
            onSelectedItemChanged: (int value) {
              onDateSelected(dates[value]);
            },
            itemExtent: 48,
            children: List.generate(dates.length, (index) {
              return SizedBox(
                height: 48,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Utils.isToday(dates[index])
                          ? DUI.text.xs(context, todayString,
                              color: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .color!
                                  .withOpacity(0.7))
                          : Utils.isTomorrow(dates[index])
                              ? DUI.text.xs(context, tomorrowString,
                                  color: Theme.of(context)
                                      .textTheme
                                      .bodyMedium!
                                      .color!
                                      .withOpacity(0.7))
                              : SizedBox.shrink(),
                      DUI.text.title3(context, Utils.formatDate(dates[index]))
                    ],
                  ),
                ),
              );
            }),
          )),
        ]));
  }

  Widget timeScrollPicker(BuildContext context, List<TimeOfDay> times,
      {required Function(TimeOfDay timeSelected) onTimeSelected,
      double pickerHeight = 180}) {
    return SizedBox(
        height: pickerHeight,
        child: Row(children: [
          Expanded(
              child: CupertinoPicker(
            onSelectedItemChanged: (int value) {
              onTimeSelected(times[value]);
            },
            itemExtent: 48,
            children: List.generate(times.length, (index) {
              return SizedBox(
                height: 48,
                child: Center(
                  child: DUI.text
                      .title3(context, '${times[index].format(context)} h'),
                ),
              );
            }),
          ))
        ]));
  }

  Widget timeRangeScrollPicker(BuildContext context, List<TimeOfDay> times,
      {Duration timeRange = const Duration(minutes: 60),
      required Function(TimeOfDay timeSelected) onTimeSelected,
      double pickerHeight = 180}) {
    return SizedBox(
        height: pickerHeight,
        child: Row(children: [
          Expanded(
              child: CupertinoPicker(
            onSelectedItemChanged: (int value) {
              onTimeSelected(times[value]);
            },
            itemExtent: 48,
            children: List.generate(times.length, (index) {
              var secondRange = times[index].plusMinutes(timeRange.inMinutes);
              return SizedBox(
                height: 48,
                child: Center(
                  child: DUI.text.title3(context,
                      '${times[index].format(context)} - ${secondRange.format(context)} h'),
                ),
              );
            }),
          ))
        ]));
  }
}
