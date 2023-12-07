/*
* File : Toggle Button
* Version : 1.0.0
* */

import 'package:yoven/helpers/theme/app_theme.dart';
import 'package:yoven/helpers/widgets/my_text.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';

class ToggleButtonWidget extends StatefulWidget {
  @override
  _ToggleButtonWidgetState createState() => _ToggleButtonWidgetState();
}

class _ToggleButtonWidgetState extends State<ToggleButtonWidget> {
  late CustomTheme customTheme;
  late ThemeData theme;

  @override
  void initState() {
    super.initState();
    customTheme = AppTheme.customTheme;
    theme = AppTheme.theme;
  }

  List<bool> isSelected = [false, true, false];

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          elevation: 0,
          leading: InkWell(
            onTap: () => Navigator.of(context).pop(),
            child: Icon(
              LucideIcons.chevronLeft,
              size: 20,
            ),
          ),
          title: MyText.titleMedium("Toggle Button", fontWeight: 600),
        ),
        body: Container(
            color: theme.colorScheme.background,
            child: ListView(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(bottom: 8),
                        child: MyText.titleSmall("Simple", fontWeight: 700),
                      ),
                      ToggleButtons(
                        splashColor: theme.colorScheme.primary.withAlpha(48),
                        fillColor: Colors.transparent,
                        isSelected: isSelected,
                        onPressed: (int index) {
                          setState(() {
                            isSelected[index] = !isSelected[index];
                          });
                        },
                        children: const <Widget>[
                          Icon(Icons.format_bold),
                          Icon(Icons.format_italic),
                          Icon(Icons.link),
                        ],
                      ),
                      Container(
                        margin: EdgeInsets.only(bottom: 8, top: 16),
                        child: MyText.titleSmall("Filled", fontWeight: 700),
                      ),
                      ToggleButtons(
                        splashColor: theme.colorScheme.primary.withAlpha(48),
                        color: theme.colorScheme.onBackground,
                        fillColor: theme.colorScheme.primary.withAlpha(48),
                        selectedBorderColor:
                            theme.colorScheme.primary.withAlpha(48),
                        isSelected: isSelected,
                        onPressed: (int index) {
                          setState(() {
                            isSelected[index] = !isSelected[index];
                          });
                        },
                        children: const <Widget>[
                          Icon(Icons.format_bold),
                          Icon(Icons.format_italic),
                          Icon(Icons.link),
                        ],
                      ),
                      Container(
                        margin: EdgeInsets.only(bottom: 8, top: 16),
                        child: MyText.titleSmall("Bordered", fontWeight: 600),
                      ),
                      ToggleButtons(
                        splashColor: theme.colorScheme.primary.withAlpha(48),
                        color: theme.colorScheme.onBackground,
                        fillColor: theme.colorScheme.primary.withAlpha(48),
                        borderWidth: 1,
                        borderColor: theme.colorScheme.onBackground,
                        selectedBorderColor: theme.colorScheme.primary,
                        isSelected: isSelected,
                        onPressed: (int index) {
                          setState(() {
                            isSelected[index] = !isSelected[index];
                          });
                        },
                        children: const <Widget>[
                          Icon(Icons.format_bold),
                          Icon(Icons.format_italic),
                          Icon(Icons.link),
                        ],
                      ),
                      Container(
                        margin: EdgeInsets.only(bottom: 8, top: 16),
                        child: MyText.titleSmall("Curved", fontWeight: 600),
                      ),
                      ToggleButtons(
                        splashColor: theme.colorScheme.primary.withAlpha(48),
                        color: theme.colorScheme.onBackground,
                        fillColor: theme.colorScheme.primary.withAlpha(48),
                        borderWidth: 1,
                        borderColor: theme.colorScheme.onBackground,
                        selectedBorderColor: theme.colorScheme.primary,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(16),
                          bottomRight: Radius.circular(16),
                        ),
                        isSelected: isSelected,
                        onPressed: (int index) {
                          setState(() {
                            isSelected[index] = !isSelected[index];
                          });
                        },
                        children: const <Widget>[
                          Icon(Icons.format_bold),
                          Icon(Icons.format_italic),
                          Icon(Icons.link),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            )));
  }
}
