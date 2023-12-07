/*
* File : Accept Policy Dialog
* Version : 1.0.0
* */

import 'package:jambicraff/helpers/theme/app_theme.dart';
import 'package:jambicraff/helpers/widgets/my_button.dart';
import 'package:jambicraff/helpers/widgets/my_text.dart';
import 'package:jambicraff/helpers/widgets/my_text_style.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';

class AcceptPolicyDialogWidget extends StatefulWidget {
  @override
  _AcceptPolicyWidgetState createState() => _AcceptPolicyWidgetState();
}

class _AcceptPolicyWidgetState extends State<AcceptPolicyDialogWidget> {
  late CustomTheme customTheme;
  late ThemeData theme;

  @override
  void initState() {
    super.initState();
    customTheme = AppTheme.customTheme;
    theme = AppTheme.theme;
    WidgetsBinding.instance.addPostFrameCallback((_) => _showDialog());
  }

  void _showDialog() {
    showDialog(
        context: context, builder: (BuildContext context) => _TermsDialog());
  }

  @override
  Widget build(BuildContext context) {
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
          title: MyText.titleMedium("Accept Terms", fontWeight: 600),
        ),
        body: Center(
          child: MyButton(
              elevation: 2,
              borderRadiusAll: 4,
              onPressed: () {
                _showDialog();
              },
              child: MyText.bodyMedium("Accept Terms",
                  fontWeight: 700, color: theme.colorScheme.onPrimary)),
        ));
  }
}

class _TermsDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ThemeData theme = AppTheme.theme;
    return Dialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8.0))),
      child: Container(
        padding: EdgeInsets.all(20),
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
                    child: MyText.titleLarge("Terms", fontWeight: 800),
                  ),
                ),
                Icon(LucideIcons.download)
              ],
            ),
            Divider(),
            Container(
              margin: EdgeInsets.only(top: 8),
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
                margin: EdgeInsets.only(top: 8),
                alignment: AlignmentDirectional.centerEnd,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    MyButton.text(
                        borderRadiusAll: 4,
                        elevation: 2,
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: MyText.bodyMedium("Decline",
                            fontWeight: 600, color: theme.colorScheme.primary)),
                    MyButton(
                        elevation: 2,
                        borderRadiusAll: 4,
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
