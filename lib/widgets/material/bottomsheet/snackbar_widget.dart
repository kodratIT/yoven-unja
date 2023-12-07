/*
* File : Snack Bars
* Version : 1.0.0
* */

import 'package:yoven/helpers/theme/app_theme.dart';
import 'package:yoven/helpers/widgets/my_button.dart';
import 'package:yoven/helpers/widgets/my_text.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';

class SnackbarWidget extends StatefulWidget {
  @override
  _Widget createState() => _Widget();
}

class _Widget extends State<SnackbarWidget>
    with SingleTickerProviderStateMixin {
  late CustomTheme customTheme;
  late ThemeData theme;

  @override
  void initState() {
    super.initState();
    customTheme = AppTheme.customTheme;
    theme = AppTheme.theme;
    controller =
        AnimationController(duration: const Duration(seconds: 20), vsync: this);
    animation = Tween<double>(begin: 0, end: 3).animate(controller);
  }

  Animation<double>? animation;
  late AnimationController controller;

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
          title: MyText.titleMedium("Snack Bars", fontWeight: 600),
        ),
        body: Container(
          height: double.infinity,
          width: double.infinity,
          color: theme.colorScheme.background,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: <Widget>[
                MyButton(
                    elevation: 0,
                    borderRadiusAll: 4,
                    onPressed: () {
                      showSimpleSnackbar();
                    },
                    child: MyText.bodyMedium("Simple snack bar",
                        color: theme.colorScheme.onSecondary)),
                MyButton(
                    elevation: 0,
                    borderRadiusAll: 4,
                    onPressed: () {
                      showSnackbarWithAction();
                    },
                    child: MyText.bodyMedium("Snack bar with actions",
                        color: theme.colorScheme.onSecondary)),
                MyButton(
                    elevation: 0,
                    borderRadiusAll: 4,
                    onPressed: () {
                      showSnackbarWithFloating();
                    },
                    child: MyText.bodyMedium("Floating snackbar",
                        color: theme.colorScheme.onSecondary)),
                MyButton(
                  elevation: 0,
                  borderRadiusAll: 4,
                  onPressed: () {
                    showSnackbarWithFloatingAction();
                  },
                  child: MyText.bodyMedium("Floating snackbar with action",
                      color: theme.colorScheme.onSecondary),
                )
              ],
            ),
          ),
        ));
  }

  void showSimpleSnackbar() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: MyText.titleSmall("This is simple snack bar",
            color: theme.colorScheme.onPrimary),
        backgroundColor: theme.colorScheme.primary,
      ),
    );
  }

  void showSnackbarWithAction() {
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

  void showSnackbarWithFloating() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: MyText.titleSmall("Message has been deleted",
            color: theme.colorScheme.onPrimary),
        backgroundColor: theme.colorScheme.primary,
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  void showSnackbarWithFloatingAction() {
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
