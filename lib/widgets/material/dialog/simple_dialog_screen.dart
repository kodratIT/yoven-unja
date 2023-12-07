/*
* File : Simple Dialog
* Version : 1.0.0
* */

import 'package:yoven/helpers/theme/app_theme.dart';
import 'package:yoven/helpers/widgets/my_button.dart';
import 'package:yoven/helpers/widgets/my_spacing.dart';
import 'package:yoven/helpers/widgets/my_text.dart';
import 'package:flutter/material.dart';

class SimpleDialogScreen extends StatefulWidget {
  @override
  _SimpleWidgetState createState() => _SimpleWidgetState();
}

class _SimpleWidgetState extends State<SimpleDialogScreen> {
  void _showDialog() {
    showDialog(
        context: context, builder: (BuildContext context) => _SimpleDialog());
  }

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
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: theme,
        home: Scaffold(
            body: Center(
          child: MyButton(
              onPressed: () {
                _showDialog();
              },
              elevation: 0,
              borderRadiusAll: 4,
              padding: MySpacing.xy(18, 16),
              child: MyText.bodyMedium("Simple Dialog",
                  color: theme.colorScheme.onPrimary, letterSpacing: 0.2)),
        )));
  }
}

class _SimpleDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    return Dialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8.0))),
      child: Container(
        padding: MySpacing.all(16),
        decoration: BoxDecoration(
          color: themeData.colorScheme.background,
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(8),
          boxShadow: const [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 10.0,
              offset: Offset(0.0, 10.0),
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            MyText.titleLarge(
              "Title",
              fontWeight: 700,
            ),
            MyText.titleMedium(
              "Description...",
              fontWeight: 500,
            ),
            Container(
                alignment: AlignmentDirectional.centerEnd,
                child: MyButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    borderRadiusAll: 4,
                    elevation: 0,
                    child: MyText.bodyMedium("OK",
                        letterSpacing: 0.3,
                        color: themeData.colorScheme.onPrimary))),
          ],
        ),
      ),
    );
  }
}
