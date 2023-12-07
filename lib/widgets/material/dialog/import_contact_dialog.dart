/*
* File : Import Comment Dialog
* Version : 1.0.0
* */

import 'package:jambicraff/helpers/theme/app_theme.dart';
import 'package:jambicraff/helpers/widgets/my_button.dart';
import 'package:jambicraff/helpers/widgets/my_spacing.dart';
import 'package:jambicraff/helpers/widgets/my_text.dart';
import 'package:jambicraff/helpers/widgets/my_text_style.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';

class ImportContactDialog extends StatefulWidget {
  @override
  _ImportContactWidgetState createState() => _ImportContactWidgetState();
}

class _ImportContactWidgetState extends State<ImportContactDialog> {
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
        context: context, builder: (BuildContext context) => _ImportDialog());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            _showDialog();
          },
          elevation: 2,
          child: Icon(
            LucideIcons.arrowBigDownDash,
            size: 28,
          ),
        ),
        body: Container(
            color: theme.colorScheme.background,
            child: Center(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  MyText.titleSmall("Tap on ",
                      color: theme.colorScheme.onBackground,
                      letterSpacing: 0.2),
                  Icon(LucideIcons.arrowBigDownDash,
                      size: 18, color: theme.colorScheme.onBackground),
                  MyText.titleSmall(" to import contact",
                      color: theme.colorScheme.onBackground,
                      letterSpacing: 0.2),
                ],
              ),
            )));
  }
}

class _ImportDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Dialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8.0))),
      child: Container(
        decoration: BoxDecoration(
          color: theme.colorScheme.background,
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
            Container(
              margin: MySpacing.nBottom(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  MyText.titleLarge("Import contacts",
                      fontWeight: 700, letterSpacing: 0),
                  Container(
                    margin: MySpacing.top(8),
                    child: MyText.titleSmall(
                        "To import contacts, select a CSV or vCard file",
                        fontWeight: 500),
                  ),
                  Container(
                    margin: MySpacing.only(top: 8),
                    child: MyButton(
                        elevation: 0,
                        borderRadiusAll: 4,
                        onPressed: () {},
                        child: MyText.bodyMedium("Select File",
                            color: theme.colorScheme.onSecondary,
                            fontWeight: 600,
                            letterSpacing: 0.2)),
                  ),
                  Container(
                    margin: MySpacing.top(8),
                    child: RichText(
                        text: TextSpan(children: <TextSpan>[
                      TextSpan(
                          text: "No file? ",
                          style: MyTextStyle.titleSmall(
                              fontWeight: 500, letterSpacing: 0)),
                      TextSpan(
                          text: "Choose account",
                          style: MyTextStyle.titleSmall(
                              fontWeight: 600,
                              color: theme.colorScheme.primary,
                              letterSpacing: 0)),
                      TextSpan(
                          text: " instead",
                          style: MyTextStyle.titleSmall(
                              fontWeight: 500, letterSpacing: 0)),
                    ])),
                  ),
                ],
              ),
            ),
            Container(
                margin: MySpacing.fromLTRB(0, 16, 0, 16),
                alignment: AlignmentDirectional.centerEnd,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    MyButton.text(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: MyText.bodyMedium("Cancel", fontWeight: 600)),
                    MyButton.text(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: MyText.bodyMedium("Import",
                            fontWeight: 600, color: theme.colorScheme.primary)),
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
