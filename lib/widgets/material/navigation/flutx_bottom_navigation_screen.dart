import 'package:jambicraff/helpers/theme/app_theme.dart';
import 'package:jambicraff/helpers/widgets/my_bottom_navigation_bar.dart';
import 'package:jambicraff/helpers/widgets/my_bottom_navigation_bar_item.dart';
import 'package:jambicraff/helpers/widgets/my_spacing.dart';
import 'package:jambicraff/helpers/widgets/my_text.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';

class FxBottomNavigationScreen extends StatefulWidget {
  @override
  _FxBottomNavigationScreenState createState() =>
      _FxBottomNavigationScreenState();
}

class _FxBottomNavigationScreenState extends State<FxBottomNavigationScreen> {
  MyBottomNavigationBarType bottomNavigationBarType =
      MyBottomNavigationBarType.normal;
  Axis labelDirection = Axis.horizontal;
  bool showLabel = false, showActiveLabel = false;
  late CustomTheme customTheme;
  late ThemeData theme;

  @override
  void initState() {
    super.initState();
    customTheme = AppTheme.customTheme;
    theme = AppTheme.theme;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: MySpacing.horizontal(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListTile(
                  title: MyText.titleSmall(
                    "Type - (${bottomNavigationBarType == MyBottomNavigationBarType.containered ? "Containered" : "Normal"})",
                    fontWeight: 600,
                  ),
                  contentPadding: EdgeInsets.all(0),
                  dense: true,
                  trailing: Switch(
                    onChanged: (value) {
                      setState(() {
                        bottomNavigationBarType = value
                            ? MyBottomNavigationBarType.containered
                            : MyBottomNavigationBarType.normal;
                      });
                    },
                    value: bottomNavigationBarType ==
                        MyBottomNavigationBarType.containered,
                  ),
                ),
                ListTile(
                  title: MyText.titleSmall(
                    "Show Active Label",
                    fontWeight: 600,
                  ),
                  contentPadding: EdgeInsets.all(0),
                  dense: true,
                  trailing: Switch(
                    onChanged: (value) {
                      setState(() {
                        showActiveLabel = value;
                      });
                    },
                    value: showActiveLabel,
                  ),
                ),
                ListTile(
                  title: MyText.titleSmall(
                    "Show Label",
                    fontWeight: 600,
                  ),
                  contentPadding: EdgeInsets.all(0),
                  dense: true,
                  trailing: Switch(
                    onChanged: (value) {
                      setState(() {
                        showLabel = value;
                      });
                    },
                    value: showLabel,
                  ),
                ),
                ListTile(
                  title: MyText.titleSmall(
                    "Label Direction (${labelDirection == Axis.horizontal ? "Horizontal" : "Vertical"})",
                    fontWeight: 600,
                  ),
                  contentPadding: EdgeInsets.all(0),
                  dense: true,
                  trailing: Switch(
                    onChanged: (value) {
                      setState(() {
                        labelDirection =
                            value ? Axis.horizontal : Axis.vertical;
                      });
                    },
                    value: labelDirection == Axis.horizontal,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: MyBottomNavigationBar(
              containerDecoration: BoxDecoration(
                  color: customTheme.cardDark,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(16),
                      topRight: Radius.circular(16)),
                  boxShadow: [
                    BoxShadow(
                        color: customTheme.shadowColor.withAlpha(200),
                        offset: Offset(8, 0),
                        blurRadius: 8)
                  ]),
              activeContainerColor: theme.colorScheme.primary.withAlpha(30),
              myBottomNavigationBarType: bottomNavigationBarType,
              showActiveLabel: showActiveLabel,
              showLabel: showLabel,
              activeIconSize: 22,
              iconSize: 22,
              titleSize: 12,
              activeTitleSize: 12,
              labelDirection: labelDirection,
              activeIconColor: theme.colorScheme.primary,
              iconColor: theme.colorScheme.onBackground.withAlpha(140),
              itemList: [
                MyBottomNavigationBarItem(
                  page: Screen1(),
                  title: "Home",
                  activeIconData: Icons.house,
                  iconData: Icons.house_outlined,
                ),
                MyBottomNavigationBarItem(
                  page: Screen2(),
                  title: "Plan",
                  activeIconData: Icons.date_range,
                  iconData: Icons.date_range_outlined,
                ),
                MyBottomNavigationBarItem(
                  page: Screen3(),
                  title: "Chat",
                  activeIconData: Icons.chat_bubble,
                  iconData: Icons.chat_bubble_outline_rounded,
                ),
                MyBottomNavigationBarItem(
                  page: Screen4(),
                  title: "Profile",
                  activeIconData: Icons.person,
                  iconData: Icons.person_outline_rounded,
                ),
              ],
            ),
          ),
        ],
      ),
      backgroundColor: customTheme.cardDark,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: customTheme.cardDark,
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: Icon(LucideIcons.chevronLeft),
        ),
        title: MyText.titleMedium("Bottom Navigation Bar", fontWeight: 600),
      ),
    );
  }
}

class Screen1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: MyText.titleLarge('Screen 1'),
    );
  }
}

class Screen2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: MyText.titleLarge('Screen 2'),
    );
  }
}

class Screen3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: MyText.titleLarge('Screen 3'),
    );
  }
}

class Screen4 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: MyText.titleLarge('Screen 4'),
    );
  }
}
