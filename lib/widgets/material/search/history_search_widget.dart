/*
* File : History Search
* Version : 1.0.0
* */

import 'dart:async';

import 'package:yoven/helpers/theme/app_theme.dart';
import 'package:yoven/helpers/widgets/my_container.dart';
import 'package:yoven/helpers/widgets/my_spacing.dart';
import 'package:yoven/helpers/widgets/my_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:lucide_icons/lucide_icons.dart';

class HistorySearchWidget extends StatefulWidget {
  @override
  _HistorySearchWidgetState createState() => _HistorySearchWidgetState();
}

class _HistorySearchWidgetState extends State<HistorySearchWidget> {
  bool _isInProgress = false;
  Timer? _timer;
  late CustomTheme customTheme;
  late ThemeData theme;

  @override
  void initState() {
    super.initState();
    customTheme = AppTheme.customTheme;
    theme = AppTheme.theme;
    WidgetsBinding.instance.addPostFrameCallback((_) => startTimer());
  }

  void _onSubmit(text) {
    startTimer();
  }

  void startTimer() {
    setState(() {
      _isInProgress = true;
    });
    const oneSec = const Duration(milliseconds: 2500);
    _timer = Timer.periodic(
        oneSec,
        (Timer timer) => {
              _timer!.cancel(),
              setState(
                () {
                  _isInProgress = false;
                },
              )
            });
  }

  @override
  void dispose() {
    super.dispose();
    if (_timer != null) _timer!.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      tag: 'history_search_widget',
      builder: (controller) {
        return Scaffold(
            body: Column(
          children: <Widget>[
            MySpacing.height(MySpacing.safeAreaTop(context)),
            MyContainer(
              padding: const EdgeInsets.only(
                  left: 12.0, top: 8, right: 12, bottom: 8),
              margin: EdgeInsets.all(20),
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Icon(
                            LucideIcons.chevronLeft,
                            size: 24,
                            color:
                                theme.colorScheme.onBackground.withAlpha(240),
                          )),
                      Expanded(
                        flex: 1,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 16.0, right: 8),
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: "Search here",
                              border: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              enabledBorder: InputBorder.none,
                              disabledBorder: InputBorder.none,
                              errorBorder: InputBorder.none,
                              focusedErrorBorder: InputBorder.none,
                              isDense: true,
                            ),
                            autofocus: true,
                            maxLines: 1,
                            textInputAction: TextInputAction.search,
                            textCapitalization: TextCapitalization.sentences,
                            onSubmitted: _onSubmit,
                          ),
                        ),
                      ),
                      CircleAvatar(
                        radius: 16,
                        backgroundColor: theme.colorScheme.secondary,
                        child:
                            MyText("A", color: theme.colorScheme.onSecondary),
                      )
                    ],
                  ),
                  Divider(),
                  _suggestionWidget('Suggestion 1'),
                  _suggestionWidget('Suggestion 2'),
                  _suggestionWidget('Suggestion 3'),
                ],
              ),
            ),
            Expanded(
              child: _isInProgress
                  ? Center(
                      child: CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation<Color>(
                        theme.colorScheme.primary,
                      )),
                    )
                  : Container(
                      color: theme.colorScheme.background,
                      child: Center(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Icon(
                              LucideIcons.frown,
                              size: 32,
                              color: theme.colorScheme.onBackground,
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 8),
                              child: MyText.titleMedium("No Result!",
                                  fontWeight: 700),
                            ),
                            MyText.titleSmall("Try another keyword",
                                fontWeight: 500),
                          ],
                        ),
                      )),
            ),
          ],
        ));
      },
    );
  }

  Widget _suggestionWidget(String suggestion) {
    return Container(
      margin: EdgeInsets.only(top: 8),
      child: Row(
        children: <Widget>[
          Icon(
            LucideIcons.history,
            size: 22,
            color: theme.colorScheme.onBackground.withAlpha(220),
          ),
          Expanded(
            child: Container(
                padding: const EdgeInsets.only(left: 16.0, right: 8),
                child: MyText.titleSmall(suggestion, fontWeight: 500)),
          )
        ],
      ),
    );
  }
}
