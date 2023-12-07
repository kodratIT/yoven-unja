/*
* File : Fail Progress
* Version : 1.0.0
* */

import 'dart:async';

import 'package:jambicraff/helpers/widgets/my_button.dart';
import 'package:jambicraff/helpers/widgets/my_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:lucide_icons/lucide_icons.dart';

import 'package:jambicraff/helpers/theme/app_theme.dart';

class FailProgressWidget extends StatefulWidget {
  @override
  _FailProgressWidgetState createState() => _FailProgressWidgetState();
}

class _FailProgressWidgetState extends State<FailProgressWidget>
    with SingleTickerProviderStateMixin {
  bool isInProgress = true;
  late CustomTheme customTheme;
  late ThemeData theme;

  @override
  void initState() {
    super.initState();
    customTheme = AppTheme.customTheme;
    theme = AppTheme.theme;
    startTimer();
  }

  late Timer _timer;

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
          return _FailDialog();
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
      tag: 'fail_progress_widget',
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
              title: MyText.titleMedium("Try Again", fontWeight: 600),
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
                            child: MyText.bodyMedium("Trying...",
                                color: theme.colorScheme.onBackground,
                                letterSpacing: 0.2),
                          )
                        ],
                      )
                    : MyButton(
                        elevation: 0,
                        borderRadiusAll: 4,
                        onPressed: () {
                          startTimer();
                        },
                        child: MyText.bodyMedium("Try This",
                            color: theme.colorScheme.onPrimary))));
      },
    );
  }
}

class _FailDialog extends StatelessWidget {
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
              LucideIcons.smile,
              size: 40,
              color: theme.colorScheme.onBackground.withAlpha(220),
            )),
            Container(
              margin: EdgeInsets.only(top: 16),
              child:
                  Center(child: MyText.titleMedium("Oooops", fontWeight: 700)),
            ),
            Container(
              margin: EdgeInsets.only(top: 16),
              child: Center(
                  child: MyText.bodySmall("Something went wrong",
                      fontWeight: 600)),
            ),
            Container(
              margin: EdgeInsets.only(top: 16),
              child: Center(
                  child: MyText.bodySmall(
                "Please try again!",
                fontWeight: 500,
                textAlign: TextAlign.center,
              )),
            ),
            Container(
              margin: EdgeInsets.only(top: 16),
              child: Center(
                child: MyButton(
                    elevation: 0,
                    borderRadiusAll: 4,
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: MyText.bodySmall("TRY AGAIN",
                        fontWeight: 600,
                        letterSpacing: 0.4,
                        color: theme.colorScheme.onPrimary)),
              ),
            )
          ],
        ),
      ),
    );
  }
}
