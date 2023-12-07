import 'package:yoven/helpers/extensions/widgets_extension.dart';
import 'package:yoven/helpers/theme/app_theme.dart';
import 'package:yoven/helpers/widgets/my_text.dart';
import 'package:yoven/widgets/material/basic/choice_chip_screen.dart';
import 'package:yoven/widgets/material/basic/flutx_two_tone_icons_screen.dart';
import 'package:yoven/widgets/material/basic/grid_action_screen.dart';
import 'package:yoven/widgets/material/basic/grid_hero_screen.dart';
import 'package:yoven/widgets/material/basic/grid_screen.dart';
import 'package:yoven/widgets/material/basic/simple_chip_screen.dart';
import 'package:yoven/widgets/material/basic/snackbar_screen.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';

class BasicScreen extends StatefulWidget {
  @override
  _BasicScreenState createState() => _BasicScreenState();
}

class _BasicScreenState extends State<BasicScreen> {
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
          icon: Icon(
            LucideIcons.chevronLeft,
            size: 20,
          ).autoDirection(),
        ),
        title: MyText.titleMedium(
          'Basic',
          fontWeight: 600,
        ),
      ),
      body: DefaultTabController(
        length: 7,
        initialIndex: 0,
        child: Scaffold(
          appBar: AppBar(
            elevation: 1,
            toolbarHeight: 48,
            automaticallyImplyLeading: false,
            flexibleSpace: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                /*-------------- Build Tabs here ------------------*/
                TabBar(isScrollable: true, tabs: getTabs())
              ],
            ),
          ),

          /*--------------- Build Tab body here -------------------*/
          body: TabBarView(
            children: getTabContents(),
          ),
        ),
      ),
    );
  }

  List<Tab> getTabs() {
    List<String> tabNames = [
      'Two-Tone',
      'Chip',
      'Choice Chip',
      'Grid',
      'Hero',
      'Actions',
      'Snackbars',
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
      FxTwoToneIconsScreen(),
      SimpleChipScreen(),
      ChoiceChipScreen(),
      GridScreen(),
      GridHeroScreen(),
      GridActionScreen(),
      SnackBarScreen(),
    ];
  }
}
