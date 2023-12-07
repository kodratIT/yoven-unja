/*
* File : Cupertino Button
* Version : 1.0.0
* */

import 'package:yoven/helpers/theme/app_theme.dart';
import 'package:yoven/helpers/widgets/my_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lucide_icons/lucide_icons.dart';

class CupertinoButtonWidget extends StatefulWidget {
  @override
  _CupertinoButtonWidgetState createState() => _CupertinoButtonWidgetState();
}

class _CupertinoButtonWidgetState extends State<CupertinoButtonWidget> {
  late CustomTheme customTheme;
  late ThemeData theme;

  @override
  void initState() {
    super.initState();
    customTheme = AppTheme.customTheme;
    theme = AppTheme.theme;
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      tag: 'cupertino_button_widget',
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
              title: MyText.titleMedium("Cupertino Buttons", fontWeight: 600),
            ),
            body: Padding(
                padding:
                    EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 8),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.all(8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            MyText.titleSmall("Flat Buttons",
                                color: theme.colorScheme.onBackground
                                    .withAlpha(200),
                                letterSpacing: 0.2),
                            Padding(
                              padding: EdgeInsets.only(top: 8),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: <Widget>[
                                  CupertinoButton(
                                      color: Colors.blue,
                                      onPressed: () {},
                                      padding: EdgeInsets.only(
                                          left: 32,
                                          top: 8,
                                          right: 32,
                                          bottom: 8),
                                      pressedOpacity: 0.5,
                                      child: MyText.bodyMedium("Blue",
                                          color:
                                              theme.colorScheme.onSecondary)),
                                  CupertinoButton(
                                      color: Colors.green,
                                      onPressed: () {},
                                      padding: EdgeInsets.only(
                                          left: 32,
                                          top: 8,
                                          right: 32,
                                          bottom: 8),
                                      child: MyText.bodyMedium("Green",
                                          color:
                                              theme.colorScheme.onSecondary)),
                                  CupertinoButton(
                                      color: Colors.red,
                                      onPressed: () {},
                                      padding: EdgeInsets.only(
                                          left: 32,
                                          top: 8,
                                          right: 32,
                                          bottom: 8),
                                      child: MyText.bodyMedium("Red",
                                          color:
                                              theme.colorScheme.onSecondary)),
                                ],
                              ),
                            )
                          ],
                        ),
                      )
                    ])));
      },
    );
  }
}
