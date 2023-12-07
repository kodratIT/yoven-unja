import 'package:jambicraff/helpers/extensions/extensions.dart';
import 'package:jambicraff/helpers/theme/app_theme.dart';
import 'package:jambicraff/helpers/widgets/my_spacing.dart';
import 'package:jambicraff/helpers/widgets/my_text.dart';
import 'package:jambicraff/widgets/syncfusion/sliders/range_sliders/range_slider_interval_screen.dart';
import 'package:jambicraff/widgets/syncfusion/sliders/range_sliders/range_slider_label_screen.dart';
import 'package:jambicraff/widgets/syncfusion/sliders/range_sliders/range_slider_step_screen.dart';
import 'package:jambicraff/widgets/syncfusion/sliders/range_sliders/range_slider_tooltip_screen.dart';
import 'package:jambicraff/widgets/syncfusion/sliders/range_sliders/vertical_range_slider_interval_screen.dart';
import 'package:jambicraff/widgets/syncfusion/sliders/range_sliders/vertical_range_slider_label_screen.dart';
import 'package:jambicraff/widgets/syncfusion/sliders/range_sliders/vertical_range_slider_step_screen.dart';
import 'package:jambicraff/widgets/syncfusion/sliders/range_sliders/vertical_range_slider_tooltip_screen.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';

class RangeSlidersScreen extends StatefulWidget {
  @override
  _RangeSlidersScreenState createState() => _RangeSlidersScreenState();
}

class _RangeSlidersScreenState extends State<RangeSlidersScreen> {
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
          'Range Sliders',
          fontWeight: 600,
        ),
      ),
      body: DefaultTabController(
        length: 8,
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
      'Label',
      'Interval',
      'Tooltip',
      'Step',
      'Vertical-Label',
      'Vertical-Interval',
      'Vertical-Tooltip',
      'Vertical-Step',
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
      RangeSliderLabelScreen(),
      RangeSliderIntervalScreen(),
      RangeSliderTooltipScreen(),
      RangeSliderStepScreen(),
      VerticalRangeSliderLabelScreen(),
      VerticalRangeSliderIntervalScreen(),
      VerticalRangeSliderTooltipScreen(),
      VerticalRangeSliderStepScreen(),
    ];
  }
}
