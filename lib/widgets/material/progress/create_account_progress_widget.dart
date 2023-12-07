/*
* File : Create Account
* Version : 1.0.0
* */
import 'dart:async';

import 'package:jambicraff/helpers/theme/app_theme.dart';
import 'package:jambicraff/helpers/widgets/my_button.dart';
import 'package:jambicraff/helpers/widgets/my_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:lucide_icons/lucide_icons.dart';

class CreateAccountProgressWidget extends StatefulWidget {
  @override
  _CreateAccountProgressWidgetState createState() =>
      _CreateAccountProgressWidgetState();
}

class _CreateAccountProgressWidgetState
    extends State<CreateAccountProgressWidget>
    with SingleTickerProviderStateMixin {
  bool isInProgress = true;
  late Timer _timer;

  late CustomTheme customTheme;
  late ThemeData theme;

  @override
  void initState() {
    super.initState();
    customTheme = AppTheme.customTheme;
    theme = AppTheme.theme;
    startTimer();
  }

  void startTimer() {
    setState(() {
      isInProgress = true;
    });
    const oneSec = const Duration(seconds: 2);
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
    return GetBuilder(
      tag: 'create_account_progress_widget',
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
              title: MyText.titleMedium("Account", fontWeight: 600),
            ),
            body: Center(
                child: isInProgress
                    ? Row(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          CircularProgressIndicator(
                              valueColor: AlwaysStoppedAnimation<Color>(
                            theme.colorScheme.primary,
                          )),
                          Container(
                            margin: EdgeInsets.only(left: 16),
                            child: MyText.bodyMedium("Creating...",
                                fontWeight: 600, letterSpacing: 0.3),
                          )
                        ],
                      )
                    : MyButton(
                        elevation: 2,
                        borderRadiusAll: 4,
                        onPressed: () {
                          startTimer();
                        },
                        child: MyText.bodyMedium("Create Account",
                            fontWeight: 600,
                            color: theme.colorScheme.onPrimary,
                            letterSpacing: 0.4))));
      },
    );
  }
}

class _CreateAccountDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Dialog(
      child: Container(
        padding: EdgeInsets.only(top: 16, bottom: 16, left: 24, right: 24),
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
              LucideIcons.userCheck,
              size: 40,
              color: theme.colorScheme.onBackground.withAlpha(220),
            )),
            Container(
              margin: EdgeInsets.only(top: 16),
              child:
                  Center(child: MyText.titleMedium("Thanks!", fontWeight: 700)),
            ),
            Container(
              margin: EdgeInsets.only(top: 16),
              child: Center(
                  child: MyText.bodySmall(
                      "Your account has been successfully created.",
                      fontWeight: 600,
                      letterSpacing: 0)),
            ),
            Container(
              margin: EdgeInsets.only(top: 16),
              child: Center(
                  child: MyText.bodySmall(
                "Please check your inbox, a code is sent on your email as well as your mobile no.",
                fontWeight: 500,
                height: 1.15,
                textAlign: TextAlign.center,
              )),
            ),
            Container(
              margin: EdgeInsets.only(top: 16),
              child: Center(
                child: MyButton(
                    elevation: 2,
                    borderRadiusAll: 4,
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
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
