import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

final DateTime today = DateTime.now();
final DateTime oneYearAgo = today.subtract(const Duration(days: 365));
final DateTime oneYearAhead = today.add(const Duration(days: 365));

Future<DateTime?> showPlatformDatePicker(BuildContext context) async {
  final ThemeData theme = Theme.of(context);
  switch (theme.platform) {
    case TargetPlatform.iOS:
    case TargetPlatform.macOS:
      final result = await showCupertinoDatePicker(context);
      return result;
    default:
      return showMaterialDatePicker(context);
  }
}

Future<DateTime?> showMaterialDatePicker(BuildContext context) async {
  return await showDatePicker(
    context: context,
    initialEntryMode: DatePickerEntryMode.calendar,
    firstDate: oneYearAgo,
    initialDate: DateTime.now(),
    lastDate: oneYearAhead,
    builder: (context, child) {
      return Theme(
        data: ThemeData(),
        child: child!,
      );
    },
  );
}

Future<DateTime?> showCupertinoDatePicker(BuildContext context) async {
  DateTime? pickedDate;
  await showModalBottomSheet(
    context: context,
    builder: (BuildContext builder) {
      return Container(
        height: MediaQuery.of(context).copyWith().size.height / 3,
        color: Colors.white,
        child: CupertinoDatePicker(
          mode: CupertinoDatePickerMode.date,
          onDateTimeChanged: (picked) => pickedDate = picked,
          initialDateTime: DateTime.now(),
        ),
      );
    },
  );

  return pickedDate;
}
