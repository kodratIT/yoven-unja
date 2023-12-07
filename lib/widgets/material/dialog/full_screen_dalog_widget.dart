/*
* File : Full Screen Dialog
* Version : 1.0.0
* */

import 'package:jambicraff/helpers/theme/app_theme.dart';
import 'package:jambicraff/helpers/widgets/my_text.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';

class FullScreenDialogWidget extends StatefulWidget {
  @override
  _FullScreenDialogWidgetState createState() => _FullScreenDialogWidgetState();
}

class _FullScreenDialogWidgetState extends State<FullScreenDialogWidget> {
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
          title: MyText.titleMedium("Full Screen", fontWeight: 600),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute<void>(
                builder: (BuildContext context) {
                  return FullDialog();
                },
                fullscreenDialog: true));
          },
          elevation: 2,
          child: Icon(Icons.add),
        ),
        body: Center(
          child: MyText.titleMedium("Tap on + to add new task",
              color: theme.colorScheme.onBackground),
        ));
  }
}

class FullDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: MyText.titleLarge('Add Task', fontWeight: 600),
        actions: <Widget>[
          Container(
            margin: EdgeInsets.only(right: 16),
            child: Material(
                child: InkWell(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: Icon(LucideIcons.check))),
          )
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          children: <Widget>[
            TextFormField(
              decoration: InputDecoration(
                labelText: "Task",
                hintText: "Type a task",
                border: theme.inputDecorationTheme.border,
                enabledBorder: theme.inputDecorationTheme.border,
                focusedBorder: theme.inputDecorationTheme.focusedBorder,
                prefixIcon: Icon(LucideIcons.stickyNote),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
