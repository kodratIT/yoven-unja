/*
* File : Fingerprint Lock Bottom Sheet
* Version : 1.0.0
* */

import 'package:jambicraff/helpers/theme/app_theme.dart';
import 'package:jambicraff/helpers/widgets/my_button.dart';
import 'package:jambicraff/helpers/widgets/my_text.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';

class FingerprintLockBottomSheetWidget extends StatefulWidget {
  @override
  _FingerprintLockBottomSheetWidgetState createState() =>
      _FingerprintLockBottomSheetWidgetState();
}

class _FingerprintLockBottomSheetWidgetState
    extends State<FingerprintLockBottomSheetWidget> {
  late CustomTheme customTheme;
  late ThemeData theme;

  @override
  void initState() {
    super.initState();
    customTheme = AppTheme.customTheme;
    theme = AppTheme.theme;
    WidgetsBinding.instance
        .addPostFrameCallback((_) => _showBottomSheet(context));
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
          title: MyText.titleMedium("Login", fontWeight: 600),
        ),
        body: Center(
          child: MyButton(
              borderRadiusAll: 4,
              elevation: 2,
              onPressed: () {
                _showBottomSheet(context);
              },
              child: MyText.bodyMedium("Login with Fingerprint",
                  color: theme.colorScheme.onPrimary)),
        ));
  }

  void _showBottomSheet(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext buildContext) {
          return Container(
            color: Colors.transparent,
            child: Container(
              decoration: BoxDecoration(
                  color: theme.colorScheme.background,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(16),
                      topRight: Radius.circular(16))),
              child: Padding(
                padding: EdgeInsets.all(24),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                        margin: EdgeInsets.only(left: 16),
                        child: MyText.titleMedium("Sign In",
                            color: theme.colorScheme.onBackground,
                            fontWeight: 600,
                            letterSpacing: 0.2)),
                    Container(
                      alignment: Alignment.center,
                      margin: EdgeInsets.only(top: 16),
                      child: Column(
                        children: <Widget>[
                          Icon(LucideIcons.fingerprint,
                              color: theme.colorScheme.onBackground, size: 64),
                          Container(
                            margin: EdgeInsets.only(top: 4),
                            child: MyText.bodyMedium(
                                "Touch the fingerprint sensor",
                                color: theme.colorScheme.onBackground,
                                letterSpacing: 0.2),
                          )
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 16),
                      child: TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: MyText.bodyMedium("CANCEL",
                              color: theme.colorScheme.secondary,
                              fontWeight: 600,
                              letterSpacing: 0.4)),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
