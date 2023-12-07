/*
* File : Fingerprint Lock Bottom Sheet
* Version : 1.0.0
* */

import 'package:yoven/helpers/theme/app_theme.dart';
import 'package:yoven/helpers/widgets/my_button.dart';
import 'package:yoven/helpers/widgets/my_spacing.dart';
import 'package:yoven/helpers/widgets/my_text.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';

class FingerprintLockBottomSheet extends StatefulWidget {
  @override
  _FingerprintLockBottomSheetState createState() =>
      _FingerprintLockBottomSheetState();
}

class _FingerprintLockBottomSheetState
    extends State<FingerprintLockBottomSheet> {
  late ThemeData theme;
  late CustomTheme customTheme;

  @override
  void initState() {
    super.initState();
    theme = AppTheme.theme;
    customTheme = AppTheme.customTheme;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: MyButton(
          onPressed: () {
            _showBottomSheet(context);
          },
          elevation: 0,
          borderRadiusAll: 4,
          padding: MySpacing.xy(20, 16),
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
                            margin: EdgeInsets.only(top: 64),
                            child: MyText.bodyMedium(
                                "Touch the fingerprint sensor",
                                color: theme.colorScheme.onBackground,
                                letterSpacing: 0.2),
                          )
                        ],
                      ),
                    ),
                    Container(
                      margin: MySpacing.top(16),
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
