/*
* File : Top Navigation widget
* Version : 1.0.0
* Description :
* */

import 'package:jambicraff/helpers/extensions/extensions.dart';
import 'package:jambicraff/helpers/theme/app_theme.dart';
import 'package:jambicraff/helpers/widgets/my_spacing.dart';
import 'package:jambicraff/helpers/widgets/my_text.dart';
import 'package:jambicraff/widgets/syncfusion/charts/circular_charts/doughnut_default.dart';
import 'package:jambicraff/widgets/syncfusion/charts/circular_charts/doughnut_elevated.dart';
import 'package:jambicraff/widgets/syncfusion/charts/circular_charts/doughnut_gradient.dart';
import 'package:jambicraff/widgets/syncfusion/charts/circular_charts/doughnut_rounded.dart';
import 'package:jambicraff/widgets/syncfusion/charts/circular_charts/doughnut_semi.dart';
import 'package:jambicraff/widgets/syncfusion/charts/circular_charts/pie_default.dart';
import 'package:jambicraff/widgets/syncfusion/charts/circular_charts/pie_gradient.dart';
import 'package:jambicraff/widgets/syncfusion/charts/circular_charts/pie_radius.dart';
import 'package:jambicraff/widgets/syncfusion/charts/circular_charts/pie_semi.dart';
import 'package:jambicraff/widgets/syncfusion/charts/circular_charts/radial_default.dart';
import 'package:jambicraff/widgets/syncfusion/charts/circular_charts/radial_gradient.dart';
import 'package:jambicraff/widgets/syncfusion/charts/circular_charts/radial_legend.dart';
import 'package:jambicraff/widgets/syncfusion/charts/circular_charts/radial_overfilled.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';

class CircularChartScreen extends StatefulWidget {
  @override
  _CircularChartScreenState createState() => _CircularChartScreenState();
}

class _CircularChartScreenState extends State<CircularChartScreen> {
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
          'Circular Chart',
          fontWeight: 600,
        ),
      ),
      body: DefaultTabController(
        length: 13,
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
                TabBar(
                  isScrollable: true,
                  tabs: getTabs(),
                )
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
      'Pie',
      'Pie-Radius',
      'Pie-Semi',
      'Pie-Gradient',
      'Doughnut',
      'Doughnut-Elevated',
      'Doughnut-Rounded',
      'Doughnut-Semi',
      'Doughnut-Gradient',
      'Radial',
      'Radial-Legend',
      'Radial-Gradient',
      'Radial-Overfilled',
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
      PieDefault(),
      PieRadius(),
      PieSemi(),
      PieGradient(),
      DoughnutDefault(),
      DoughnutElevated(),
      DoughnutRounded(),
      DoughnutSemi(),
      DoughnutGradient(),
      RadialDefault(),
      RadialLegend(),
      RadialGradientChart(),
      RadialOverfilled(),
    ];
  }
}
