/*
* File : Radio
* Version : 1.0.0
* */

import 'package:jambicraff/helpers/theme/app_theme.dart';
import 'package:jambicraff/helpers/widgets/my_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:lucide_icons/lucide_icons.dart';

class RadioWidget extends StatefulWidget {
  @override
  _RadioWidgetState createState() => _RadioWidgetState();
}

class _RadioWidgetState extends State<RadioWidget> {
  int? _radioValue = 1;

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
      tag: 'radio_widget',
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
              title: MyText.titleMedium("Radio Button", fontWeight: 600),
            ),
            body: Center(
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 0, horizontal: 16),
                child: Column(
                  children: <Widget>[
                    ListTile(
                      title: MyText.titleSmall("Radio 1", fontWeight: 600),
                      contentPadding: EdgeInsets.all(0),
                      dense: true,
                      leading: Radio(
                        value: 1,
                        activeColor: theme.colorScheme.primary,
                        groupValue: _radioValue,
                        onChanged: (int? value) {
                          setState(() {
                            _radioValue = value;
                          });
                        },
                      ),
                    ),
                    ListTile(
                      title: MyText.titleSmall("Radio 2", fontWeight: 600),
                      contentPadding: EdgeInsets.all(0),
                      dense: true,
                      leading: Radio(
                        value: 2,
                        activeColor: theme.colorScheme.primary,
                        groupValue: _radioValue,
                        onChanged: (int? value) {
                          setState(() {
                            _radioValue = value;
                          });
                        },
                      ),
                    ),
                    ListTile(
                      title: MyText.titleSmall("Radio 3", fontWeight: 600),
                      contentPadding: EdgeInsets.all(0),
                      dense: true,
                      leading: Radio(
                        value: 3,
                        activeColor: theme.colorScheme.primary,
                        groupValue: _radioValue,
                        onChanged: (int? value) {
                          setState(() {
                            _radioValue = value;
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ));
      },
    );
  }
}
