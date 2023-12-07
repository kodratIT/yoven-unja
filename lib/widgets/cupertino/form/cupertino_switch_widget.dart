/*
* File : Cupertino Switch
* Version : 1.0.0
* */

import 'package:yoven/helpers/theme/app_theme.dart';
import 'package:yoven/helpers/widgets/my_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:lucide_icons/lucide_icons.dart';

class CupertinoSwitchWidget extends StatefulWidget {
  @override
  _CupertinoSwitchWidgetState createState() => _CupertinoSwitchWidgetState();
}

class _CupertinoSwitchWidgetState extends State<CupertinoSwitchWidget> {
  late CustomTheme customTheme;
  late ThemeData theme;

  @override
  void initState() {
    super.initState();
    customTheme = AppTheme.customTheme;
    theme = AppTheme.theme;
  }

  bool _switch1 = true, _switch2 = true, _switch3 = false;

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      tag: 'cupertino_switch_widget',
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
              title: MyText.titleMedium("Switch", fontWeight: 600),
            ),
            body: Container(
                color: theme.colorScheme.background,
                child: Center(
                  child: Column(
                    children: <Widget>[
                      MergeSemantics(
                        child: ListTile(
                          title: MyText.bodyLarge('Simple', fontWeight: 600),
                          trailing: CupertinoSwitch(
                            value: _switch1,
                            onChanged: (bool value) {
                              setState(() {
                                _switch1 = value;
                              });
                            },
                          ),
                          onTap: () {
                            setState(() {
                              _switch1 = !_switch1;
                            });
                          },
                        ),
                      ),
                      MergeSemantics(
                        child: ListTile(
                          title:
                              MyText.bodyLarge('Thumb Color', fontWeight: 600),
                          trailing: CupertinoSwitch(
                            activeColor: theme.colorScheme.primary,
                            value: _switch2,
                            onChanged: (bool value) {
                              setState(() {
                                _switch2 = value;
                              });
                            },
                          ),
                          onTap: () {
                            setState(() {
                              _switch2 = !_switch2;
                            });
                          },
                        ),
                      ),
                      MergeSemantics(
                        child: ListTile(
                          title:
                              MyText.bodyLarge('Track Color', fontWeight: 600),
                          trailing: CupertinoSwitch(
                            activeColor: theme.colorScheme.primary,
                            trackColor: theme.colorScheme.secondary,
                            value: _switch3,
                            onChanged: (bool value) {
                              setState(() {
                                _switch3 = value;
                              });
                            },
                          ),
                          onTap: () {
                            setState(() {
                              _switch3 = !_switch3;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                )));
      },
    );
  }
}
