/*
* File : Positioned FAB
* Version : 1.0.0
* */

import 'package:jambicraff/helpers/theme/app_theme.dart';
import 'package:jambicraff/helpers/widgets/my_container.dart';
import 'package:jambicraff/helpers/widgets/my_text.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';

class PositionedFABWidget extends StatefulWidget {
  @override
  _PositionedFABWidgetState createState() => _PositionedFABWidgetState();
}

class _PositionedFABWidgetState extends State<PositionedFABWidget> {
  late CustomTheme customTheme;
  late ThemeData theme;

  @override
  void initState() {
    super.initState();
    customTheme = AppTheme.customTheme;
    theme = AppTheme.theme;
  }

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  int _radioValue = 1;
  int fabEndDocked = 1,
      fabEndFloat = 2,
      fabCenterDocked = 3,
      fabCenterFloat = 4,
      fabEndTop = 5,
      fabMiniStartTop = 6,
      fabStartTop = 7;

  FloatingActionButtonLocation _fabLocation =
      FloatingActionButtonLocation.endDocked;

  _handleValueChange(int value) {
    setState(() {
      _radioValue = value;
      switch (value) {
        case 1:
          setState(() {
            _fabLocation = FloatingActionButtonLocation.endDocked;
          });
          break;
        case 2:
          setState(() {
            _fabLocation = FloatingActionButtonLocation.endFloat;
          });
          break;
        case 3:
          setState(() {
            _fabLocation = FloatingActionButtonLocation.centerDocked;
          });
          break;
        case 4:
          setState(() {
            _fabLocation = FloatingActionButtonLocation.centerFloat;
          });
          break;
        case 5:
          setState(() {
            _fabLocation = FloatingActionButtonLocation.endTop;
          });
          break;
        case 6:
          setState(() {
            _fabLocation = FloatingActionButtonLocation.miniStartTop;
          });
          break;
        case 7:
          setState(() {
            _fabLocation = FloatingActionButtonLocation.startTop;
          });
          break;
        default:
          setState(() {
            _fabLocation = FloatingActionButtonLocation.endDocked;
          });
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          leading: InkWell(
            onTap: () => Navigator.of(context).pop(),
            child: Icon(
              LucideIcons.chevronLeft,
              size: 20,
            ),
          ),
          title: MyText.titleMedium("Positioned FAB", fontWeight: 700),
        ),
        extendBody: true,
        key: _scaffoldKey,
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            /* Click listener */
          },
          backgroundColor: theme.colorScheme.primary,
          child: Icon(Icons.add),
        ),
        floatingActionButtonLocation: _fabLocation,
        bottomNavigationBar: BottomAppBar(
          shape: CircularNotchedRectangle(),
          color: customTheme.card,
          clipBehavior: Clip.none,
          notchMargin: 4,
          elevation: 4,
          child: Container(
            height: 70,
          ),
        ),
        body: Column(
          children: <Widget>[
            MyContainer.bordered(
              onTap: () {
                _handleValueChange(fabEndDocked);
              },
              margin: EdgeInsets.only(top: 16, left: 16, right: 16, bottom: 8),
              paddingAll: 0,
              borderRadiusAll: 4,
              child: Row(
                children: <Widget>[
                  Radio(
                    onChanged: (dynamic value) {
                      _handleValueChange(fabEndDocked);
                    },
                    groupValue: _radioValue,
                    value: fabEndDocked,
                    activeColor: theme.colorScheme.primary,
                  ),
                  MyText.titleSmall("End Docked",
                      color: theme.colorScheme.onBackground,
                      letterSpacing: 0.15,
                      fontWeight: 500),
                ],
              ),
            ),
            MyContainer.bordered(
              onTap: () {
                _handleValueChange(fabEndFloat);
              },
              margin: EdgeInsets.only(top: 16, left: 16, right: 16, bottom: 8),
              paddingAll: 0,
              borderRadiusAll: 4,
              child: Row(
                children: <Widget>[
                  Radio(
                    onChanged: (dynamic value) {
                      _handleValueChange(fabEndFloat);
                    },
                    groupValue: _radioValue,
                    value: fabEndFloat,
                    activeColor: theme.colorScheme.primary,
                  ),
                  MyText.titleSmall("End Float",
                      color: theme.colorScheme.onBackground,
                      letterSpacing: 0.15,
                      fontWeight: 500),
                ],
              ),
            ),
            MyContainer.bordered(
              onTap: () {
                _handleValueChange(fabCenterDocked);
              },
              margin: EdgeInsets.only(top: 16, left: 16, right: 16, bottom: 8),
              paddingAll: 0,
              borderRadiusAll: 4,
              child: Row(
                children: <Widget>[
                  Radio(
                    onChanged: (dynamic value) {
                      _handleValueChange(fabCenterDocked);
                    },
                    groupValue: _radioValue,
                    value: fabCenterDocked,
                    activeColor: theme.colorScheme.primary,
                  ),
                  MyText.titleSmall("Center Docked",
                      color: theme.colorScheme.onBackground,
                      letterSpacing: 0.15,
                      fontWeight: 500),
                ],
              ),
            ),
            MyContainer.bordered(
              onTap: () {
                _handleValueChange(fabCenterFloat);
              },
              margin: EdgeInsets.only(top: 16, left: 16, right: 16, bottom: 8),
              paddingAll: 0,
              borderRadiusAll: 4,
              child: Row(
                children: <Widget>[
                  Radio(
                    onChanged: (dynamic value) {
                      _handleValueChange(fabCenterFloat);
                    },
                    groupValue: _radioValue,
                    value: fabCenterFloat,
                    activeColor: theme.colorScheme.primary,
                  ),
                  MyText.titleSmall("Center Float",
                      color: theme.colorScheme.onBackground,
                      letterSpacing: 0.15,
                      fontWeight: 500),
                ],
              ),
            ),
            MyContainer.bordered(
              onTap: () {
                _handleValueChange(fabEndTop);
              },
              margin: EdgeInsets.only(top: 16, left: 16, right: 16, bottom: 8),
              paddingAll: 0,
              borderRadiusAll: 4,
              child: Row(
                children: <Widget>[
                  Radio(
                    onChanged: (dynamic value) {
                      _handleValueChange(fabEndTop);
                    },
                    groupValue: _radioValue,
                    value: fabEndTop,
                    activeColor: theme.colorScheme.primary,
                  ),
                  MyText.titleSmall("End Top",
                      color: theme.colorScheme.onBackground,
                      letterSpacing: 0.15,
                      fontWeight: 500),
                ],
              ),
            ),
            MyContainer.bordered(
              onTap: () {
                _handleValueChange(fabMiniStartTop);
              },
              margin: EdgeInsets.only(top: 16, left: 16, right: 16, bottom: 8),
              paddingAll: 0,
              borderRadiusAll: 4,
              child: Row(
                children: <Widget>[
                  Radio(
                    onChanged: (dynamic value) {
                      _handleValueChange(fabMiniStartTop);
                    },
                    groupValue: _radioValue,
                    value: fabMiniStartTop,
                    activeColor: theme.colorScheme.primary,
                  ),
                  MyText.titleSmall("Mini Top",
                      color: theme.colorScheme.onBackground,
                      letterSpacing: 0.15,
                      fontWeight: 500),
                ],
              ),
            ),
            MyContainer.bordered(
              onTap: () {
                _handleValueChange(fabStartTop);
              },
              margin: EdgeInsets.only(top: 16, left: 16, right: 16, bottom: 8),
              paddingAll: 0,
              borderRadiusAll: 4,
              child: Row(
                children: <Widget>[
                  Radio(
                    onChanged: (dynamic value) {
                      _handleValueChange(fabStartTop);
                    },
                    groupValue: _radioValue,
                    value: fabStartTop,
                    activeColor: theme.colorScheme.primary,
                  ),
                  MyText.titleSmall("Start Top",
                      color: theme.colorScheme.onBackground,
                      letterSpacing: 0.15,
                      fontWeight: 500),
                ],
              ),
            ),
          ],
        ));
  }
}
