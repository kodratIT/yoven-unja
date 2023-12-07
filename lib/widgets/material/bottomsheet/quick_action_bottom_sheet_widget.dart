/*
* File : Quick Action Bottom Sheet
* Version : 1.0.0
* */

import 'package:yoven/helpers/theme/app_theme.dart';
import 'package:yoven/helpers/widgets/my_text.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class QuickActionBottomSheetWidget extends StatefulWidget {
  @override
  _QuickActionBottomSheetWidgetState createState() =>
      _QuickActionBottomSheetWidgetState();
}

class _QuickActionBottomSheetWidgetState
    extends State<QuickActionBottomSheetWidget> {
  late CustomTheme customTheme;
  late ThemeData theme;

  @override
  void initState() {
    super.initState();
    customTheme = AppTheme.customTheme;
    theme = AppTheme.theme;
    WidgetsBinding.instance
        .addPostFrameCallback((_) => _showBottomSheet(context));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
            onPressed: () {
              _showBottomSheet(context);
            },
            elevation: 2,
            backgroundColor: theme.floatingActionButtonTheme.backgroundColor,
            child: Icon(
              LucideIcons.zap,
              size: 26,
              color: theme.colorScheme.onPrimary,
            )),
        appBar: AppBar(
          elevation: 0,
          leading: InkWell(
            onTap: () => Navigator.of(context).pop(),
            child: Icon(
              LucideIcons.chevronLeft,
              size: 20,
            ),
          ),
          title: MyText.titleMedium("Quick Action", fontWeight: 600),
        ),
        body: Container(
          color: theme.colorScheme.background,
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Container(
                padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                color: theme.appBarTheme.backgroundColor,
                child: Row(
                  children: <Widget>[
                    Icon(
                      LucideIcons.info,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 8),
                      child: MyText.titleSmall(
                        "Tap on FAB",
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ));
  }

  void _showBottomSheet(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext buildContext) {
          return Container(
            color: Colors.transparent,
            child: Container(
              decoration: BoxDecoration(
                  color: theme.colorScheme.background,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(16),
                      topRight: Radius.circular(16))),
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    MyText.titleMedium("Quick Action", fontWeight: 700),
                    Container(
                      margin: EdgeInsets.only(top: 16),
                      child: Column(
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Expanded(
                                child: Column(
                                  children: <Widget>[
                                    _QuickActionWidget(
                                      iconData: LucideIcons.phoneCall,
                                      actionText: 'Prepaid',
                                    ),
                                    _QuickActionWidget(
                                      iconData: LucideIcons.train,
                                      actionText: 'Metro',
                                    ),
                                    _QuickActionWidget(
                                      iconData: MdiIcons.gasCylinder,
                                      actionText: 'Gas Bill',
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  children: <Widget>[
                                    _QuickActionWidget(
                                      iconData: LucideIcons.lightbulb,
                                      actionText: 'Electricity',
                                    ),
                                    _QuickActionWidget(
                                      iconData: LucideIcons.tv,
                                      actionText: 'DTH',
                                    ),
                                    _QuickActionWidget(
                                      iconData: MdiIcons.gold,
                                      actionText: 'Gold',
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  children: <Widget>[
                                    _QuickActionWidget(
                                      iconData: LucideIcons.phoneCall,
                                      actionText: 'Postpaid',
                                    ),
                                    _QuickActionWidget(
                                      iconData: MdiIcons.googlePlay,
                                      actionText: 'G Play',
                                    ),
                                    _QuickActionWidget(
                                      iconData: LucideIcons.umbrella,
                                      actionText: 'Insurance',
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }
}

class _QuickActionWidget extends StatelessWidget {
  final IconData iconData;
  final String actionText;

  _QuickActionWidget(
      {Key? key, required this.iconData, required this.actionText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Container(
      margin: EdgeInsets.only(top: 12, bottom: 12),
      child: Column(
        children: <Widget>[
          ClipOval(
            child: Material(
              color: theme.colorScheme.primary.withAlpha(20),
              // button color
              child: InkWell(
                splashColor: theme.colorScheme.primary.withAlpha(100),
                highlightColor: Colors.transparent,
                child: SizedBox(
                    width: 52,
                    height: 52,
                    child: Icon(
                      iconData,
                      color: theme.colorScheme.primary,
                    )),
                onTap: () {},
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 4),
            child: MyText.bodySmall(actionText, fontWeight: 600),
          )
        ],
      ),
    );
  }
}
