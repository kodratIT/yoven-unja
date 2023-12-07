/*
* File : Simple Chip
* Version : 1.0.0
* */

import 'package:yoven/helpers/theme/app_theme.dart';
import 'package:yoven/helpers/widgets/my_text.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';

class SimpleChipWidget extends StatefulWidget {
  @override
  _SimpleChipWidgetState createState() => _SimpleChipWidgetState();
}

class _SimpleChipWidgetState extends State<SimpleChipWidget> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey =
      GlobalKey<ScaffoldMessengerState>();

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
          title: MyText.titleMedium("Simple Chip", fontWeight: 600),
        ),
        body: Container(
            width: MediaQuery.of(context).size.width,
            color: theme.colorScheme.background,
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Chip(
                    backgroundColor: theme.colorScheme.background,
                    label: MyText.titleMedium('Simple',
                        color: theme.colorScheme.onBackground),
                  ),
                  Chip(
                    backgroundColor: theme.colorScheme.background,
                    avatar: CircleAvatar(
                      backgroundColor: theme.colorScheme.primary,
                      child: MyText.titleMedium('L',
                          color: theme.colorScheme.onSecondary),
                    ),
                    label: MyText.titleMedium('Leading',
                        color: theme.colorScheme.onBackground),
                  ),
                  Chip(
                    deleteIconColor: theme.colorScheme.secondary,
                    backgroundColor: theme.colorScheme.background,
                    onDeleted: () {
                      showSimpleSnackbar("Delete pressed");
                    },
                    label: MyText.titleMedium('Trailing',
                        color: theme.colorScheme.onBackground),
                  ),
                  Chip(
                    deleteIconColor: theme.colorScheme.secondary,
                    backgroundColor: theme.colorScheme.background,
                    avatar: CircleAvatar(
                      backgroundColor: theme.colorScheme.primary,
                      child: MyText.titleMedium('S',
                          color: theme.colorScheme.onPrimary),
                    ),
                    onDeleted: () {
                      showSimpleSnackbar("Delete pressed");
                    },
                    label: MyText.titleMedium('Small',
                        color: theme.colorScheme.onBackground),
                  ),
                  Chip(
                    padding: EdgeInsets.all(8),
                    deleteIconColor: theme.colorScheme.secondary,
                    backgroundColor: theme.colorScheme.background,
                    avatar: CircleAvatar(
                      backgroundColor: theme.colorScheme.primary,
                      child: MyText.titleSmall('M',
                          color: theme.colorScheme.onPrimary),
                    ),
                    onDeleted: () {
                      showSimpleSnackbar("Delete pressed");
                    },
                    label: MyText.titleMedium('Medium',
                        color: theme.colorScheme.onBackground),
                  ),
                  Chip(
                    padding: EdgeInsets.all(8),
                    deleteIcon: Icon(LucideIcons.delete),
                    backgroundColor: theme.colorScheme.background,
                    deleteIconColor: theme.colorScheme.secondary,
                    onDeleted: () {
                      showSimpleSnackbar("Delete pressed");
                    },
                    label: MyText.titleMedium('Custom Icon',
                        color: theme.colorScheme.onBackground),
                  ),
                  Chip(
                    deleteButtonTooltipMessage: "Custom Message",
                    padding: EdgeInsets.all(8),
                    avatar: CircleAvatar(
                      backgroundColor: theme.colorScheme.primary,
                      child: MyText.titleSmall('H',
                          color: theme.colorScheme.onPrimary),
                    ),
                    deleteIconColor: theme.colorScheme.secondary,
                    backgroundColor: theme.colorScheme.background,
                    onDeleted: () {
                      showSimpleSnackbar("Delete pressed");
                    },
                    label: MyText.titleMedium('Hold Delete',
                        color: theme.colorScheme.onBackground),
                  ),
                  Chip(
                    padding: EdgeInsets.all(8),
                    elevation: 10,
                    avatar: CircleAvatar(
                      backgroundColor: theme.colorScheme.primary,
                      child: MyText.titleSmall('E',
                          color: theme.colorScheme.onPrimary),
                    ),
                    deleteIconColor: theme.colorScheme.secondary,
                    backgroundColor: theme.colorScheme.background,
                    onDeleted: () {
                      showSimpleSnackbar("Delete pressed");
                    },
                    label: MyText.titleMedium('Elevated',
                        color: theme.colorScheme.onBackground),
                  ),
                ],
              ),
            )));
  }

  void showSimpleSnackbar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: MyText.titleSmall(message, color: theme.colorScheme.onPrimary),
        backgroundColor: theme.colorScheme.primary,
      ),
    );
  }
}
