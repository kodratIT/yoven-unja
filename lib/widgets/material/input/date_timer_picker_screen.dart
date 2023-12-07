/*
* File : Date Picker
* Version : 1.0.0
* */

import 'package:jambicraff/helpers/theme/app_theme.dart';
import 'package:jambicraff/helpers/widgets/my_button.dart';
import 'package:jambicraff/helpers/widgets/my_spacing.dart';
import 'package:jambicraff/helpers/widgets/my_text.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';

class DateTimePickerScreen extends StatefulWidget {
  @override
  _DateTimePickerScreenState createState() => _DateTimePickerScreenState();
}

class _DateTimePickerScreenState extends State<DateTimePickerScreen> {
  DateTime? selectedDate;
  TimeOfDay? selectedTime;

  late ThemeData theme;
  late CustomTheme customTheme;

  @override
  void initState() {
    super.initState();
    selectedDate = DateTime.now();
    selectedTime = TimeOfDay.now();
    theme = AppTheme.theme;
    customTheme = AppTheme.customTheme;
  }

  _pickDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate!,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        showSnackBarWithFloating(
            "${picked.day} - ${picked.month} - ${picked.year}");
      });
    }
  }

  _pickTime12(BuildContext context) async {
    TimeOfDay? t =
        await showTimePicker(context: context, initialTime: selectedTime!);
    if (t != null) {
      setState(() {
        selectedTime = t;
      });
    }

    showSnackBarWithFloating(selectedTime!.format(context));
  }

  _pickTime24(BuildContext context) async {
    TimeOfDay? t = await showTimePicker(
        builder: (BuildContext context, Widget? child) {
          return MediaQuery(
            data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: true),
            child: child!,
          );
        },
        context: context,
        initialTime: selectedTime!);
    if (t != null) {
      setState(() {
        selectedTime = t;
        String time = "";
        if (t.hour < 10) {
          time = "${time}0${t.hour}";
        } else {
          time = time + t.hour.toString();
        }
        time = "$time : ";
        if (t.minute < 10) {
          time = "${time}0${t.minute}";
        } else {
          time = time + t.minute.toString();
        }
        showSnackBarWithFloating(time);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: MyButton(
            elevation: 0,
            borderRadiusAll: 4,
            onPressed: () {
              _pickDate(context);
            },
            padding: MySpacing.xy(18, 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Icon(
                  LucideIcons.calendar,
                  color: theme.colorScheme.onPrimary,
                  size: 22,
                ),
                MySpacing.width(8),
                MyText.bodyMedium("Select Date",
                    fontWeight: 600,
                    color: theme.colorScheme.onPrimary,
                    letterSpacing: 0.3),
              ],
            ),
          ),
        ),
        MySpacing.height(24),
        Center(
          child: MyButton(
            elevation: 0,
            borderRadiusAll: 4,
            onPressed: () {
              _pickTime12(context);
            },
            padding: MySpacing.xy(18, 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Icon(
                  LucideIcons.clock,
                  color: theme.colorScheme.onPrimary,
                  size: 22,
                ),
                MySpacing.width(8),
                MyText.bodyMedium("12 HOUR",
                    fontWeight: 600,
                    letterSpacing: 0.4,
                    color: theme.colorScheme.onPrimary),
              ],
            ),
          ),
        ),
        MySpacing.height(24),
        MyButton(
          elevation: 0,
          borderRadiusAll: 4,
          onPressed: () {
            _pickTime24(context);
          }, padding: MySpacing.xy(18, 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Icon(
                LucideIcons.clock,
                color: theme.colorScheme.onPrimary,
                size: 22,
              ),
              MySpacing.width(8),
              MyText.bodyMedium("24 HOUR",
                  fontWeight: 600,
                  letterSpacing: 0.4,
                  color: theme.colorScheme.onPrimary),
            ],
          ),
        ),
      ],
    ));
  }

  void showSnackBarWithFloating(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
          style: theme.textTheme.titleSmall!
              .merge(TextStyle(color: theme.colorScheme.onPrimary)),
        ),
        backgroundColor: theme.colorScheme.primary,
        behavior: SnackBarBehavior.floating,
      ),
    );
  }
}
