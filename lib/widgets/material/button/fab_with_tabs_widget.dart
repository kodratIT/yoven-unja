/*
* File : FAB with Tabs
* Version : 1.0.0
* */

import 'package:yoven/helpers/theme/app_theme.dart';
import 'package:yoven/helpers/widgets/my_text.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';

class FABWithTabsWidget extends StatefulWidget {
  @override
  _FABWithTabsWidgetState createState() => _FABWithTabsWidgetState();
}

class _FABWithTabsWidgetState extends State<FABWithTabsWidget>
    with SingleTickerProviderStateMixin {
  late CustomTheme customTheme;
  late ThemeData theme;

  @override
  void initState() {
    super.initState();
    customTheme = AppTheme.customTheme;
    theme = AppTheme.theme;
    _tabController = TabController(length: 2, vsync: this, initialIndex: 0);
    _tabController!.addListener(_handleTabIndex);
  }

  TabController? _tabController;

  @override
  void dispose() {
    _tabController!.removeListener(_handleTabIndex);
    _tabController!.dispose();
    super.dispose();
  }

  void _handleTabIndex() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: theme.colorScheme.background,
      appBar: AppBar(
        bottom: TabBar(
          controller: _tabController,
          tabs: [
            Tab(
              child: MyText.bodyLarge("Tab 1", fontWeight: 600),
            ),
            Tab(
              child: MyText.bodyLarge("Tab 2", fontWeight: 600),
            ),
          ],
        ),
        leading: InkWell(
          onTap: () => Navigator.of(context).pop(),
          child: Icon(
            LucideIcons.chevronLeft,
            size: 20,
          ),
        ),
        title: MyText.titleMedium("FAB with Tabs", fontWeight: 600),
      ),
      floatingActionButton: _bottomButtons(),
      body: TabBarView(controller: _tabController, children: [
        Center(
          child: MyText('Tab 1'),
        ),
        Center(
          child: MyText('Tab 2'),
        ),
      ]),
    );
  }

  Widget getTabContent(String text) {
    return Scaffold(
      backgroundColor: theme.colorScheme.background,
      body: Center(
        child: MyText.titleLarge(text, color: theme.colorScheme.onBackground),
      ),
    );
  }

  Widget _bottomButtons() {
    return _tabController!.index == 0
        ? FloatingActionButton(
            shape: StadiumBorder(),
            onPressed: null,
            child: Icon(
              Icons.message,
              size: 22.0,
              color: theme.colorScheme.onPrimary,
            ))
        : FloatingActionButton(
            shape: StadiumBorder(),
            onPressed: null,
            child: Icon(
              Icons.edit,
              size: 22.0,
              color: theme.colorScheme.onPrimary,
            ),
          );
  }
}
