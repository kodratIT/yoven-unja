import 'package:jambicraff/helpers/extensions/widgets_extension.dart';
import 'package:jambicraff/helpers/theme/app_theme.dart';
import 'package:jambicraff/helpers/widgets/my_text.dart';
import 'package:jambicraff/widgets/material/button/action_text_fab.dart';
import 'package:jambicraff/widgets/material/button/animated_icon_screen.dart';
import 'package:jambicraff/widgets/material/button/extended_fab.dart';
import 'package:jambicraff/widgets/material/button/flutx_buttons_screen.dart';
import 'package:jambicraff/widgets/material/button/icon_button_screen.dart';
import 'package:jambicraff/widgets/material/button/positioned_fab.dart';
import 'package:jambicraff/widgets/material/button/toggle_button_screen.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';

class ButtonsScreen extends StatefulWidget {
  @override
  _ButtonsScreenState createState() => _ButtonsScreenState();
}

class _ButtonsScreenState extends State<ButtonsScreen> {
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
        leading: InkWell(
          onTap: () => Navigator.of(context).pop(),
          child: Icon(LucideIcons.chevronLeft).autoDirection(),
        ),
        title: MyText.titleMedium(
          'Buttons',
          fontWeight: 600,
        ),
      ),
      body: DefaultTabController(
        length: 7,
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
          body: TabBarView(children: getTabContents()),
        ),
      ),
    );
  }

  List<Tab> getTabs() {
    List<String> tabNames = [
      'FlutX',
      'Action FAB',
      'Animated Icon',
      'Extended FAB',
      'Icon Button',
      'Positioned FAB',
      'Toggles',
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
      MyButtonsScreen(),
      ActionTextFAB(),
      AnimatedIconScreen(),
      ExtendedFAB(),
      IconButtonScreen(),
      PositionedFAB(),
      ToggleButtonScreen(),
    ];
  }
}
