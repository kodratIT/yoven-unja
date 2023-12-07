/*
* File : Cupertino Action Sheet
* Version : 1.0.0
* */

import 'package:yoven/helpers/theme/app_theme.dart';
import 'package:yoven/helpers/widgets/my_spacing.dart';
import 'package:yoven/helpers/widgets/my_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CupertinoActionSheetScreen extends StatefulWidget {
  @override
  _CupertinoActionSheetScreenState createState() =>
      _CupertinoActionSheetScreenState();
}

class _CupertinoActionSheetScreenState
    extends State<CupertinoActionSheetScreen> {
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
        body: Center(
      child: CupertinoButton(
        color: theme.colorScheme.primary,
        onPressed: () {
          _showSheet();
        },
        borderRadius: BorderRadius.all(Radius.circular(4)),
        padding: MySpacing.xy(32, 8),
        pressedOpacity: 0.5,
        child: MyText.bodyMedium("Show", color: theme.colorScheme.onPrimary),
      ),
    ));
  }

  _showSheet() {
    showCupertinoModalPopup(
        context: context,
        builder: (context) => CupertinoActionSheet(
              title: MyText.titleLarge("FlutKit",
                  fontWeight: 700, letterSpacing: 0.5),
              message: MyText.titleSmall("Select any action",
                  fontWeight: 500, letterSpacing: 0.2),
              actions: <Widget>[
                CupertinoActionSheetAction(
                  child: MyText.bodyLarge("Action 1", fontWeight: 600),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                CupertinoActionSheetAction(
                  child: MyText.bodyLarge("Action 2", fontWeight: 600),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                )
              ],
              cancelButton: CupertinoActionSheetAction(
                child: MyText.titleMedium("Cancel", fontWeight: 600),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ));
  }
}
