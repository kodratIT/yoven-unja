/*
* File : Time Picker
* Version : 1.0.0
* */

import 'package:jambicraff/helpers/theme/app_theme.dart';
import 'package:jambicraff/helpers/widgets/my_button.dart';
import 'package:jambicraff/helpers/widgets/my_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:lucide_icons/lucide_icons.dart';

class TimePickerWidget extends StatefulWidget {
  @override
  _TimePickerWidgetState createState() => _TimePickerWidgetState();
}

class _TimePickerWidgetState extends State<TimePickerWidget> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey =
      GlobalKey<ScaffoldMessengerState>();

  late TimeOfDay selectedTime;

  _pickTime12(BuildContext context) async {
    TimeOfDay? t =
        await showTimePicker(context: context, initialTime: selectedTime);
    if (t != null) {
      setState(() {
        selectedTime = t;
        showSnackbarWithFloating(t.format(context));
      });
    }
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
        initialTime: selectedTime);
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
        showSnackbarWithFloating(time);
      });
    }
  }

  late CustomTheme customTheme;
  late ThemeData theme;

  @override
  void initState() {
    super.initState();
    selectedTime = TimeOfDay.now();

    customTheme = AppTheme.customTheme;
    theme = AppTheme.theme;
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      tag: 'time_picker_widget',
      builder: (controller) {
        return Scaffold(
            key: _scaffoldKey,
            appBar: AppBar(
              elevation: 0,
              leading: InkWell(
                onTap: () => Navigator.of(context).pop(),
                child: Icon(
                  LucideIcons.chevronLeft,
                  size: 20,
                ),
              ),
              title: MyText.titleMedium("Time Picker", fontWeight: 600),
            ),
            body: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  MyButton(
                    elevation: 2,
                    borderRadiusAll: 4,
                    onPressed: () {
                      _pickTime12(context);
                    },
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Icon(
                          LucideIcons.clock,
                          color: theme.colorScheme.onPrimary,
                          size: 22,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: MyText.bodyMedium("12 HOUR",
                              fontWeight: 600,
                              letterSpacing: 0.4,
                              color: theme.colorScheme.onPrimary),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 8),
                    child: MyButton(
                      elevation: 2,
                      borderRadiusAll: 4,
                      onPressed: () {
                        _pickTime24(context);
                      },
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Icon(
                            LucideIcons.clock,
                            color: theme.colorScheme.onPrimary,
                            size: 22,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: MyText.bodyMedium("24 HOUR",
                                fontWeight: 600,
                                letterSpacing: 0.4,
                                color: theme.colorScheme.onPrimary),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ));
      },
    );
  }

  void showSnackbarWithFloating(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: MyText.titleSmall(message, color: theme.colorScheme.onPrimary),
        backgroundColor: theme.colorScheme.primary,
        behavior: SnackBarBehavior.floating,
      ),
    );
  }
}
