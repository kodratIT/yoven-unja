/*
* File : Simple Chip
* Version : 1.0.0
* */

import 'package:jambicraff/helpers/theme/app_theme.dart';
import 'package:jambicraff/helpers/widgets/my_spacing.dart';
import 'package:jambicraff/helpers/widgets/my_text.dart';
import 'package:flutter/material.dart';

class SimpleChipScreen extends StatefulWidget {
  @override
  _SimpleChipScreenState createState() => _SimpleChipScreenState();
}

class _SimpleChipScreenState extends State<SimpleChipScreen> {
  late ThemeData theme;
  late CustomTheme customTheme;

  @override
  void initState() {
    super.initState();
    theme = AppTheme.theme;
    customTheme = AppTheme.customTheme;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Chip(
            backgroundColor: customTheme.card,
            label: MyText.titleMedium('Simple',
                color: theme.colorScheme.onBackground),
          ),
          MySpacing.height(4),
          Chip(
            backgroundColor: customTheme.card,
            avatar: CircleAvatar(
              backgroundColor: theme.colorScheme.primary,
              child:
                  MyText.titleMedium('L', color: theme.colorScheme.onSecondary),
            ),
            label: MyText.titleMedium('Leading',
                color: theme.colorScheme.onBackground),
          ),
          MySpacing.height(4),
          Chip(
            deleteIconColor: theme.colorScheme.secondary,
            backgroundColor: customTheme.card,
            onDeleted: () {
              showSimpleSnackBar("Delete pressed");
            },
            label: MyText.titleMedium(
              'Trailing',
              color: theme.colorScheme.onBackground,
            ),
          ),
          MySpacing.height(4),
          Chip(
            deleteIconColor: theme.colorScheme.secondary,
            backgroundColor: customTheme.card,
            avatar: CircleAvatar(
              backgroundColor: theme.colorScheme.primary,
              child:
                  MyText.titleMedium('S', color: theme.colorScheme.onPrimary),
            ),
            onDeleted: () {
              showSimpleSnackBar("Delete pressed");
            },
            label: MyText.titleMedium('Small',
                color: theme.colorScheme.onBackground),
          ),
          MySpacing.height(4),
          Chip(
            padding: EdgeInsets.all(8),
            deleteIconColor: theme.colorScheme.secondary,
            backgroundColor: customTheme.card,
            avatar: CircleAvatar(
              backgroundColor: theme.colorScheme.primary,
              child: MyText.titleSmall(
                'M',
                color: theme.colorScheme.onPrimary,
              ),
            ),
            onDeleted: () {
              showSimpleSnackBar("Delete pressed");
            },
            label: MyText.titleMedium('Medium',
                color: theme.colorScheme.onBackground),
          ),
          MySpacing.height(4),
          Chip(
            padding: EdgeInsets.all(8),
            deleteIcon: Icon(Icons.delete),
            backgroundColor: customTheme.card,
            deleteIconColor: theme.colorScheme.secondary,
            onDeleted: () {
              showSimpleSnackBar("Delete pressed");
            },
            label: MyText.titleMedium('Custom Icon',
                color: theme.colorScheme.onBackground),
          ),
          MySpacing.height(4),
          Chip(
            deleteButtonTooltipMessage: "Custom Message",
            padding: EdgeInsets.all(8),
            avatar: CircleAvatar(
              backgroundColor: theme.colorScheme.primary,
              child: MyText.titleSmall('H', color: theme.colorScheme.onPrimary),
            ),
            deleteIconColor: theme.colorScheme.secondary,
            backgroundColor: customTheme.card,
            onDeleted: () {
              showSimpleSnackBar("Delete pressed");
            },
            label: MyText.titleMedium('Hold Delete',
                color: theme.colorScheme.onBackground),
          ),
          MySpacing.height(4),
          Chip(
            padding: EdgeInsets.all(8),
            elevation: 10,
            avatar: CircleAvatar(
              backgroundColor: theme.colorScheme.primary,
              child: MyText.titleSmall('E', color: theme.colorScheme.onPrimary),
            ),
            deleteIconColor: theme.colorScheme.secondary,
            backgroundColor: customTheme.card,
            onDeleted: () {
              showSimpleSnackBar("Delete pressed");
            },
            label: MyText.titleMedium('Elevated',
                color: theme.colorScheme.onBackground),
          ),
        ],
      ),
    ));
  }

  void showSimpleSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: MyText.titleSmall(message, color: theme.colorScheme.onPrimary),
        backgroundColor: theme.colorScheme.primary,
      ),
    );
  }
}
