/*
* File : Appbar widget
* Version : 1.0.0
* */

import 'package:yoven/helpers/extensions/extensions.dart';
import 'package:yoven/helpers/theme/app_theme.dart';
import 'package:yoven/helpers/widgets/my_spacing.dart';
import 'package:yoven/helpers/widgets/my_text.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';

class AppBarWidget extends StatefulWidget {
  @override
  _AppBarWidgetState createState() => _AppBarWidgetState();
}

class TextIconItem {
  String text;
  IconData iconData;

  TextIconItem(this.text, this.iconData);
}

class _AppBarWidgetState extends State<AppBarWidget> {
  late ThemeData theme;
  late CustomTheme customTheme;

  @override
  void initState() {
    super.initState();
    theme = AppTheme.theme;
    customTheme = AppTheme.customTheme;
  }

  final List<TextIconItem> _textIconChoice = [
    TextIconItem("Add new", Icons.add),
    TextIconItem("Find me", Icons.map),
    TextIconItem("Contact", Icons.email),
    TextIconItem("Setting", Icons.build),
  ];

  final List<String> _simpleChoice = [
    "Add new",
    "Find me",
    "Contact",
    "Setting"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: theme.scaffoldBackgroundColor,
        body: Container(
          margin: MySpacing.fromLTRB(16, 16, 16, 0),
          child: ListView(
            children: <Widget>[
              /*---------  Leading Icon Appbar ----------------*/
              AppBar(
                backgroundColor: theme.scaffoldBackgroundColor,
                leading: InkWell(
                  onTap: () => Navigator.of(context).pop(),
                  child: Icon(LucideIcons.chevronLeft).autoDirection(),
                ),
                title: MyText.titleMedium("Leading Icon", fontWeight: 600),
              ),

              /*---------  Trailing Icon Appbar ----------------*/
              Container(
                margin: EdgeInsets.only(top: 16),
                child: AppBar(
                  backgroundColor: theme.scaffoldBackgroundColor,
                  title: MyText.titleMedium("Trailing Icons", fontWeight: 600),
                  actions: <Widget>[
                    Padding(
                      padding: MySpacing.right(16),
                      child: Icon(
                        Icons.settings,
                        color: theme.appBarTheme.iconTheme!.color,
                      ),
                    ),
                    Padding(
                      padding: MySpacing.x(16),
                      child: Icon(
                        Icons.code,
                        color: theme.appBarTheme.iconTheme!.color,
                      ),
                    ),
                  ],
                ),
              ),

              /*---------  Simple Menu Appbar ----------------*/
              Container(
                margin: EdgeInsets.only(top: 16),
                child: AppBar(
                  backgroundColor: theme.scaffoldBackgroundColor,
                  title: MyText.titleMedium("Simple Menu", fontWeight: 600),
                  actions: <Widget>[
                    PopupMenuButton(
                      itemBuilder: (BuildContext context) {
                        return _simpleChoice.map((String choice) {
                          return PopupMenuItem(
                            value: choice,
                            child: Text(choice),
                          );
                        }).toList();
                      },
                    ),
                  ],
                ),
              ),

              /*---------  Menu with Icons Appbar ----------------*/
              Container(
                margin: EdgeInsets.only(top: 16),
                child: AppBar(
                  backgroundColor: theme.scaffoldBackgroundColor,
                  title: MyText.titleMedium("Menu with icons", fontWeight: 600),
                  actions: <Widget>[
                    PopupMenuButton(
                      itemBuilder: (BuildContext context) {
                        return _textIconChoice.map((TextIconItem choice) {
                          return PopupMenuItem(
                            value: choice,
                            child: Row(
                              children: <Widget>[
                                Icon(choice.iconData, size: 18),
                                MySpacing.width(8),
                                Text(choice.text)
                              ],
                            ),
                          );
                        }).toList();
                      },
                      color: theme.colorScheme.background,
                    ),
                  ],
                ),
              ),
              /*---------  Full Appbar ----------------*/
              Container(
                margin: MySpacing.top(16),
                child: AppBar(
                  backgroundColor: theme.scaffoldBackgroundColor,
                  title: MyText.titleMedium("Full app bar", fontWeight: 600),
                  leading: IconButton(
                    onPressed: () => Navigator.of(context).pop(),
                    icon: Icon(LucideIcons.chevronLeft),
                  ),
                  actions: <Widget>[
                    Padding(
                      padding: MySpacing.x(16),
                      child: Icon(Icons.settings),
                    ),
                    Icon(Icons.code),
                    PopupMenuButton(
                      itemBuilder: (BuildContext context) {
                        return _textIconChoice.map((TextIconItem choice) {
                          return PopupMenuItem(
                            value: choice,
                            child: Row(
                              children: <Widget>[
                                Icon(choice.iconData,
                                    size: 18,
                                    color: theme.colorScheme.onBackground),
                                MySpacing.width(8),
                                Text(choice.text,
                                    style: TextStyle(letterSpacing: 0.15)
                                        .merge(theme.textTheme.bodyMedium)
                                        .merge(TextStyle(
                                            color: theme
                                                .colorScheme.onBackground)))
                              ],
                            ),
                          );
                        }).toList();
                      },
                      color: theme.colorScheme.background,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
