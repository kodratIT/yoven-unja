/*
* File : Navigation Rail widget
* Version : 1.0.0
* Description :
* */

import 'package:jambicraff/helpers/extensions/extensions.dart';
import 'package:jambicraff/helpers/theme/app_theme.dart';
import 'package:jambicraff/helpers/widgets/my_spacing.dart';
import 'package:jambicraff/helpers/widgets/my_text.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';

class NavigationRailWidget extends StatefulWidget {
  @override
  _NavigationRailWidgetState createState() => _NavigationRailWidgetState();
}

class _NavigationRailWidgetState extends State<NavigationRailWidget> {
  int _selectedIndex = 0;

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
      body: Padding(
        padding: MySpacing.top(MySpacing.safeAreaTop(context)),
        child: Row(
          children: <Widget>[
            NavigationRail(
              backgroundColor: customTheme.card,
              leading: IconButton(
                  onPressed: () => Navigator.of(context).pop(),
                  icon: Icon(
                    LucideIcons.chevronLeft,
                    size: 20,
                    color: theme.colorScheme.onBackground,
                  ).autoDirection()),
              selectedIndex: _selectedIndex,
              onDestinationSelected: (int index) {
                setState(() {
                  _selectedIndex = index;
                });
              },
              labelType: NavigationRailLabelType.selected,
              /*------------- Build Tabs -------------------*/
              destinations: [
                NavigationRailDestination(
                  icon: Icon(Icons.favorite_border),
                  selectedIcon: Icon(Icons.favorite),
                  label: MyText.titleSmall('First',
                      fontWeight: 600, color: theme.colorScheme.primary),
                ),
                NavigationRailDestination(
                  icon: Icon(Icons.book_outlined),
                  selectedIcon: Icon(Icons.book),
                  label: MyText.titleSmall('Second',
                      fontWeight: 600, color: theme.colorScheme.primary),
                ),
                NavigationRailDestination(
                  icon: Icon(Icons.star_border),
                  selectedIcon: Icon(Icons.star),
                  label: MyText.titleSmall('Third',
                      fontWeight: 600, color: theme.colorScheme.primary),
                ),
              ],
            ),

            // This is the main content.
            Expanded(
              child: Center(
                child: MyText.titleMedium('Selected : $_selectedIndex',
                    color: theme.colorScheme.onBackground, letterSpacing: 0.3),
              ),
            )
          ],
        ),
      ),
    );
  }
}
