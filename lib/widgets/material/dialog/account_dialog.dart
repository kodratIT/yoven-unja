/*
* File : Account Dialog
* Version : 1.0.0
* */

import 'package:yoven/helpers/theme/app_theme.dart';
import 'package:yoven/helpers/widgets/my_button.dart';
import 'package:yoven/helpers/widgets/my_spacing.dart';
import 'package:yoven/helpers/widgets/my_text.dart';
import 'package:yoven/images.dart';
import 'package:flutter/material.dart';

class AccountDialog extends StatefulWidget {
  @override
  _AccountDialogState createState() => _AccountDialogState();
}

class _AccountDialogState extends State<AccountDialog> {
  late ThemeData theme;

  @override
  void initState() {
    super.initState();
    theme = AppTheme.theme;
  }

  void _showDialog() {
    showDialog(
        context: context, builder: (BuildContext context) => _AccountDialog());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: MyButton(
          backgroundColor: theme.colorScheme.primary,
          splashColor: theme.colorScheme.onPrimary.withAlpha(40),
          borderRadiusAll: 4,
          elevation: 0,
          onPressed: () {
            _showDialog();
          },
          padding: MySpacing.xy(18, 16),
          child: MyText.titleSmall("Account Dialog",
              color: theme.colorScheme.onPrimary, letterSpacing: 0.2)),
    ));
  }
}

class _AccountDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: MySpacing.fromLTRB(16, 16, 16, 0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  width: 36,
                  height: 36,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image: AssetImage(Images.profiles[0]),
                        fit: BoxFit.fill),
                  ),
                ),
                MySpacing.width(20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    MyText.titleSmall("Aishah Mcconnell", fontWeight: 700),
                    MyText.bodyMedium("ais@mcc.com", fontWeight: 500),
                    Container(
                      margin: MySpacing.only(top: 8, bottom: 12),
                      child: MyButton(
                          onPressed: () {},
                          borderRadiusAll: 4,
                          elevation: 0,
                          child: MyText.bodyMedium(
                            "Manage all accounts",
                            color: theme.colorScheme.onPrimary,
                          )),
                    )
                  ],
                )
              ],
            ),
          ),
          Divider(
            color: theme.dividerColor,
            thickness: 1,
            height: 0,
          ),
          Container(
            margin: MySpacing.fromLTRB(16, 16, 16, 0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  width: 36,
                  height: 36,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image: AssetImage(Images.profiles[1]),
                        fit: BoxFit.fill),
                  ),
                ),
                MySpacing.width(20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    MyText.titleSmall("Liana Fitzgeraldl", fontWeight: 700),
                    MyText.bodyMedium("liana.fits@gmail.com", fontWeight: 500),
                  ],
                )
              ],
            ),
          ),
          Container(
            margin: MySpacing.nBottom(16),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  width: 36,
                  height: 36,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image: AssetImage(Images.profiles[2]),
                        fit: BoxFit.fill),
                  ),
                ),
                MySpacing.width(20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    MyText.titleSmall("Sally Lee", fontWeight: 700),
                    MyText.bodyMedium("sallylee@qq.com", fontWeight: 500),
                  ],
                )
              ],
            ),
          ),
          Container(
            margin: MySpacing.nBottom(16),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  width: 36,
                  height: 36,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image: AssetImage(Images.profiles[3]),
                        fit: BoxFit.fill),
                  ),
                ),
                MySpacing.width(20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    MyText.titleSmall("Shamima Ballard", fontWeight: 700),
                    MyText.bodyMedium("ballard@gmail.com", fontWeight: 500),
                  ],
                )
              ],
            ),
          ),
          Container(
            padding: MySpacing.xy(16, 12),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  width: 36,
                  height: 36,
                  child: Center(
                    child: Icon(
                      Icons.account_circle_outlined,
                      color: theme.colorScheme.onBackground,
                      size: 22,
                    ),
                  ),
                ),
                MySpacing.width(20),
                MyText.titleSmall("Add another account",
                    fontWeight: 700, letterSpacing: 0),
              ],
            ),
          ),
          Divider(
            color: theme.dividerColor,
            thickness: 1,
            height: 0,
          ),
          Container(
            padding: MySpacing.fromLTRB(16, 8, 0, 8),
            alignment: AlignmentDirectional.center,
            child: MyButton.text(
                onPressed: () {},
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Icon(
                      Icons.logout_outlined,
                      size: 18,
                    ),
                    MySpacing.width(8),
                    MyText.bodyMedium(
                      "Sign out from all account",
                      fontWeight: 600,
                      color: theme.colorScheme.primary,
                    ),
                  ],
                )),
          )
        ],
      ),
    );
  }
}
