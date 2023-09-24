import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:yeye/Constants/app_colors.dart';
import 'package:yeye/Constants/app_texts.dart';

final DateTime currentTime = DateTime.now();
final DateTime transactionTime = currentTime;
final DateTime endOfMonth = (currentTime.month < 12)
    ? DateTime(currentTime.year, currentTime.month + 1, 0)
    : DateTime(currentTime.year + 1, 1, 0);

String formattedCurrentDate =
    DateFormat(AppTexts.dateFormat).format(transactionTime).toString();
String commentDate =
    DateFormat(AppTexts.dateFormat).format(transactionTime).toString();
String currentDate =
    DateFormat(AppTexts.dateFormat).format(transactionTime).toString();
String collectionDateForCurrentTime =
    DateFormat(AppTexts.colFormat).format(transactionTime).toString();
String collectionDateForAll = formattedCurrentDate.substring(3, 10);

var outputFormat = DateFormat('HH.mm');
var transactionTimeHourMinute =
    double.parse(outputFormat.format(transactionTime));
double startTimeComparison = 11.30;
double endTimeComparison = 13.30;
int weekendDay = 0;

bool? isFoodVisible = false;
bool? isRatingVisible = true;

Future<DateTime?> selectDate(BuildContext context, DateTime lastDate) {
  return showDatePicker(
      context: context,
      currentDate: transactionTime,
      initialDate: transactionTime,
      selectableDayPredicate: (day) {
        if (day.weekday == DateTime.saturday ||
            day.weekday == DateTime.sunday) {
          return currentTime.day == day.day &&
              currentTime.month == day.month &&
              currentTime.year == day.year;
        } else {
          return true;
        }
      },
      builder: (context, child) {
        return Theme(
          data: ThemeData.light().copyWith(
            colorScheme: const ColorScheme.light(
              primary: AppColors.themeBlueColor,
              onPrimary: Colors.white,
              surface: Colors.white,
              onSurface: Colors.black,
            ),
            dialogBackgroundColor: Colors.white,
          ),
          child: child!,
        );
      },
      cancelText: AppTexts.cancel,
      confirmText: AppTexts.confirm,
      initialEntryMode: DatePickerEntryMode.calendarOnly,
      firstDate: DateTime(2023, 09, 18),
      lastDate: lastDate);
}

bool isWeekend(DateTime date) {
  final day = date.weekday;
  return day == DateTime.saturday || day == DateTime.sunday;
}

bool isBetweenTimes() {
  if (transactionTimeHourMinute >= startTimeComparison &&
      transactionTimeHourMinute <= endTimeComparison) {
    return true;
  } else {
    return false;
  }
}
