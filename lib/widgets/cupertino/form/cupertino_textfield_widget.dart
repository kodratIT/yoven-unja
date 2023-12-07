/*
* File : Cupertino TextField
* Version : 1.0.0
* */

import 'package:jambicraff/helpers/theme/app_theme.dart';
import 'package:jambicraff/helpers/widgets/my_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:lucide_icons/lucide_icons.dart';

class CupertinoTextfieldWidget extends StatefulWidget {
  @override
  _CupertinoTextfieldWidgetState createState() =>
      _CupertinoTextfieldWidgetState();
}

class _CupertinoTextfieldWidgetState extends State<CupertinoTextfieldWidget> {
  late CustomTheme customTheme;
  late ThemeData theme;

  @override
  void initState() {
    super.initState();
    customTheme = AppTheme.customTheme;
    theme = AppTheme.theme;
  }

  bool _passwordVisible = false;

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      tag: 'cupertino_textfield_widget',
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
            title: MyText.titleMedium("Text Field", fontWeight: 600),
          ),
          body: Container(
            color: theme.colorScheme.background,
            padding: EdgeInsets.only(top: 16, bottom: 16),
            child: ListView(children: <Widget>[
              Container(
                padding: EdgeInsets.only(left: 16, bottom: 8),
                child: MyText.titleSmall("Simple", fontWeight: 500),
              ),
              Container(
                padding: EdgeInsets.only(left: 16, right: 16),
                child: CupertinoTextField(
                  decoration:
                      BoxDecoration(color: theme.colorScheme.background),
                  cursorColor: theme.colorScheme.secondary,
                  placeholder: "Email",
                  style: TextStyle(color: theme.colorScheme.onBackground),
                  placeholderStyle: TextStyle(
                      color: theme.colorScheme.onBackground.withAlpha(160)),
                  padding:
                      EdgeInsets.only(top: 16, bottom: 16, left: 8, right: 8),
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 16, left: 16, bottom: 8),
                child: MyText.titleSmall("Bordered", fontWeight: 500),
              ),
              Container(
                padding: EdgeInsets.only(left: 16, right: 16),
                child: CupertinoTextField(
                  decoration: BoxDecoration(
                      color: theme.colorScheme.background,
                      border: Border.all(color: theme.colorScheme.primary)),
                  cursorColor: theme.colorScheme.primary,
                  placeholder: "Email",
                  style: TextStyle(color: theme.colorScheme.onBackground),
                  padding:
                      EdgeInsets.only(top: 16, bottom: 16, left: 8, right: 8),
                  placeholderStyle: TextStyle(
                      color: theme.colorScheme.onBackground.withAlpha(160)),
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 16, left: 16, bottom: 8),
                child: MyText.titleSmall("Prefix Icon", fontWeight: 500),
              ),
              Container(
                padding: EdgeInsets.only(left: 16, right: 16),
                child: CupertinoTextField(
                  decoration: BoxDecoration(
                      color: theme.colorScheme.background,
                      border: Border.all(color: theme.colorScheme.primary)),
                  cursorColor: theme.colorScheme.primary,
                  placeholder: "Email",
                  prefix: Padding(
                    padding: EdgeInsets.only(left: 8),
                    child: Icon(
                      LucideIcons.mail,
                      color: theme.colorScheme.primary,
                    ),
                  ),
                  style: TextStyle(color: theme.colorScheme.onBackground),
                  padding:
                      EdgeInsets.only(top: 16, bottom: 16, left: 8, right: 8),
                  placeholderStyle: TextStyle(
                      color: theme.colorScheme.onBackground.withAlpha(160)),
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 16, left: 16, bottom: 8),
                child: MyText.titleSmall("Suffix Icon", fontWeight: 600),
              ),
              Container(
                padding: EdgeInsets.only(left: 16, right: 16),
                child: CupertinoTextField(
                  decoration: BoxDecoration(
                      color: theme.colorScheme.background,
                      border: Border.all(color: theme.colorScheme.primary)),
                  cursorColor: theme.colorScheme.primary,
                  placeholder: "Contact",
                  suffix: Padding(
                    padding: EdgeInsets.only(right: 8),
                    child: Icon(
                      LucideIcons.contact,
                      color: theme.colorScheme.primary,
                    ),
                  ),
                  style: TextStyle(color: theme.colorScheme.onBackground),
                  padding:
                      EdgeInsets.only(top: 16, bottom: 16, left: 8, right: 8),
                  placeholderStyle: TextStyle(
                      color: theme.colorScheme.onBackground.withAlpha(160)),
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 16, left: 16, bottom: 8),
                child: MyText.titleSmall("Both Icon", fontWeight: 600),
              ),
              Container(
                padding: EdgeInsets.only(left: 16, right: 16),
                child: CupertinoTextField(
                  obscureText: _passwordVisible,
                  decoration: BoxDecoration(
                      color: theme.colorScheme.background,
                      border: Border.all(color: theme.colorScheme.primary)),
                  cursorColor: theme.colorScheme.primary,
                  placeholder: "Password",
                  prefix: Padding(
                    padding: EdgeInsets.only(left: 8),
                    child: Icon(
                      LucideIcons.lock,
                      color: theme.colorScheme.primary,
                    ),
                  ),
                  suffix: GestureDetector(
                    onTap: () {
                      setState(() {
                        _passwordVisible = _passwordVisible;
                      });
                    },
                    child: Padding(
                      padding: EdgeInsets.only(right: 8),
                      child: Icon(
                        _passwordVisible ? LucideIcons.eye : LucideIcons.eyeOff,
                        color: theme.colorScheme.primary,
                      ),
                    ),
                  ),
                  placeholderStyle: TextStyle(
                      color: theme.colorScheme.onBackground.withAlpha(160)),
                  style: TextStyle(color: theme.colorScheme.onBackground),
                  padding:
                      EdgeInsets.only(top: 16, bottom: 16, left: 8, right: 8),
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 16, left: 16, bottom: 8),
                child: MyText.titleSmall("Rounded", fontWeight: 600),
              ),
              Container(
                padding: EdgeInsets.only(left: 16, right: 16),
                child: CupertinoTextField(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(24)),
                      color: theme.colorScheme.background,
                      border: Border.all(color: theme.colorScheme.primary)),
                  cursorColor: theme.colorScheme.primary,
                  placeholder: "Email",
                  prefix: Padding(
                    padding: EdgeInsets.only(left: 8),
                    child: Icon(
                      LucideIcons.mail,
                      color: theme.colorScheme.primary,
                    ),
                  ),
                  placeholderStyle: TextStyle(
                      color: theme.colorScheme.onBackground.withAlpha(160)),
                  style: TextStyle(color: theme.colorScheme.onBackground),
                  padding:
                      EdgeInsets.only(top: 16, bottom: 16, left: 8, right: 8),
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 16, left: 16, bottom: 8),
                child: MyText.titleSmall("Text Area", fontWeight: 500),
              ),
              Container(
                padding: EdgeInsets.only(left: 16, right: 16),
                child: CupertinoTextField(
                  decoration: BoxDecoration(
                      color: theme.colorScheme.background,
                      border: Border.all(color: theme.colorScheme.primary)),
                  cursorColor: theme.colorScheme.primary,
                  placeholder: "Comment me",
                  placeholderStyle: TextStyle(
                      color: theme.colorScheme.onBackground.withAlpha(160)),
                  minLines: 4,
                  maxLines: 6,
                  style: TextStyle(color: theme.colorScheme.onBackground),
                  padding:
                      EdgeInsets.only(top: 16, bottom: 16, left: 8, right: 8),
                ),
              ),
            ]),
          ),
        );
      },
    );
  }
}
