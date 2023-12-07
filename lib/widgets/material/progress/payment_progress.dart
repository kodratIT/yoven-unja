/*
* File : Payment Done
* Version : 1.0.0
* */

import 'dart:async';

import 'package:yoven/helpers/theme/app_theme.dart';
import 'package:yoven/helpers/widgets/my_button.dart';
import 'package:yoven/helpers/widgets/my_spacing.dart';
import 'package:yoven/helpers/widgets/my_text.dart';
import 'package:flutter/material.dart';

class PaymentProgress extends StatefulWidget {
  @override
  _PaymentProgressState createState() => _PaymentProgressState();
}

class _PaymentProgressState extends State<PaymentProgress>
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
          return _PaymentDoneDialog();
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
                    ? CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(
                        theme.colorScheme.primary,
                      ))
                    : MyButton(
                        backgroundColor: theme.colorScheme.primary,
                        elevation: 0,
                        borderRadiusAll: 4,
                        onPressed: () {
                          startTimer();
                        },
                        padding: MySpacing.xy(18, 16),
                        child: MyText.bodyMedium("Proceed Payment",
                            color: theme.colorScheme.onPrimary)))));
  }
}

class _PaymentDoneDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Dialog(
      child: Container(
        padding: MySpacing.all(16),
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
            Center(child: MyText.titleMedium("Thank You!", fontWeight: 700)),
            Center(
                child: MyText.bodyMedium(
              "Your transaction was successful",
            )),
            Divider(
              color: theme.dividerColor,
              thickness: 1,
            ),
            Container(
              margin: MySpacing.top(4),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      MyText.bodyMedium(
                        "DATE",
                      ),
                      MyText.titleSmall("12, April 2020", fontWeight: 600),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      MyText.bodyMedium(
                        "TIME",
                      ),
                      MyText.titleSmall("8:20 PM", fontWeight: 600)
                    ],
                  ),
                ],
              ),
            ),
            Container(
              margin: MySpacing.top(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      MyText.bodyMedium(
                        "TO",
                      ),
                      MyText.titleSmall("Bronte Mcclure", fontWeight: 600),
                      MyText.bodyMedium(
                        "bronte@gmail.com",
                      ),
                    ],
                  ),
                  Container(
                    width: 52,
                    height: 52,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: AssetImage('./assets/images/avatar-3.jpg'),
                          fit: BoxFit.fill),
                    ),
                  )
                ],
              ),
            ),
            Container(
              margin: MySpacing.top(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  MyText.bodyMedium(
                    "AMOUNT",
                  ),
                  MyText.titleSmall("\$ 12,000", fontWeight: 600),
                ],
              ),
            ),
            Container(
              margin: MySpacing.top(16),
              child: Center(
                child: MyButton(
                  backgroundColor: theme.colorScheme.primary,
                  elevation: 0,
                  borderRadiusAll: 4,
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  padding: MySpacing.xy(18, 16),
                  child: MyText.bodySmall("COMPLETE",
                      color: theme.colorScheme.onPrimary, letterSpacing: 0.3),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
