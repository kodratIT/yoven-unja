/*
* File : Cupertino Timer
* Version : 1.0.0
* */

import 'package:jambicraff/helpers/theme/app_theme.dart';
import 'package:jambicraff/helpers/widgets/my_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:lucide_icons/lucide_icons.dart';

class CupertinoTimerPickerWidget extends StatefulWidget {
  @override
  _CupertinoTimerPickerWidgetState createState() =>
      _CupertinoTimerPickerWidgetState();
}

class _CupertinoTimerPickerWidgetState
    extends State<CupertinoTimerPickerWidget> {
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
      tag: 'cupertino_timer_picker_widget',
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
              title: MyText.titleMedium("Timer", fontWeight: 600),
            ),
            body: Container(
                color: theme.colorScheme.background,
                child: CupertinoTimerPicker(
                  onTimerDurationChanged: (Duration value) {},
                  mode: CupertinoTimerPickerMode.hms,
                )));
      },
    );
  }
}
