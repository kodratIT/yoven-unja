/*
* File : Cupertino Time Picker
* Version : 1.0.0
* */

import 'package:jambicraff/helpers/theme/app_theme.dart';
import 'package:jambicraff/helpers/widgets/my_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lucide_icons/lucide_icons.dart';

class CupertinoTimePickerWidget extends StatefulWidget {
  @override
  _CupertinoTimePickerWidgetState createState() =>
      _CupertinoTimePickerWidgetState();
}

class _CupertinoTimePickerWidgetState extends State<CupertinoTimePickerWidget> {
  late CustomTheme customTheme;
  late ThemeData theme;

  @override
  void initState() {
    super.initState();
    customTheme = AppTheme.customTheme;
    theme = AppTheme.theme;
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      tag: 'cupertino_time_picker_widget',
      builder: (controller) {
        return Scaffold(
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
            body: Container(
                color: theme.colorScheme.background,
                child: CupertinoDatePicker(
                    mode: CupertinoDatePickerMode.time,
                    onDateTimeChanged: (dateTime) {})));
      },
    );
  }
}
