import 'package:yoven/helpers/extensions/extensions.dart';
import 'package:yoven/helpers/theme/app_theme.dart';
import 'package:yoven/helpers/widgets/my_spacing.dart';
import 'package:yoven/helpers/widgets/my_text.dart';
import 'package:yoven/widgets/material/dialog/account_dialog.dart';
import 'package:yoven/widgets/material/dialog/add_contact_dialog.dart';
import 'package:yoven/widgets/material/dialog/comment_dialog.dart';
import 'package:yoven/widgets/material/dialog/import_contact_dialog.dart';
import 'package:yoven/widgets/material/dialog/permission_dialog.dart';
import 'package:yoven/widgets/material/dialog/policy_dialog.dart';
import 'package:yoven/widgets/material/dialog/post_dialog.dart';
import 'package:yoven/widgets/material/dialog/simple_dialog_screen.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';

class DialogsScreen extends StatefulWidget {
  @override
  _DialogsScreenState createState() => _DialogsScreenState();
}

class _DialogsScreenState extends State<DialogsScreen> {
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
          'Dialogs',
          fontWeight: 600,
        ),
      ),
      body: DefaultTabController(
        length: 8,
        initialIndex: 0,
        child: Scaffold(
          appBar: AppBar(
            elevation: 1,
            automaticallyImplyLeading: false,
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
          body: Container(
              padding: MySpacing.all(16),
              child: TabBarView(children: getTabContents())),
        ),
      ),
    );
  }

  List<Tab> getTabs() {
    List<String> tabNames = [
      'Simple',
      'Policy',
      'Account',
      'Add Contact',
      'Comment',
      'Post',
      'Import Contact',
      'Permission',
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
      SimpleDialogScreen(),
      PolicyDialog(),
      AccountDialog(),
      AddContactDialog(),
      CommentDialog(),
      PostDialog(),
      ImportContactDialog(),
      PermissionDialog(),
    ];
  }
}
