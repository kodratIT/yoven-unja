import 'package:jambicraff/helpers/extensions/extensions.dart';
import 'package:jambicraff/helpers/theme/app_theme.dart';
import 'package:jambicraff/helpers/widgets/my_spacing.dart';
import 'package:jambicraff/helpers/widgets/my_text.dart';
import 'package:jambicraff/widgets/syncfusion/sliders/range_selector/range_selector_bar_screen.dart';
import 'package:jambicraff/widgets/syncfusion/sliders/range_selector/range_selector_screen.dart';
import 'package:jambicraff/widgets/syncfusion/sliders/range_selector/range_selector_selection_screen.dart';
import 'package:jambicraff/widgets/syncfusion/sliders/range_selector/range_selector_zooming_screen.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';

class RangeSelectorsScreen extends StatefulWidget {
  @override
  _RangeSelectorsScreenState createState() => _RangeSelectorsScreenState();
}

class _RangeSelectorsScreenState extends State<RangeSelectorsScreen> {
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
          'Range Selector',
          fontWeight: 600,
        ),
      ),
      body: DefaultTabController(
        length: 4,
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
            child: TabBarView(
              physics: NeverScrollableScrollPhysics(),
              children: getTabContents(),
            ),
          ),
        ),
      ),
    );
  }

  List<Tab> getTabs() {
    List<String> tabNames = ['Default', 'Selection', 'Zooming', 'Bar'];

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
      RangeSelectorScreen(),
      RangeSelectorSelectionScreen(),
      RangeSelectorZoomingScreen(),
      RangeSelectorBarScreen()
    ];
  }
}
