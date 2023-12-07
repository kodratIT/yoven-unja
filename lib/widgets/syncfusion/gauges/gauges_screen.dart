/*
* File : Top Navigation widget
* Version : 1.0.0
* Description :
* */

import 'package:jambicraff/helpers/extensions/extensions.dart';
import 'package:jambicraff/helpers/theme/app_theme.dart';
import 'package:jambicraff/helpers/widgets/my_spacing.dart';
import 'package:jambicraff/helpers/widgets/my_text.dart';
import 'package:jambicraff/widgets/syncfusion/gauges/sleep_gauge.dart';
import 'package:jambicraff/widgets/syncfusion/gauges/steps_gauge.dart';
import 'package:jambicraff/widgets/syncfusion/gauges/temperature_gauge.dart';
import 'package:jambicraff/widgets/syncfusion/gauges/thermometer_gauge.dart';
import 'package:jambicraff/widgets/syncfusion/gauges/water_gauge.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';

class GaugesScreen extends StatefulWidget {
  @override
  _GaugesScreenState createState() => _GaugesScreenState();
}

class _GaugesScreenState extends State<GaugesScreen> {
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
          'Gauges',
          fontWeight: 600,
        ),
      ),
      body: DefaultTabController(
        length: 5,
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
      'Thermometer',
      'Water',
      'Steps',
      'Sleep',
      'Temperature'
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
      ThermometerGauge(),
      WaterGauge(),
      StepsGauge(),
      SleepGauge(),
      TemperatureGauge(),
    ];
  }
}
