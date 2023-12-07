/*
* File : Accept Policy Dialog
* Version : 1.0.0
* */

import 'package:jambicraff/helpers/theme/app_theme.dart';
import 'package:jambicraff/helpers/widgets/my_button.dart';
import 'package:jambicraff/helpers/widgets/my_spacing.dart';
import 'package:jambicraff/helpers/widgets/my_text.dart';
import 'package:jambicraff/helpers/widgets/my_text_style.dart';
import 'package:flutter/material.dart';

class PolicyDialog extends StatefulWidget {
  @override
  _PolicyDialogState createState() => _PolicyDialogState();
}

class _PolicyDialogState extends State<PolicyDialog> {
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
        context: context, builder: (BuildContext context) => _TermsDialog());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: MyButton(
          elevation: 0,
          borderRadiusAll: 4,
          onPressed: () {
            _showDialog();
          },
          padding: MySpacing.xy(18, 16),
          child: MyText.bodyMedium("Accept Terms",
              color: theme.colorScheme.onPrimary)),
    ));
  }
}

class _TermsDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Dialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8.0))),
      child: Container(
        padding: MySpacing.all(20),
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
            Row(
              children: <Widget>[
                Expanded(
                  child: Center(
                    child: MyText.titleLarge("Terms", fontWeight: 600),
                  ),
                ),
                Icon(Icons.download)
              ],
            ),
            Divider(),
            Container(
              margin: MySpacing.only(top: 8),
              child: RichText(
                text: TextSpan(
                    style: MyTextStyle.titleSmall(
                        fontWeight: 600, letterSpacing: 0.2),
                    children: <TextSpan>[
                      TextSpan(
                        text: "By Creating an account you agree to the xyz ",
                      ),
                      TextSpan(
                          text: "Terms of Service",
                          style: TextStyle(
                              decoration: TextDecoration.underline,
                              color: theme.colorScheme.primary)),
                      TextSpan(text: " and "),
                      TextSpan(
                          text: "Privacy Policy.",
                          style: TextStyle(
                              decoration: TextDecoration.underline,
                              color: theme.colorScheme.primary)),
                    ]),
              ),
            ),
            Container(
                margin: MySpacing.top(24),
                alignment: AlignmentDirectional.centerEnd,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    MyButton.text(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: MyText.bodyMedium(
                          "Decline",
                          fontWeight: 600,
                          color: theme.colorScheme.primary,
                        )),
                    MyButton(
                        backgroundColor: theme.colorScheme.primary,
                        borderRadiusAll: 4,
                        elevation: 0,
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: MyText.bodyMedium("Accept",
                            fontWeight: 600,
                            color: theme.colorScheme.onPrimary)),
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
