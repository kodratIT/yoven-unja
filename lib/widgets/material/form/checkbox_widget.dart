/*
* File : Checkbox
* Version : 1.0.0
* */

import 'package:yoven/helpers/theme/app_theme.dart';
import 'package:yoven/helpers/widgets/my_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:lucide_icons/lucide_icons.dart';

class CheckboxWidget extends StatefulWidget {
  @override
  _CheckboxWidgetState createState() => _CheckboxWidgetState();
}

class _CheckboxWidgetState extends State<CheckboxWidget> {
  bool? _check1 = false, _check2 = true, _check3 = false, _triState;

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
      tag: 'checkbox_widget',
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
              title: MyText.titleMedium("Checkbox", fontWeight: 600),
            ),
            body: Center(
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 0, horizontal: 16),
                child: Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Checkbox(
                          activeColor: theme.colorScheme.primary,
                          onChanged: (bool? value) {
                            setState(() {
                              _check1 = value;
                            });
                          },
                          value: _check1,
                        ),
                        MyText.titleSmall("Check 1", fontWeight: 600)
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Checkbox(
                          value: _check2,
                          activeColor: theme.colorScheme.primary,
                          onChanged: (bool? value) {
                            setState(() {
                              _check2 = value;
                            });
                          },
                        ),
                        MyText.titleSmall("Check 2", fontWeight: 600)
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Checkbox(
                          value: _check3,
                          activeColor: theme.colorScheme.primary,
                          onChanged: (bool? value) {
                            setState(() {
                              _check3 = value;
                            });
                          },
                        ),
                        MyText.titleSmall("Check 3", fontWeight: 600)
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Checkbox(
                          value: _triState,
                          tristate: true,
                          activeColor: theme.colorScheme.primary,
                          onChanged: (bool? value) {
                            setState(() {
                              _triState = value;
                            });
                          },
                        ),
                        MyText.titleSmall("Tri State", fontWeight: 600)
                      ],
                    ),
                  ],
                ),
              ),
            ));
      },
    );
  }
}
