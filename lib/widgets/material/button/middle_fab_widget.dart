/*
* File : Middle FAB
* Version : 1.0.0
* */

import 'package:jambicraff/helpers/theme/app_theme.dart';
import 'package:jambicraff/helpers/widgets/my_text.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';

class MiddleFABWidget extends StatefulWidget {
  @override
  _MiddleFABWidgetState createState() => _MiddleFABWidgetState();
}

class _MiddleFABWidgetState extends State<MiddleFABWidget> {
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
          title: MyText.titleMedium("Middle FAB", fontWeight: 600),
        ),
        body: Stack(
          children: <Widget>[
            Column(
              children: <Widget>[
                Flexible(
                  flex: 1,
                  child: Container(
                    color: theme.colorScheme.background,
                    child: Center(
                      child: MyText.titleMedium(
                        "Primary Content",
                        color: theme.colorScheme.onBackground,
                        letterSpacing: 0.2,
                      ),
                    ),
                  ),
                ),
                Flexible(
                  flex: 1,
                  child: Container(
                    color: theme.colorScheme.background,
                    child: Center(
                      child: MyText.titleMedium(
                        "Secondary Content",
                        color: theme.colorScheme.onBackground.withAlpha(220),
                        letterSpacing: 0.2,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Positioned(
              top: MediaQuery.of(context).size.height / 2 - 75,
              right: 20,
              child: FloatingActionButton(
                onPressed: () {
                  _showBottomSheet(context);
                },
                child: Icon(
                  Icons.info_outline,
                  size: 28,
                ),
              ),
            )
          ],
        ));
  }

  void _showBottomSheet(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext buildContext) {
          return Container(
            height: 180,
            color: Colors.transparent,
            child: Container(
              decoration: BoxDecoration(
                  color: theme.colorScheme.background,
                  borderRadius: BorderRadius.only(
                      topLeft: const Radius.circular(12.0),
                      topRight: const Radius.circular(12.0))),
              child: Padding(
                padding: const EdgeInsets.only(
                    top: 24.0, left: 24.0, right: 24.0, bottom: 36),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Icon(Icons.email,
                            color: theme.colorScheme.onBackground),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: MyText("nat@gmail.com",
                              letterSpacing: 0.15,
                              color: theme.colorScheme.onBackground),
                        )
                      ],
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 8),
                      child: Row(
                        children: <Widget>[
                          Icon(Icons.pin_drop,
                              color: theme.colorScheme.onBackground),
                          Padding(
                            padding: EdgeInsets.only(left: 8.0),
                            child: MyText("149  Cherry Tree Drive, Florida",
                                color: theme.colorScheme.onBackground,
                                letterSpacing: 0.15),
                          )
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 8),
                      child: Row(
                        children: <Widget>[
                          Icon(Icons.phone,
                              color: theme.colorScheme.onBackground),
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: MyText("+91 9876543210",
                                color: theme.colorScheme.onBackground,
                                letterSpacing: 0.15),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
