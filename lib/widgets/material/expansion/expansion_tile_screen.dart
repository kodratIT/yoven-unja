/*
* File : Expansion Tile
* Version : 1.0.0
* */

import 'package:yoven/helpers/theme/app_theme.dart';
import 'package:yoven/helpers/widgets/my_spacing.dart';
import 'package:yoven/helpers/widgets/my_text.dart';
import 'package:flutter/material.dart';

class ExpansionTileScreen extends StatefulWidget {
  @override
  _ExpansionTileScreenState createState() => _ExpansionTileScreenState();
}

class _ExpansionTileScreenState extends State<ExpansionTileScreen> {
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
        body: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Column(
          children: <Widget>[
            ExpansionTile(
              initiallyExpanded: true,
              title: MyText("First tile"),
              children: <Widget>[
                Container(
                  padding: EdgeInsets.all(16),
                  child: Center(child: MyText("This is first tile")),
                )
              ],
            ),
            ExpansionTile(
              title: MyText("Second tile"),
              children: <Widget>[
                Container(
                  padding: MySpacing.all(16),
                  child: Center(child: MyText("This is second content")),
                )
              ],
            ),
            ExpansionTile(
              title: MyText("Third tile"),
              children: <Widget>[
                Container(
                  padding: MySpacing.all(16),
                  child: Center(child: MyText("This is third content")),
                )
              ],
            ),
          ],
        ),
      ],
    ));
  }
}
