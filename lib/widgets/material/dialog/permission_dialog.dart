/*
* File : Location Permission Dialog
* Version : 1.0.0
* */

import 'package:yoven/helpers/theme/app_theme.dart';
import 'package:yoven/helpers/widgets/my_button.dart';
import 'package:yoven/helpers/widgets/my_spacing.dart';
import 'package:yoven/helpers/widgets/my_text.dart';
import 'package:yoven/helpers/widgets/my_text_style.dart';
import 'package:flutter/material.dart';

class PermissionDialog extends StatefulWidget {
  @override
  _LocationPermissionWidgetState createState() =>
      _LocationPermissionWidgetState();
}

class _LocationPermissionWidgetState extends State<PermissionDialog> {
  late ThemeData theme;
  late CustomTheme customTheme;

  @override
  void initState() {
    super.initState();
    theme = AppTheme.theme;
    customTheme = AppTheme.customTheme;
  }

  void _showDialog() {
    showDialog(
        context: context,
        builder: (BuildContext context) => _PermissionDialog());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: MyButton(
          elevation: 0,
          borderRadiusAll: 4,
          onPressed: () => _showDialog(),
          padding: MySpacing.xy(18, 16),
          child: MyText.bodyMedium("Give Permission",
              color: theme.colorScheme.onPrimary)),
    ));
  }
}

class _PermissionDialog extends StatefulWidget {
  @override
  _PermissionDialogState createState() => _PermissionDialogState();
}

class _PermissionDialogState extends State<_PermissionDialog> {
  bool? _check1 = false;

  late ThemeData theme;

  @override
  Widget build(BuildContext context) {
    theme = Theme.of(context);
    return Dialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8.0))),
      child: Container(
        padding: MySpacing.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  margin: MySpacing.right(16),
                  child: Icon(
                    Icons.map_outlined,
                    size: 28,
                    color: theme.colorScheme.onBackground,
                  ),
                ),
                MySpacing.width(8),
                Expanded(
                  child: RichText(
                    text: TextSpan(
                        style: MyTextStyle.bodyLarge(
                            fontWeight: 500, letterSpacing: 0.2),
                        children: <TextSpan>[
                          TextSpan(text: "Allow "),
                          TextSpan(
                              text: "FlutKit",
                              style: MyTextStyle.bodyLarge(fontWeight: 700)),
                          TextSpan(text: " to access this device's location?"),
                        ]),
                  ),
                )
              ],
            ),
            Container(
              margin: MySpacing.top(16),
              child: Row(
                children: <Widget>[
                  Checkbox(
                    visualDensity: VisualDensity.compact,
                    activeColor: theme.colorScheme.primary,
                    onChanged: (bool? value) {
                      setState(() {
                        _check1 = value;
                      });
                    },
                    value: _check1,
                  ),
                  MyText.titleSmall("Dont's ask again",
                      fontWeight: 500, letterSpacing: 0.2)
                ],
              ),
            ),
            Container(
                margin: MySpacing.top(8),
                alignment: AlignmentDirectional.centerEnd,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    MyButton.text(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: MyText.bodyMedium("DENY",
                            fontWeight: 700, letterSpacing: 0.4)),
                    MyButton(
                        backgroundColor: theme.colorScheme.primary,
                        borderRadiusAll: 4,
                        elevation: 0,
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: MyText.bodyMedium("ALLOW",
                            letterSpacing: 0.4,
                            color: theme.colorScheme.onPrimary)),
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
