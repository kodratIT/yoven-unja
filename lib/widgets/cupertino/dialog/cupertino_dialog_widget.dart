/*
* File : Cupertino Dialog
* Version : 1.0.0
* */

import 'package:yoven/helpers/theme/app_theme.dart';
import 'package:yoven/helpers/widgets/my_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:lucide_icons/lucide_icons.dart';

class CupertinoDialogWidget extends StatefulWidget {
  @override
  _CupertinoDialogWidgetState createState() => _CupertinoDialogWidgetState();
}

class _CupertinoDialogWidgetState extends State<CupertinoDialogWidget> {
  late CustomTheme customTheme;
  late ThemeData theme;

  @override
  void initState() {
    super.initState();
    customTheme = AppTheme.customTheme;
    theme = AppTheme.theme;
    WidgetsBinding.instance.addPostFrameCallback((_) => _showDialog());
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      tag: 'cupertino_dialog_widget',
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
              title: MyText.titleMedium("Dialog", fontWeight: 600),
            ),
            body: Container(
                color: theme.colorScheme.background,
                child: Center(
                  child: CupertinoButton(
                      color: theme.colorScheme.primary,
                      onPressed: () {
                        _showDialog();
                      },
                      padding: EdgeInsets.only(
                          left: 32, top: 8, right: 32, bottom: 8),
                      pressedOpacity: 0.5,
                      child: MyText.bodyMedium("Show",
                          color: theme.colorScheme.onPrimary)),
                )));
      },
    );
  }

  _showDialog() {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return CupertinoAlertDialog(
          title: MyText.titleMedium('Cupertino Simple Dialog', fontWeight: 600),
          content: Container(
            margin: EdgeInsets.only(top: 16),
            child: MyText.bodyLarge(
                'Lorem ipsum is a pseudo-Latin text used in web design, ',
                fontWeight: 400),
          ),
          actions: <Widget>[
            CupertinoDialogAction(
              child: MyText.titleMedium('OK',
                  color: theme.colorScheme.primary,
                  fontWeight: 700,
                  letterSpacing: 0.3),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
