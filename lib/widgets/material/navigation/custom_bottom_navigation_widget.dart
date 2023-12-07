/*
* File : Custom Bottom Navigation widget
* Version : 1.0.0
* Description :
* */

import 'package:jambicraff/helpers/extensions/widgets_extension.dart';
import 'package:jambicraff/helpers/theme/app_theme.dart';
import 'package:jambicraff/helpers/widgets/my_text.dart';
import 'package:jambicraff/widgets/custom/navigation/custom_bottom_navigation.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';

class CustomBottomNavigationWidget extends StatefulWidget {
  @override
  _CustomBottomNavigationWidgetState createState() =>
      _CustomBottomNavigationWidgetState();
}

class _CustomBottomNavigationWidgetState
    extends State<CustomBottomNavigationWidget> {
  int _currentIndex = 0;
  late ThemeData theme;
  PageController? _pageController;
  late CustomTheme customTheme;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    theme = AppTheme.theme;
    customTheme = AppTheme.customTheme;
  }

  @override
  void dispose() {
    _pageController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: Icon(LucideIcons.chevronLeft).autoDirection(),
        ),
        title: MyText.titleMedium("Bottom Navigation", fontWeight: 600),
      ),
      body: SizedBox.expand(
        child: PageView(
          controller: _pageController,
          onPageChanged: (index) {
            setState(() => _currentIndex = index);
          },
          children: <Widget>[
            /*-------------- Build tab content here -----------------*/
            Center(
              child: MyText.titleMedium("Item 1", fontWeight: 600),
            ),
            Center(
              child: MyText.titleMedium("Item 2", fontWeight: 600),
            ),
            Center(
              child: MyText.titleMedium("Item 3", fontWeight: 600),
            ),
            Center(
              child: MyText.titleMedium("Item 4", fontWeight: 600),
            ),
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNavigation(
        animationDuration: Duration(milliseconds: 350),
        selectedItemOverlayColor: theme.colorScheme.primary.withAlpha(48),
        backgroundColor: theme.colorScheme.background,
        selectedIndex: _currentIndex,
        onItemSelected: (index) {
          setState(() => _currentIndex = index);
          _pageController!.jumpToPage(index);
        },
        items: <CustomBottomNavigationBarItem>[
          /*-------------- Build tabs here -----------------*/
          CustomBottomNavigationBarItem(
              title: 'Item One',
              icon: Icon(Icons.home),
              activeColor: theme.colorScheme.primary,
              inactiveColor: theme.colorScheme.onBackground.withAlpha(180)),
          CustomBottomNavigationBarItem(
              title: 'Item Two',
              icon: Icon(Icons.apps),
              activeColor: theme.colorScheme.primary,
              inactiveColor: theme.colorScheme.onBackground.withAlpha(180)),
          CustomBottomNavigationBarItem(
              title: 'Item Three',
              icon: Icon(Icons.chat_bubble),
              activeColor: theme.colorScheme.primary,
              inactiveColor: theme.colorScheme.onBackground.withAlpha(180)),
          CustomBottomNavigationBarItem(
              title: 'Item Four',
              icon: Icon(Icons.settings),
              activeColor: theme.colorScheme.primary,
              inactiveColor: theme.colorScheme.onBackground.withAlpha(180)),
        ],
      ),
    );
  }

  onTapped(value) {
    setState(() {
      _currentIndex = value;
    });
  }
}
