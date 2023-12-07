/*
* File : Cupertino Timer
* Version : 1.0.0
* */

import 'package:jambicraff/helpers/theme/app_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CupertinoTimerPickerScreen extends StatefulWidget {
  @override
  _CupertinoTimerPickerScreenState createState() =>
      _CupertinoTimerPickerScreenState();
}

class _CupertinoTimerPickerScreenState
    extends State<CupertinoTimerPickerScreen> {
  late ThemeData theme;
  late CustomTheme customTheme;

  @override
  void initState() {
    super.initState();
    theme = AppTheme.theme;
    customTheme = AppTheme.customTheme;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CupertinoTimerPicker(
      onTimerDurationChanged: (Duration value) {},
      mode: CupertinoTimerPickerMode.hms,
    ));
  }
}
