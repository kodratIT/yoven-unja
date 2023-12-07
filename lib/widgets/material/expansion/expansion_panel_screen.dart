/*
* File : Expansion Panel
* Version : 1.0.0
* */

import 'package:yoven/helpers/theme/app_theme.dart';
import 'package:yoven/helpers/widgets/my_spacing.dart';
import 'package:yoven/helpers/widgets/my_text.dart';
import 'package:flutter/material.dart';

class ExpansionPanelScreen extends StatefulWidget {
  @override
  _ExpansionPanelScreenState createState() => _ExpansionPanelScreenState();
}

class _ExpansionPanelScreenState extends State<ExpansionPanelScreen> {
  final List<bool> _dataExpansionPanel = [false, true, false];
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
                  padding: MySpacing.bottom(16),
                  child: Center(
                    child:
                        MyText.bodyMedium("Content of panel", fontWeight: 500),
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
                  padding: MySpacing.bottom(16),
                  child: Center(
                    child:
                        MyText.bodyMedium("Content of panel", fontWeight: 500),
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
                  padding: MySpacing.bottom(16),
                  child: Center(
                    child:
                        MyText.bodyMedium("Content of panel", fontWeight: 500),
                  ),
                ),
                isExpanded: _dataExpansionPanel[2])
          ],
        )
      ],
    ));
  }
}
