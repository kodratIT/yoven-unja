/*
* File : Date Picker
* Version : 1.0.0
* */

import 'package:jambicraff/helpers/theme/app_theme.dart';
import 'package:jambicraff/helpers/widgets/my_button.dart';
import 'package:jambicraff/helpers/widgets/my_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:lucide_icons/lucide_icons.dart';

class DatePickerWidget extends StatefulWidget {
  @override
  _DatePickerWidgetState createState() => _DatePickerWidgetState();
}

class _DatePickerWidgetState extends State<DatePickerWidget> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey =
      GlobalKey<ScaffoldMessengerState>();

  DateTime? selectedDate;
  late CustomTheme customTheme;
  late ThemeData theme;

  @override
  void initState() {
    super.initState();
    customTheme = AppTheme.customTheme;
    theme = AppTheme.theme;
    selectedDate = DateTime.now();
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
        showSnackbarWithFloating(
            "${picked.day} - ${picked.month} - ${picked.year}");
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      tag: 'date_picker_widget',
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
              title: MyText.titleMedium("Date Picker", fontWeight: 600),
            ),
            body: Container(
                color: theme.colorScheme.background,
                child: Center(
                  child: MyButton(
                    onPressed: () {
                      _pickDate(context);
                    },
                    elevation: 2,
                    borderRadiusAll: 4,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Icon(
                          LucideIcons.calendar,
                          color: theme.colorScheme.onPrimary,
                          size: 22,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: MyText.titleSmall("Select Date",
                              fontWeight: 600,
                              color: theme.colorScheme.onPrimary,
                              letterSpacing: 0.3),
                        ),
                      ],
                    ),
                  ),
                )));
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
