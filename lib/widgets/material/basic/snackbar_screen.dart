/*
* File : Snack Bars
* Version : 1.0.0
* */

import 'package:yoven/helpers/theme/app_theme.dart';
import 'package:yoven/helpers/widgets/my_button.dart';
import 'package:yoven/helpers/widgets/my_spacing.dart';
import 'package:yoven/helpers/widgets/my_text.dart';
import 'package:flutter/material.dart';

class SnackBarScreen extends StatefulWidget {
  @override
  _Widget createState() => _Widget();
}

class _Widget extends State<SnackBarScreen>
    with SingleTickerProviderStateMixin {
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
        body: Padding(
      padding: MySpacing.all(8),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            MyButton(
                elevation: 0,
                borderRadiusAll: 4,
                onPressed: () {
                  showSimpleSnackbar();
                },
                padding: MySpacing.xy(20, 16),
                child: MyText.bodyMedium("Simple snack bar",
                    color: theme.colorScheme.onPrimary)),
            MySpacing.height(12),
            MyButton(
                elevation: 0,
                borderRadiusAll: 4,
                onPressed: () {
                  showSnackBarWithAction();
                },
                padding: MySpacing.xy(20, 16),
                child: MyText.bodyMedium("Snack bar with actions",
                    color: theme.colorScheme.onPrimary)),
            MySpacing.height(12),
            MyButton(
                elevation: 0,
                borderRadiusAll: 4,
                onPressed: () {
                  showSnackBarWithFloating();
                },
                padding: MySpacing.xy(20, 16),
                child: MyText.bodyMedium("Floating snackbar",
                    color: theme.colorScheme.onPrimary)),
            MySpacing.height(12),
            MyButton(
                elevation: 0,
                borderRadiusAll: 4,
                onPressed: () {
                  showSnackBarWithFloatingAction();
                },
                padding: MySpacing.xy(20, 16),
                child: MyText.bodyMedium("Floating snackbar with action",
                    color: theme.colorScheme.onPrimary)),
          ],
        ),
      ),
    ));
  }

  void showSimpleSnackbar() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          "This is simple snack bar",
          style: theme.textTheme.titleSmall!
              .merge(TextStyle(color: theme.colorScheme.onPrimary)),
        ),
        backgroundColor: theme.colorScheme.primary,
      ),
    );
  }

  void showSnackBarWithAction() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: MyText.titleSmall("Message has been deleted",
            color: theme.colorScheme.onPrimary),
        backgroundColor: theme.colorScheme.primary,
        action: SnackBarAction(
          onPressed: () {},
          label: "Undo",
          textColor: theme.colorScheme.onPrimary,
        ),
      ),
    );
  }

  void showSnackBarWithFloating() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: MyText.titleSmall("Message has been deleted",
            color: theme.colorScheme.onPrimary),
        backgroundColor: theme.colorScheme.primary,
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  void showSnackBarWithFloatingAction() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: MyText.titleSmall("Message has been deleted",
            color: theme.colorScheme.onPrimary),
        backgroundColor: theme.colorScheme.primary,
        action: SnackBarAction(
          onPressed: () {},
          label: "Undo",
          textColor: theme.colorScheme.onPrimary,
        ),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }
}
