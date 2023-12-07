/*
* File : Internet Check
* Version : 1.0.0
* */
import 'dart:async';

import 'package:jambicraff/helpers/theme/app_theme.dart';
import 'package:jambicraff/helpers/widgets/my_button.dart';
import 'package:jambicraff/helpers/widgets/my_spacing.dart';
import 'package:jambicraff/helpers/widgets/my_text.dart';
import 'package:flutter/material.dart';

class InternetProgress extends StatefulWidget {
  @override
  _InternetCheckWidgetState createState() => _InternetCheckWidgetState();
}

class _InternetCheckWidgetState extends State<InternetProgress>
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
          return _InternetCheckDialog();
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
        body: Center(
            child: isInProgress
                ? Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation<Color>(
                        theme.colorScheme.primary,
                      )),
                      MySpacing.width(20),
                      MyText.bodyMedium("Checking...",
                          color: theme.colorScheme.onBackground,
                          letterSpacing: 0.2)
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
                    child: MyText.bodyMedium("Check",
                        color: theme.colorScheme.onPrimary))));
  }
}

class _InternetCheckDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    return Dialog(
      child: Container(
        padding: MySpacing.xy(24, 16),
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
            Center(
                child: Icon(
              Icons.signal_wifi_off_outlined,
              size: 40,
              color: themeData.colorScheme.onBackground.withAlpha(220),
            )),
            Container(
              margin: MySpacing.top(16),
              child: Center(
                  child: MyText.titleMedium("No Internet!", fontWeight: 700)),
            ),
            Container(
              margin: MySpacing.top(16),
              child: Center(
                  child: MyText.bodySmall("Please turn on internet",
                      fontWeight: 500)),
            ),
            Container(
              margin: MySpacing.top(16),
              child: Center(
                child: MyButton(
                    backgroundColor: themeData.colorScheme.primary,
                    elevation: 0,
                    borderRadiusAll: 4,
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    padding: MySpacing.xy(18, 16),
                    child: MyText.bodySmall("TRY AGAIN",
                        fontWeight: 600,
                        letterSpacing: 0.3,
                        color: themeData.colorScheme.onPrimary)),
              ),
            )
          ],
        ),
      ),
    );
  }
}
