/*
* File : Payment Done
* Version : 1.0.0
* */

import 'dart:async';

import 'package:jambicraff/helpers/theme/app_theme.dart';
import 'package:jambicraff/helpers/widgets/my_button.dart';
import 'package:jambicraff/helpers/widgets/my_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:lucide_icons/lucide_icons.dart';

class PaymentDoneProgressWidget extends StatefulWidget {
  @override
  _PaymentDoneProgressWidgetState createState() =>
      _PaymentDoneProgressWidgetState();
}

class _PaymentDoneProgressWidgetState extends State<PaymentDoneProgressWidget>
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
    return GetBuilder(
      tag: 'payment_done_progress_widget',
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
              title: MyText.titleMedium("Payment", fontWeight: 600),
            ),
            body: Center(
                child: isInProgress
                    ? CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(
                        theme.colorScheme.primary,
                      ))
                    : MyButton(
                        elevation: 2,
                        borderRadiusAll: 4,
                        onPressed: () {
                          startTimer();
                        },
                        child: MyText.bodyMedium("Proceed Payment",
                            color: theme.colorScheme.onPrimary))));
      },
    );
  }
}

class _PaymentDoneDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Dialog(
      child: Container(
        padding: EdgeInsets.all(16),
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
              margin: EdgeInsets.only(top: 4),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      MyText.bodyMedium(
                        "DATE",
                      ),
                      MyText.titleSmall("12, April 2020", fontWeight: 600)
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
              margin: EdgeInsets.only(top: 16),
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
                          image: AssetImage(
                              './assets/images/profile/avatar_3.jpg'),
                          fit: BoxFit.fill),
                    ),
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 16),
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
              margin: EdgeInsets.only(top: 16),
              child: Center(
                child: MyButton(
                    elevation: 2,
                    borderRadiusAll: 4,
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: MyText.bodySmall("COMPLETE",
                        color: theme.colorScheme.onPrimary,
                        letterSpacing: 0.3)),
              ),
            )
          ],
        ),
      ),
    );
  }
}
