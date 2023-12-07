/*
* File : Cupertino Action Sheet
* Version : 1.0.0
* */

import 'package:jambicraff/helpers/theme/app_theme.dart';
import 'package:jambicraff/helpers/widgets/my_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:lucide_icons/lucide_icons.dart';

class CupertinoActionSheetWidget extends StatefulWidget {
  @override
  _CupertinoActionSheetWidgetState createState() =>
      _CupertinoActionSheetWidgetState();
}

class _CupertinoActionSheetWidgetState
    extends State<CupertinoActionSheetWidget> {
  late CustomTheme customTheme;
  late ThemeData theme;

  @override
  void initState() {
    super.initState();
    customTheme = AppTheme.customTheme;
    theme = AppTheme.theme;
    WidgetsBinding.instance.addPostFrameCallback((_) => _showSheet());
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      tag: 'cupertino_action_sheet_widget',
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
              title: MyText.titleMedium("Action Sheet", fontWeight: 600),
            ),
            body: Center(
              child: CupertinoButton(
                  color: theme.colorScheme.primary,
                  onPressed: () {
                    _showSheet();
                  },
                  padding:
                      EdgeInsets.only(left: 32, top: 8, right: 32, bottom: 8),
                  pressedOpacity: 0.5,
                  child: MyText.bodyMedium("Show",
                      color: theme.colorScheme.onPrimary)),
            ));
      },
    );
  }

  _showSheet() {
    showCupertinoModalPopup(
        context: context,
        builder: (context) => CupertinoActionSheet(
              title: MyText.titleLarge("FlutKIT",
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
                child: MyText.titleMedium("Cancel",
                    color: theme.colorScheme.error, fontWeight: 600),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ));
  }
}
