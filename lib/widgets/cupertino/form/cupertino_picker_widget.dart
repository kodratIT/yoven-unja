/*
* File : Cupertino Picker
* Version : 1.0.0
* */

import 'package:yoven/helpers/theme/app_theme.dart';
import 'package:yoven/helpers/widgets/my_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:lucide_icons/lucide_icons.dart';

class CupertinoPickerWidget extends StatefulWidget {
  @override
  _CupertinoPickerWidgetState createState() => _CupertinoPickerWidgetState();
}

class _CupertinoPickerWidgetState extends State<CupertinoPickerWidget> {
  late CustomTheme customTheme;
  late ThemeData theme;

  @override
  void initState() {
    super.initState();
    customTheme = AppTheme.customTheme;
    theme = AppTheme.theme;
  }

  int? selectedValue;

  showPicker() {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return SizedBox(
            height: 300,
            child: CupertinoPicker(
              backgroundColor: theme.colorScheme.background,
              onSelectedItemChanged: (value) {
                setState(() {
                  selectedValue = value;
                });
              },
              itemExtent: 40.0,
              children: [
                MyText('Item - 1', color: theme.colorScheme.onBackground),
                MyText('Item - 2', color: theme.colorScheme.onBackground),
                MyText('Item - 3', color: theme.colorScheme.onBackground),
                MyText('Item - 4', color: theme.colorScheme.onBackground),
                MyText('Item - 5', color: theme.colorScheme.onBackground),
                MyText('Item - 6', color: theme.colorScheme.onBackground),
              ],
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      tag: 'cupertino_picker_widget',
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
              title: MyText.titleMedium("Cupertino Picker", fontWeight: 600),
            ),
            body: Container(
                color: theme.colorScheme.background,
                child: Center(
                  child: CupertinoButton(
                      color: theme.colorScheme.primary,
                      onPressed: () {
                        showPicker();
                      },
                      padding: EdgeInsets.only(
                          left: 32, top: 8, right: 32, bottom: 8),
                      pressedOpacity: 0.5,
                      child: MyText.bodyMedium("Pick",
                          color: theme.colorScheme.onSecondary)),
                )));
      },
    );
  }
}
