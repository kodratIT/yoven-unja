/*
* File : Top Navigation widget
* Version : 1.0.0
* Description :
* */

import 'package:yoven/helpers/extensions/extensions.dart';
import 'package:yoven/helpers/theme/app_theme.dart';
import 'package:yoven/helpers/widgets/my_spacing.dart';
import 'package:yoven/helpers/widgets/my_text.dart';
import 'package:yoven/widgets/syncfusion/charts/other_charts/funnel_default.dart';
import 'package:yoven/widgets/syncfusion/charts/other_charts/funnel_label.dart';
import 'package:yoven/widgets/syncfusion/charts/other_charts/live_update.dart';
import 'package:yoven/widgets/syncfusion/charts/other_charts/pyramid_default.dart';
import 'package:yoven/widgets/syncfusion/charts/other_charts/pyramid_label.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';

class OtherChartScreen extends StatefulWidget {
  @override
  _OtherChartScreenState createState() => _OtherChartScreenState();
}

class _OtherChartScreenState extends State<OtherChartScreen> {
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
          'Other Chart',
          fontWeight: 600,
        ),
      ),
      body: DefaultTabController(
        length: 5,
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
            padding: MySpacing.all(8),
            child: TabBarView(children: getTabContents()),
          ),
        ),
      ),
    );
  }

  List<Tab> getTabs() {
    List<String> tabNames = [
      'Pyramid',
      'Pyramid-Label',
      'Funnel',
      'Funnel-Label',
      'Live',
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
      PyramidDefault(),
      PyramidLabel(),
      FunnelDefault(),
      FunnelLabel(),
      LiveUpdate(),
    ];
  }
}
