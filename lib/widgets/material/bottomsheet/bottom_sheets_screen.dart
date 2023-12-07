/*
* File : Top Navigation widget
* Version : 1.0.0
* Description :
* */

import 'package:jambicraff/helpers/extensions/widgets_extension.dart';
import 'package:jambicraff/helpers/theme/app_theme.dart';
import 'package:jambicraff/helpers/widgets/my_text.dart';
import 'package:jambicraff/widgets/material/bottomsheet/account_bottom_sheet.dart';
import 'package:jambicraff/widgets/material/bottomsheet/draggable_scrollable_bottom_sheet.dart';
import 'package:jambicraff/widgets/material/bottomsheet/file_manager_bottom_sheet.dart';
import 'package:jambicraff/widgets/material/bottomsheet/finger_print_lock_bottom_sheet.dart';
import 'package:jambicraff/widgets/material/bottomsheet/gallery_bottom_sheet.dart';
import 'package:jambicraff/widgets/material/bottomsheet/quick_action_bottom_sheet.dart';
import 'package:jambicraff/widgets/material/bottomsheet/simple_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';

class BottomSheetsScreen extends StatefulWidget {
  @override
  _BottomSheetsScreenState createState() => _BottomSheetsScreenState();
}

class _BottomSheetsScreenState extends State<BottomSheetsScreen> {
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
          icon: Icon(LucideIcons.chevronLeft).autoDirection(),
        ),
        title: MyText.titleMedium(
          'Bottom Sheet',
          fontWeight: 600,
        ),
      ),
      body: DefaultTabController(
        length: 7,
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
          body: TabBarView(children: getTabContents()),
        ),
      ),
    );
  }

  List<Tab> getTabs() {
    List<String> tabNames = [
      'Simple',
      'Account',
      'Draggable',
      'File Manager',
      'Finger Print',
      'Gallery',
      'Quick Action',
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
      SimpleBottomSheet(),
      AccountBottomSheet(),
      DraggableScrollableBottomSheet(),
      FileManagerBottomSheet(),
      FingerprintLockBottomSheet(),
      GalleryBottomSheet(),
      QuickActionBottomSheet(),
    ];
  }
}
