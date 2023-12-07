/*
* File : Cupertino Alert Dialog
* Version : 1.0.0
* */

import 'package:jambicraff/helpers/theme/app_theme.dart';
import 'package:jambicraff/helpers/widgets/my_spacing.dart';
import 'package:jambicraff/helpers/widgets/my_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CupertinoAlertDialogScreen extends StatefulWidget {
  @override
  _CupertinoAlertDialogScreenState createState() =>
      _CupertinoAlertDialogScreenState();
}

class _CupertinoAlertDialogScreenState
    extends State<CupertinoAlertDialogScreen> {
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
            _showDialog();
          },
          borderRadius: BorderRadius.all(Radius.circular(4)),
          padding: MySpacing.xy(32, 8),
          pressedOpacity: 0.5,
          child: MyText.bodyMedium("Give Permission",
              color: theme.colorScheme.onPrimary)),
    ));
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
              fontWeight: 400,
            ),
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
