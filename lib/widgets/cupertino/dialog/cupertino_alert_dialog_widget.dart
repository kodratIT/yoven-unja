/*
* File : Cupertino Alert Dialog
* Version : 1.0.0
* */

import 'package:jambicraff/helpers/theme/app_theme.dart';
import 'package:jambicraff/helpers/widgets/my_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lucide_icons/lucide_icons.dart';

class CupertinoAlertDialogWidget extends StatefulWidget {
  @override
  _CupertinoAlertDialogWidgetState createState() =>
      _CupertinoAlertDialogWidgetState();
}

class _CupertinoAlertDialogWidgetState
    extends State<CupertinoAlertDialogWidget> {
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
      tag: 'cupertino_alert_dialog_widget',
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
              title: MyText.titleMedium("Alert Dialog", fontWeight: 600),
            ),
            body: Center(
              child: CupertinoButton(
                  color: theme.colorScheme.primary,
                  onPressed: () {
                    _showDialog();
                  },
                  padding:
                      EdgeInsets.only(left: 32, top: 8, right: 32, bottom: 8),
                  pressedOpacity: 0.5,
                  child: MyText.bodyMedium("Give Permission",
                      color: theme.colorScheme.onPrimary)),
            ));
      },
    );
  }

  _showDialog() {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return CupertinoAlertDialog(
          title: MyText.titleMedium(
              'Allow "Maps" to access your location while you use the app?',
              height: 1.2,
              fontWeight: 600),
          content: Container(
            margin: EdgeInsets.only(top: 16),
            child: MyText.bodyMedium(
                'Your current location will be displayed on the map and used for directions, nearby search results, and estimated travel times.',
                height: 1.2,
                fontWeight: 400),
          ),
          actions: <Widget>[
            CupertinoDialogAction(
              child: MyText.titleMedium('Don\'t Allow',
                  color: theme.colorScheme.primary,
                  fontWeight: 600,
                  letterSpacing: 0.3),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            CupertinoDialogAction(
              child: MyText.titleMedium('Allow',
                  color: theme.colorScheme.primary,
                  fontWeight: 600,
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
