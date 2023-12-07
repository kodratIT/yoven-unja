import 'package:jambicraff/helpers/extensions/widgets_extension.dart';
import 'package:jambicraff/helpers/theme/app_theme.dart';
import 'package:jambicraff/helpers/widgets/my_text.dart';
import 'package:jambicraff/widgets/material/list/contact_list.dart';
import 'package:jambicraff/widgets/material/list/dismissible_list.dart';
import 'package:jambicraff/widgets/material/list/refresh_list.dart';
import 'package:jambicraff/widgets/material/list/reorderable_list.dart';
import 'package:jambicraff/widgets/material/list/selectable_list.dart';
import 'package:jambicraff/widgets/material/list/wheel_list.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';

class ListsScreen extends StatefulWidget {
  @override
  _ListsScreenState createState() => _ListsScreenState();
}

class _ListsScreenState extends State<ListsScreen> {
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
          'Lists',
          fontWeight: 600,
        ),
      ),
      body: DefaultTabController(
        length: 6,
        initialIndex: 0,
        child: Scaffold(
          appBar: AppBar(
            elevation: 1,
            toolbarHeight: 48,
            automaticallyImplyLeading: false,
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
      'Contacts',
      'Dismissible',
      'Wheel Scroll',
      'Refresh',
      'Re-Orderable',
      'Selectable',
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
      ContactList(),
      DismissibleList(),
      WheelList(),
      RefreshList(),
      ReOrderableList(),
      SelectableList(),
    ];
  }
}
