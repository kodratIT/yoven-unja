/*
* File : Account Choose Bottom Sheet
* Version : 1.0.0
* */

import 'package:jambicraff/helpers/theme/app_theme.dart';
import 'package:jambicraff/helpers/widgets/my_container.dart';
import 'package:jambicraff/helpers/widgets/my_spacing.dart';
import 'package:jambicraff/helpers/widgets/my_text.dart';
import 'package:jambicraff/helpers/widgets/my_text_style.dart';
import 'package:jambicraff/images.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';

class AccountBottomSheet extends StatefulWidget {
  @override
  _AccountBottomSheetState createState() => _AccountBottomSheetState();
}

class _AccountBottomSheetState extends State<AccountBottomSheet> {
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
        body: MyContainer(
      paddingAll: 0,
      color: Colors.transparent,
      margin: MySpacing.all(16),
      child: Card(
        elevation: 2,
        child: Padding(
          padding: MySpacing.xy(12, 6),
          child: Row(
            children: <Widget>[
              Expanded(
                flex: 1,
                child: Padding(
                  padding: MySpacing.right(8),
                  child: TextField(
                    autofocus: false,
                    decoration: InputDecoration(
                        hintText: "Tap on account image",
                        hintStyle: MyTextStyle.bodyMedium(),
                        border: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        disabledBorder: InputBorder.none,
                        errorBorder: InputBorder.none,
                        focusedErrorBorder: InputBorder.none,
                        isDense: true),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  _showBottomSheet(context);
                },
                child: MyContainer.rounded(
                  width: 36,
                  height: 36,
                  paddingAll: 0,
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  child: Image.asset(
                    Images.profile1,
                    height: 36,
                    width: 36,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
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
                padding: MySpacing.all(16),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Container(
                      padding: MySpacing.fromLTRB(8, 8, 0, 0),
                      child: Row(
                        children: <Widget>[
                          Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                  image: AssetImage(Images.profile1),
                                  fit: BoxFit.fill),
                            ),
                          ),
                          MySpacing.width(20),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                MyText.titleMedium("Bianka Armitage",
                                    color: theme.colorScheme.onBackground,
                                    letterSpacing: 0.3,
                                    fontWeight: 600),
                                Row(
                                  children: <Widget>[
                                    MyText.bodyMedium("Bian@gmail.com",
                                        color: theme.colorScheme.onBackground,
                                        letterSpacing: 0.3),
                                    Icon(
                                      LucideIcons.chevronDown,
                                      size: 16,
                                      color: theme.colorScheme.onBackground,
                                    )
                                  ],
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    Divider(
                      color: theme.dividerColor,
                    ),
                    ListTile(
                      dense: true,
                      leading: Icon(Icons.doorbell_outlined,
                          color: theme.colorScheme.onBackground.withAlpha(220)),
                      title: MyText.bodyLarge("Activity",
                          color: theme.colorScheme.onBackground,
                          letterSpacing: 0.3,
                          fontWeight: 500),
                    ),
                    ListTile(
                      dense: true,
                      leading: Icon(Icons.settings_outlined,
                          color: theme.colorScheme.onBackground.withAlpha(220)),
                      title: MyText.bodyLarge("Settings",
                          color: theme.colorScheme.onBackground,
                          letterSpacing: 0.3,
                          fontWeight: 500),
                    ),
                    ListTile(
                      dense: true,
                      leading: Icon(Icons.help_outline,
                          color: theme.colorScheme.onBackground.withAlpha(220)),
                      title: MyText.bodyLarge("Help & Feedback",
                          color: theme.colorScheme.onBackground,
                          letterSpacing: 0.3,
                          fontWeight: 500),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
