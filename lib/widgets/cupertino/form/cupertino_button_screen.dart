/*
* File : Cupertino Button
* Version : 1.0.0
* */

import 'package:yoven/helpers/theme/app_theme.dart';
import 'package:yoven/helpers/widgets/my_spacing.dart';
import 'package:yoven/helpers/widgets/my_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CupertinoButtonScreen extends StatefulWidget {
  @override
  _CupertinoButtonScreenState createState() => _CupertinoButtonScreenState();
}

class _CupertinoButtonScreenState extends State<CupertinoButtonScreen> {
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
        body: Container(
            padding: MySpacing.all(16),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: MySpacing.all(8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        MyText.titleSmall("Flat Buttons",
                            color:
                                theme.colorScheme.onBackground.withAlpha(200),
                            fontWeight: 600,
                            letterSpacing: 0.2),
                        MySpacing.height(20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            CupertinoButton(
                                color: Colors.blue,
                                onPressed: () {},
                                borderRadius:
                                    BorderRadius.all(Radius.circular(4)),
                                padding: MySpacing.xy(32, 8),
                                pressedOpacity: 0.5,
                                child: MyText.bodyMedium("Blue",
                                    color: theme.colorScheme.onSecondary)),
                            CupertinoButton(
                                color: Colors.green,
                                onPressed: () {},
                                borderRadius:
                                    BorderRadius.all(Radius.circular(4)),
                                padding: MySpacing.xy(32, 8),
                                child: MyText.bodyMedium("Green",
                                    color: theme.colorScheme.onSecondary)),
                            CupertinoButton(
                                color: Colors.red,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(4)),
                                onPressed: () {},
                                padding: MySpacing.xy(32, 8),
                                child: MyText.bodyMedium("Red",
                                    color: theme.colorScheme.onSecondary)),
                          ],
                        ),
                        MySpacing.height(20),
                        MyText.titleSmall("With Radius",
                            color:
                                theme.colorScheme.onBackground.withAlpha(200),
                            fontWeight: 600,
                            letterSpacing: 0.2),
                        MySpacing.height(20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            CupertinoButton(
                                color: Colors.blue,
                                onPressed: () {},
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8)),
                                padding: MySpacing.xy(32, 8),
                                pressedOpacity: 0.5,
                                child: MyText.bodyMedium("Blue",
                                    color: theme.colorScheme.onSecondary)),
                            CupertinoButton(
                                color: Colors.green,
                                onPressed: () {},
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8)),
                                padding: MySpacing.xy(32, 8),
                                child: MyText.bodyMedium("Green",
                                    color: theme.colorScheme.onSecondary)),
                            CupertinoButton(
                                color: Colors.red,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8)),
                                onPressed: () {},
                                padding: MySpacing.xy(32, 8),
                                child: MyText.bodyMedium("Red",
                                    color: theme.colorScheme.onSecondary)),
                          ],
                        ),
                        MySpacing.height(20),
                        MyText.titleSmall("Rounded",
                            color:
                                theme.colorScheme.onBackground.withAlpha(200),
                            fontWeight: 600,
                            letterSpacing: 0.2),
                        MySpacing.height(20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            CupertinoButton(
                                color: Colors.blue,
                                onPressed: () {},
                                borderRadius:
                                    BorderRadius.all(Radius.circular(80)),
                                padding: MySpacing.xy(32, 8),
                                pressedOpacity: 0.5,
                                child: MyText.bodyMedium("Blue",
                                    color: theme.colorScheme.onSecondary)),
                            CupertinoButton(
                                color: Colors.green,
                                onPressed: () {},
                                borderRadius:
                                    BorderRadius.all(Radius.circular(80)),
                                padding: MySpacing.xy(32, 8),
                                child: MyText.bodyMedium("Green",
                                    color: theme.colorScheme.onSecondary)),
                            CupertinoButton(
                                color: Colors.red,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(80)),
                                onPressed: () {},
                                padding: MySpacing.xy(32, 8),
                                child: MyText.bodyMedium("Red",
                                    color: theme.colorScheme.onSecondary)),
                          ],
                        ),
                      ],
                    ),
                  )
                ])));
  }
}
