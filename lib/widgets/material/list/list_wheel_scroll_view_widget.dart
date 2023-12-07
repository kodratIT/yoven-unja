/*
* File : List Wheel Scroll
* Version : 1.0.0
* */

import 'package:jambicraff/helpers/theme/app_theme.dart';
import 'package:jambicraff/helpers/widgets/my_text.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';

class ListWheelScrollViewWidget extends StatefulWidget {
  @override
  _ListWheelScrollViewWidgetState createState() =>
      _ListWheelScrollViewWidgetState();
}

class _ListWheelScrollViewWidgetState extends State<ListWheelScrollViewWidget> {
  double _diameterRatio = 1;
  double _offAxisFraction = 0;
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
        appBar: AppBar(
          elevation: 0,
          leading: InkWell(
            onTap: () => Navigator.of(context).pop(),
            child: Icon(
              LucideIcons.chevronLeft,
              size: 20,
            ),
          ),
          title: MyText.titleMedium("List Wheel Scroll", fontWeight: 600),
        ),
        body: Container(
            color: theme.colorScheme.background,
            child: Column(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(left: 16, top: 40),
                  child: Column(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          MyText.bodyLarge("Diameter Ratio   ",
                              fontWeight: 600),
                          Slider(
                            value: _diameterRatio,
                            min: 0.1,
                            max: 2,
                            divisions: 19,
                            label: _diameterRatio.toStringAsFixed(1),
                            onChanged: (value) {
                              setState(
                                () {
                                  _diameterRatio = value;
                                },
                              );
                            },
                          ),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          MyText.bodyLarge("Off Axis Fraction",
                              fontWeight: 600),
                          Slider(
                            value: _offAxisFraction,
                            min: -2,
                            max: 2,
                            divisions: 40,
                            label: _offAxisFraction.toStringAsFixed(1),
                            onChanged: (value) {
                              setState(
                                () {
                                  _offAxisFraction = value;
                                },
                              );
                            },
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: ListWheelScrollView(
                    itemExtent: 60,
                    physics: FixedExtentScrollPhysics(),
                    diameterRatio: _diameterRatio,
                    offAxisFraction: _offAxisFraction,
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.all(16),
                        child: Row(
                          children: <Widget>[
                            Icon(LucideIcons.smile,
                                color: theme.colorScheme.onBackground),
                            Expanded(
                              flex: 1,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: MyText.titleMedium("Item 1",
                                    color: theme.colorScheme.onBackground,
                                    fontWeight: 400),
                              ),
                            ),
                            Icon(LucideIcons.user,
                                color: theme.colorScheme.onBackground),
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(16),
                        child: Row(
                          children: <Widget>[
                            Icon(LucideIcons.smile,
                                color: theme.colorScheme.onBackground),
                            Expanded(
                              flex: 1,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: MyText.titleMedium("Item 2",
                                    color: theme.colorScheme.onBackground),
                              ),
                            ),
                            Icon(LucideIcons.user,
                                color: theme.colorScheme.onBackground),
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(16),
                        child: Row(
                          children: <Widget>[
                            Icon(LucideIcons.smile,
                                color: theme.colorScheme.onBackground),
                            Expanded(
                              flex: 1,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: MyText.titleMedium("Item 3",
                                    color: theme.colorScheme.onBackground),
                              ),
                            ),
                            Icon(LucideIcons.user,
                                color: theme.colorScheme.onBackground),
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(16),
                        child: Row(
                          children: <Widget>[
                            Icon(LucideIcons.smile,
                                color: theme.colorScheme.onBackground),
                            Expanded(
                              flex: 1,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: MyText.titleMedium("Item 4",
                                    color: theme.colorScheme.onBackground),
                              ),
                            ),
                            Icon(LucideIcons.user,
                                color: theme.colorScheme.onBackground),
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(16),
                        child: Row(
                          children: <Widget>[
                            Icon(LucideIcons.smile,
                                color: theme.colorScheme.onBackground),
                            Expanded(
                              flex: 1,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: MyText.titleMedium("Item 5",
                                    color: theme.colorScheme.onBackground),
                              ),
                            ),
                            Icon(LucideIcons.user,
                                color: theme.colorScheme.onBackground),
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(16),
                        child: Row(
                          children: <Widget>[
                            Icon(LucideIcons.smile,
                                color: theme.colorScheme.onBackground),
                            Expanded(
                              flex: 1,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: MyText.titleMedium("Item 6",
                                    color: theme.colorScheme.onBackground),
                              ),
                            ),
                            Icon(LucideIcons.user,
                                color: theme.colorScheme.onBackground),
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(16),
                        child: Row(
                          children: <Widget>[
                            Icon(LucideIcons.smile,
                                color: theme.colorScheme.onBackground),
                            Expanded(
                              flex: 1,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: MyText.titleMedium("Item 7",
                                    color: theme.colorScheme.onBackground),
                              ),
                            ),
                            Icon(LucideIcons.user,
                                color: theme.colorScheme.onBackground),
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(16),
                        child: Row(
                          children: <Widget>[
                            Icon(LucideIcons.smile,
                                color: theme.colorScheme.onBackground),
                            Expanded(
                              flex: 1,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: MyText.titleMedium("Item 8",
                                    color: theme.colorScheme.onBackground),
                              ),
                            ),
                            Icon(LucideIcons.user,
                                color: theme.colorScheme.onBackground),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            )));
  }
}
