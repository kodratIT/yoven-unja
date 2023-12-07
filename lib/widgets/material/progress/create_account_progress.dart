/*
* File : Create Account
* Version : 1.0.0
* */
import 'dart:async';

import 'package:yoven/helpers/theme/app_theme.dart';
import 'package:yoven/helpers/widgets/my_button.dart';
import 'package:yoven/helpers/widgets/my_spacing.dart';
import 'package:yoven/helpers/widgets/my_text.dart';
import 'package:flutter/material.dart';

class CreateAccountProgress extends StatefulWidget {
  @override
  _CreateAccountProgressState createState() => _CreateAccountProgressState();
}

class _CreateAccountProgressState extends State<CreateAccountProgress>
    with SingleTickerProviderStateMixin {
  bool isInProgress = true;
  late ThemeData theme;
  late CustomTheme customTheme;

  @override
  void initState() {
    super.initState();
    startTimer();
    theme = AppTheme.theme;
    customTheme = AppTheme.customTheme;
  }

  late Timer _timer;

  void startTimer() {
    setState(() {
      isInProgress = true;
    });
    const oneSec = Duration(seconds: 2);
    _timer = Timer.periodic(
        oneSec,
        (Timer timer) => {
              _timer.cancel(),
              showMyDialog(context),
              setState(
                () {
                  isInProgress = false;
                },
              )
            });
  }

  showMyDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return _CreateAccountDialog();
        });
  }

  @override
  void dispose() {
    super.dispose();
    _timer.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            padding: MySpacing.all(16),
            child: Center(
                child: isInProgress
                    ? Row(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          CircularProgressIndicator(
                              valueColor: AlwaysStoppedAnimation<Color>(
                            theme.colorScheme.primary,
                          )),
                          MySpacing.width(20),
                          MyText.bodyMedium("Creating...",
                              fontWeight: 600, letterSpacing: 0.3)
                        ],
                      )
                    : MyButton(
                        backgroundColor: theme.colorScheme.primary,
                        elevation: 0,
                        borderRadiusAll: 4,
                        onPressed: () {
                          startTimer();
                        },
                        padding: MySpacing.xy(18, 16),
                        child: MyText.bodyMedium("Create Account",
                            fontWeight: 600,
                            color: theme.colorScheme.onPrimary,
                            letterSpacing: 0.4)))));
  }
}

class _CreateAccountDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Dialog(
      child: Container(
        padding: MySpacing.xy(24, 16),
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
            Center(
                child: Icon(
              Icons.person_outline,
              size: 40,
              color: theme.colorScheme.onBackground.withAlpha(220),
            )),
            Container(
              margin: MySpacing.top(16),
              child:
                  Center(child: MyText.titleMedium("Thanks!", fontWeight: 700)),
            ),
            Container(
              margin: MySpacing.top(16),
              child: Center(
                  child: MyText.bodySmall(
                      "Your account has been successfully created.",
                      fontWeight: 600,
                      letterSpacing: 0)),
            ),
            Container(
              margin: MySpacing.top(16),
              child: Center(
                  child: MyText.bodySmall(
                "Please check your inbox, a code is sent on your email as well as your mobile no.",
                fontWeight: 500,
                height: 1.15,
                textAlign: TextAlign.center,
              )),
            ),
            Container(
              margin: MySpacing.top(16),
              child: Center(
                child: MyButton(
                    backgroundColor: theme.colorScheme.primary,
                    borderRadiusAll: 4,
                    elevation: 0,
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    padding: MySpacing.xy(18, 16),
                    child: MyText.bodySmall("VERIFY",
                        fontWeight: 600,
                        letterSpacing: 0.3,
                        color: theme.colorScheme.onPrimary)),
              ),
            )
          ],
        ),
      ),
    );
  }
}
