import 'package:yoven/helpers/theme/app_theme.dart';
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
  late CustomTheme customTheme;
  late ThemeData theme;

  @override
  void initState() {
    super.initState();
    customTheme = AppTheme.customTheme;
    theme = AppTheme.theme;
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
          margin: EdgeInsets.only(left: 16, right: 16, top: 16),
          child: ListView(
            children: <Widget>[
              /*---------  Leading Icon Appbar ----------------*/
              AppBar(
                backgroundColor: theme.appBarTheme.backgroundColor,
                leading: IconButton(
                  onPressed: () => Navigator.of(context).pop(),
                  icon: Icon(LucideIcons.chevronLeft),
                ),
                title: MyText.titleMedium("Leading Icon", fontWeight: 600),
              ),

              /*---------  Trailing Icon Appbar ----------------*/
              Container(
                margin: EdgeInsets.only(top: 16),
                child: AppBar(
                  backgroundColor: theme.appBarTheme.backgroundColor,
                  title: MyText.titleMedium("Trailing Icons", fontWeight: 600),
                  actions: const <Widget>[
                    Padding(
                      padding: EdgeInsets.only(right: 16),
                      child: Icon(
                        Icons.settings,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 16),
                      child: Icon(
                        Icons.code,
                      ),
                    ),
                  ],
                ),
              ),

              /*---------  Simple Menu Appbar ----------------*/
              Container(
                margin: EdgeInsets.only(top: 16),
                child: AppBar(
                  backgroundColor: theme.appBarTheme.backgroundColor,
                  title: MyText.titleMedium("Simple Menu", fontWeight: 600),
                  actions: <Widget>[
                    PopupMenuButton(
                      itemBuilder: (BuildContext context) {
                        return _simpleChoice.map((String choice) {
                          return PopupMenuItem(
                            value: choice,
                            child: MyText(choice),
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
                  title: MyText.titleMedium("Menu with icons", fontWeight: 600),
                  actions: <Widget>[
                    PopupMenuButton(
                      itemBuilder: (BuildContext context) {
                        return _textIconChoice.map((TextIconItem choice) {
                          return PopupMenuItem(
                            value: choice,
                            child: Row(
                              children: <Widget>[
                                Icon(choice.iconData,
                                    size: 18,
                                    color:
                                        theme.popupMenuTheme.textStyle!.color),
                                Padding(
                                  padding: EdgeInsets.only(left: 8),
                                  child: MyText(choice.text),
                                )
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
                margin: EdgeInsets.only(top: 16),
                child: AppBar(
                  title: MyText.titleMedium("Full app bar", fontWeight: 600),
                  leading: IconButton(
                    onPressed: () => Navigator.of(context).pop(),
                    icon: Icon(LucideIcons.chevronLeft),
                  ),
                  actions: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(right: 16),
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
                                Padding(
                                    padding: EdgeInsets.only(left: 8),
                                    child: MyText(
                                      choice.text,
                                    ))
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
