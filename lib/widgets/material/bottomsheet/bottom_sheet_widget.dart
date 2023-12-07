/*
* File : Bottom Sheet
* Version : 1.0.0
* */

import 'package:yoven/helpers/theme/app_theme.dart';
import 'package:yoven/helpers/widgets/my_button.dart';
import 'package:yoven/helpers/widgets/my_text.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';

class BottomSheetWidget extends StatefulWidget {
  @override
  _BottomSheetWidgetState createState() => _BottomSheetWidgetState();
}

class _BottomSheetWidgetState extends State<BottomSheetWidget> {
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
          title: MyText.titleMedium("Bottom Sheet", fontWeight: 600),
        ),
        body: Center(
          child: MyButton(
              borderRadiusAll: 4,
              onPressed: () {
                _showBottomSheet(context);
              },
              child: MyText.titleSmall("Show bottom sheet",
                  color: theme.colorScheme.onSecondary)),
        ));
  }

  void _showBottomSheet(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext buildContext) {
          return Container(
            decoration: BoxDecoration(
                color: theme.colorScheme.background,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(16),
                    topRight: Radius.circular(16))),
            child: Padding(
              padding:
                  EdgeInsets.only(top: 24, left: 24, right: 24, bottom: 36),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          Icon(LucideIcons.users,
                              size: 26, color: theme.colorScheme.onBackground),
                          Container(
                            margin: EdgeInsets.only(top: 4),
                            child: MyText(
                              "180 Followers",
                              color: theme.colorScheme.onBackground,
                              textAlign: TextAlign.center,
                            ),
                          )
                        ],
                      ),
                      Column(
                        children: <Widget>[
                          Icon(LucideIcons.users,
                              size: 26, color: theme.colorScheme.onBackground),
                          Container(
                            margin: EdgeInsets.only(top: 4),
                            child: MyText("147 Following",
                                textAlign: TextAlign.center,
                                color: theme.colorScheme.onBackground),
                          )
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        });
  }
}
