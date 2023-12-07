/*
* File : Popup Menu with Icon
* Version : 1.0.0
* */

import 'package:jambicraff/helpers/theme/app_theme.dart';
import 'package:jambicraff/helpers/widgets/my_button.dart';
import 'package:jambicraff/helpers/widgets/my_text.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';

class PopupMenuWidget extends StatefulWidget {
  @override
  _PopupMenuWidgetState createState() => _PopupMenuWidgetState();
}

class TextIconItem {
  String text;
  IconData iconData;

  TextIconItem(this.text, this.iconData);
}

class _PopupMenuWidgetState extends State<PopupMenuWidget> {
  final GlobalKey _textIconMenuKey = GlobalKey();
  final GlobalKey _simpleMenuKey = GlobalKey();

  final List<String> _simpleChoice = [
    "Add new",
    "Find me",
    "Contact",
    "Setting"
  ];

  final List<TextIconItem> _textIconChoice = [
    TextIconItem("Add new", Icons.add),
    TextIconItem("Find me", Icons.map),
    TextIconItem("Contact", Icons.email),
    TextIconItem("Setting", Icons.build),
  ];

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
          title: MyText.titleMedium("Popup with icons", fontWeight: 600),
        ),
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              PopupMenuButton(
                key: _simpleMenuKey,
                itemBuilder: (BuildContext context) {
                  return _simpleChoice.map((String choice) {
                    return PopupMenuItem(
                        value: choice,
                        child: MyText(
                          choice,
                        ));
                  }).toList();
                },
                color: theme.colorScheme.background,
                child: MyButton(
                    elevation: 0,
                    borderRadiusAll: 4,
                    onPressed: () {
                      dynamic state = _simpleMenuKey.currentState;
                      state.showButtonMenu();
                    },
                    child: MyText.titleSmall("Popup Menu",
                        color: theme.colorScheme.onPrimary, fontWeight: 500)),
              ),
              PopupMenuButton(
                key: _textIconMenuKey,
                itemBuilder: (BuildContext context) {
                  return _textIconChoice.map((TextIconItem choice) {
                    return PopupMenuItem(
                      value: choice,
                      child: Row(
                        children: <Widget>[
                          Icon(choice.iconData,
                              size: 18, color: theme.colorScheme.onBackground),
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: MyText(
                              choice.text,
                            ),
                          )
                        ],
                      ),
                    );
                  }).toList();
                },
                child: MyButton(
                    elevation: 0,
                    borderRadiusAll: 4,
                    onPressed: () {
                      dynamic state = _textIconMenuKey.currentState;
                      state.showButtonMenu();
                    },
                    child: MyText.titleSmall("Text with icon menu",
                        color: theme.colorScheme.onPrimary, fontWeight: 500)),
              ),
            ],
          ),
        ));
  }
}
