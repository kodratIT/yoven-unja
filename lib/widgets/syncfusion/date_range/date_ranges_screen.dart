/*
* File : Top Navigation widget
* Version : 1.0.0
* Description :
* */

import 'package:jambicraff/helpers/extensions/extensions.dart';
import 'package:jambicraff/helpers/theme/app_theme.dart';
import 'package:jambicraff/helpers/widgets/my_spacing.dart';
import 'package:jambicraff/helpers/widgets/my_text.dart';
import 'package:jambicraff/widgets/syncfusion/date_range/blackout_date_range.dart';
import 'package:jambicraff/widgets/syncfusion/date_range/custom_date_range.dart';
import 'package:jambicraff/widgets/syncfusion/date_range/simple_date_range.dart';
import 'package:jambicraff/widgets/syncfusion/date_range/vertical_date_range.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';

class DateRangesScreen extends StatefulWidget {
  @override
  _DateRangesScreenState createState() => _DateRangesScreenState();
}

class _DateRangesScreenState extends State<DateRangesScreen> {
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
          'Date Range',
          fontWeight: 600,
        ),
      ),
      body: DefaultTabController(
        length: 4,
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
          body: Container(
            padding: MySpacing.all(8),
            child: TabBarView(children: getTabContents()),
          ),
        ),
      ),
    );
  }

  List<Tab> getTabs() {
    List<String> tabNames = [
      'Simple',
      'Blackout',
      'Customization',
      'Vertical - Scrollable',
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
      SimpleDateRange(),
      BlackoutDateRange(),
      CustomDateRange(),
      VerticalDateRange(),
    ];
  }
}
