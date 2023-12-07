/*
* File : Expansion Panel
* Version : 1.0.0
* */

import 'package:yoven/helpers/theme/app_theme.dart';
import 'package:yoven/helpers/widgets/my_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lucide_icons/lucide_icons.dart';

class ExpansionPanelWidget extends StatefulWidget {
  @override
  _ExpansionPanelWidgetState createState() => _ExpansionPanelWidgetState();
}

class _ExpansionPanelWidgetState extends State<ExpansionPanelWidget> {
  final List<bool> _dataExpansionPanel = [false, true, false];
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
      tag: 'expansion_panel_widget',
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
              title: MyText.titleMedium("Expansion Panel", fontWeight: 600),
            ),
            body: Column(
              children: <Widget>[
                ExpansionPanelList(
                  expandedHeaderPadding: EdgeInsets.all(0),
                  expansionCallback: (int index, bool isExpanded) {
                    setState(() {
                      _dataExpansionPanel[index] = !isExpanded;
                    });
                  },
                  animationDuration: Duration(milliseconds: 500),
                  children: <ExpansionPanel>[
                    ExpansionPanel(
                        canTapOnHeader: true,
                        headerBuilder: (BuildContext context, bool isExpanded) {
                          return ListTile(
                            title: MyText.bodyLarge("First panel",
                                color: isExpanded
                                    ? theme.colorScheme.primary
                                    : theme.colorScheme.onBackground,
                                fontWeight: isExpanded ? 700 : 600),
                          );
                        },
                        body: Container(
                          padding: EdgeInsets.only(bottom: 16),
                          child: Center(
                            child: MyText.bodyMedium("Content of panel",
                                fontWeight: 500),
                          ),
                        ),
                        isExpanded: _dataExpansionPanel[0]),
                    ExpansionPanel(
                        canTapOnHeader: true,
                        headerBuilder: (BuildContext context, bool isExpanded) {
                          return ListTile(
                            title: MyText.bodyLarge("Second panel",
                                color: isExpanded
                                    ? theme.colorScheme.primary
                                    : theme.colorScheme.onBackground,
                                fontWeight: isExpanded ? 700 : 600),
                          );
                        },
                        body: Container(
                          padding: EdgeInsets.only(bottom: 16),
                          child: Center(
                            child: MyText.bodyMedium("Content of panel",
                                fontWeight: 500),
                          ),
                        ),
                        isExpanded: _dataExpansionPanel[1]),
                    ExpansionPanel(
                        canTapOnHeader: true,
                        headerBuilder: (BuildContext context, bool isExpanded) {
                          return ListTile(
                            title: MyText.bodyLarge("Third panel",
                                color: isExpanded
                                    ? theme.colorScheme.primary
                                    : theme.colorScheme.onBackground,
                                fontWeight: isExpanded ? 700 : 600),
                          );
                        },
                        body: Container(
                          padding: EdgeInsets.only(bottom: 16),
                          child: Center(
                            child: MyText.bodyMedium("Content of panel",
                                fontWeight: 500),
                          ),
                        ),
                        isExpanded: _dataExpansionPanel[2])
                  ],
                )
              ],
            ));
      },
    );
  }
}
