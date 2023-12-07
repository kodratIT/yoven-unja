/*
* File : Top Navigation widget
* Version : 1.0.0
* Description :
* */

import 'package:jambicraff/helpers/extensions/widgets_extension.dart';
import 'package:jambicraff/helpers/theme/app_theme.dart';
import 'package:jambicraff/helpers/widgets/my_text.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';

class TopScrollableNavigationWidget extends StatefulWidget {
  @override
  _TopScrollableNavigationWidgetState createState() =>
      _TopScrollableNavigationWidgetState();
}

class _TopScrollableNavigationWidgetState
    extends State<TopScrollableNavigationWidget> {
  late ThemeData theme;
  late CustomTheme customTheme;

  @override
  void initState() {
    super.initState();
    theme = AppTheme.theme;
    customTheme = AppTheme.customTheme;
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
        title: MyText.titleMedium("Top Scrollable", fontWeight: 600),
      ),
      body: DefaultTabController(
        length: 8,
        initialIndex: 4,
        child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            flexibleSpace: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                /*-------------- Build Tabs here ------------------*/
                TabBar(
                  isScrollable: true,
                  tabs: [
                    Tab(child: MyText.titleMedium("Tab 1", fontWeight: 600)),
                    Tab(child: MyText.titleMedium("Tab 2", fontWeight: 600)),
                    Tab(child: MyText.titleMedium("Tab 3", fontWeight: 600)),
                    Tab(child: MyText.titleMedium("Tab 4", fontWeight: 600)),
                    Tab(child: MyText.titleMedium("Tab 5", fontWeight: 600)),
                    Tab(child: MyText.titleMedium("Tab 6", fontWeight: 600)),
                    Tab(child: MyText.titleMedium("Tab 7", fontWeight: 600)),
                    Tab(child: MyText.titleMedium("Tab 8", fontWeight: 600)),
                  ],
                )
              ],
            ),
          ),

          /*--------------- Build Tab body here -------------------*/
          body: TabBarView(
            children: <Widget>[
              getTabContent('Tab 1'),
              getTabContent('Tab 2'),
              getTabContent('Tab 3'),
              getTabContent('Tab 4'),
              getTabContent('Tab 5'),
              getTabContent('Tab 6'),
              getTabContent('Tab 7'),
              getTabContent('Tab 8'),
            ],
          ),
        ),
      ),
    );
  }

  Widget getTabContent(String text) {
    return Scaffold(
      backgroundColor: theme.colorScheme.background,
      body: Center(
        child: MyText.titleMedium(text, fontWeight: 600),
      ),
    );
  }
}
