/*
* File : Expansion Tile
* Version : 1.0.0
* */

import 'package:yoven/helpers/theme/app_theme.dart';
import 'package:yoven/helpers/widgets/my_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:lucide_icons/lucide_icons.dart';

class ExpansionTileWidget extends StatefulWidget {
  @override
  _ExpansionTileWidgetState createState() => _ExpansionTileWidgetState();
}

class _ExpansionTileWidgetState extends State<ExpansionTileWidget> {
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
    return GetBuilder(
      tag: 'expansion_tile_widget',
      builder: (controller) {
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
              title: MyText.titleMedium("Expansion Tile", fontWeight: 600),
            ),
            body: Container(
                color: theme.colorScheme.background,
                child: Column(
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
                              child:
                                  Center(child: MyText("This is first tile")),
                            )
                          ],
                        ),
                        ExpansionTile(
                          title: MyText("Second tile"),
                          children: <Widget>[
                            Container(
                              padding: EdgeInsets.all(16),
                              child: Center(
                                  child: MyText("This is second content")),
                            )
                          ],
                        ),
                        ExpansionTile(
                          title: MyText("Third tile"),
                          children: <Widget>[
                            Container(
                              padding: EdgeInsets.all(16),
                              child: Center(
                                  child: MyText("This is third content")),
                            )
                          ],
                        ),
                      ],
                    ),
                  ],
                )));
      },
    );
  }
}
