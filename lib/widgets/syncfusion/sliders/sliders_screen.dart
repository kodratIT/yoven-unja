import 'package:yoven/helpers/extensions/extensions.dart';
import 'package:yoven/helpers/theme/app_theme.dart';
import 'package:yoven/helpers/widgets/my_spacing.dart';
import 'package:yoven/helpers/widgets/my_text.dart';
import 'package:yoven/widgets/syncfusion/sliders/sliders/slider_interval_screen.dart';
import 'package:yoven/widgets/syncfusion/sliders/sliders/slider_label_screen.dart';
import 'package:yoven/widgets/syncfusion/sliders/sliders/slider_step_screen.dart';
import 'package:yoven/widgets/syncfusion/sliders/sliders/slider_tooltip_screen.dart';
import 'package:yoven/widgets/syncfusion/sliders/sliders/vertical_slider_interval_screen.dart';
import 'package:yoven/widgets/syncfusion/sliders/sliders/vertical_slider_label_screen.dart';
import 'package:yoven/widgets/syncfusion/sliders/sliders/vertical_slider_step_screen.dart';
import 'package:yoven/widgets/syncfusion/sliders/sliders/vertical_slider_tooltip_screen.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';

class SlidersScreen extends StatefulWidget {
  @override
  _SlidersScreenState createState() => _SlidersScreenState();
}

class _SlidersScreenState extends State<SlidersScreen> {
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
          'Sliders',
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
      'Slider',
      'Interval',
      'Tooltip',
      'Step',
      'Vertical',
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
      SliderLabelScreen(),
      SliderIntervalScreen(),
      SliderTooltipScreen(),
      SliderStepScreen(),
      VerticalSliderLabelScreen(),
      VerticalSliderIntervalScreen(),
      VerticalSliderTooltipScreen(),
      VerticalSliderStepScreen(),
    ];
  }
}
