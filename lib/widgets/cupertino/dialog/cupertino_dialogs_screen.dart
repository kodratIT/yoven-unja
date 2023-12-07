import 'package:jambicraff/helpers/extensions/widgets_extension.dart';
import 'package:jambicraff/helpers/theme/app_theme.dart';
import 'package:jambicraff/helpers/widgets/my_text.dart';
import 'package:jambicraff/widgets/cupertino/dialog/cupertino_action_sheet_screen.dart';
import 'package:jambicraff/widgets/cupertino/dialog/cupertino_alert_dialog_screen.dart';
import 'package:jambicraff/widgets/cupertino/dialog/cupertino_dialog_screen.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';

class CupertinoDialogsScreen extends StatefulWidget {
  @override
  _CupertinoDialogsScreenState createState() => _CupertinoDialogsScreenState();
}

class _CupertinoDialogsScreenState extends State<CupertinoDialogsScreen> {
  late ThemeData theme;

  @override
  void initState() {
    super.initState();
    theme = AppTheme.theme;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: Icon(
            LucideIcons.chevronLeft,
            size: 20,
          ).autoDirection(),
        ),
        title: MyText.titleMedium(
          'Cupertino Dialogs',
          fontWeight: 600,
        ),
      ),
      body: DefaultTabController(
        length: 3,
        initialIndex: 0,
        child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            elevation: 1,
            toolbarHeight: 48,
            flexibleSpace: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                /*-------------- Build Tabs here ------------------*/
                TabBar(isScrollable: true, tabs: getTabs())
              ],
            ),
          ),

          /*--------------- Build Tab body here -------------------*/
          body: TabBarView(children: getTabContents()),
        ),
      ),
    );
  }

  List<Tab> getTabs() {
    List<String> tabNames = [
      'Dialog',
      'Alert',
      'Action Sheet',
    ];

    List<Tab> tabs = [];

    for (String tabName in tabNames) {
      tabs.add(Tab(
          child: MyText.labelMedium(
        tabName,
        fontWeight: 700,
      )));
    }

    return tabs;
  }

  List<Widget> getTabContents() {
    return [
      CupertinoDialogScreen(),
      CupertinoAlertDialogScreen(),
      CupertinoActionSheetScreen(),
    ];
  }
}
