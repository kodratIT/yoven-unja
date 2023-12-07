/*
* File : History Search
* Version : 1.0.0
* */

import 'dart:async';

import 'package:jambicraff/helpers/extensions/widgets_extension.dart';
import 'package:jambicraff/helpers/theme/app_theme.dart';
import 'package:jambicraff/helpers/utils/my_shadow.dart';
import 'package:jambicraff/helpers/widgets/my_card.dart';
import 'package:jambicraff/helpers/widgets/my_container.dart';
import 'package:jambicraff/helpers/widgets/my_spacing.dart';
import 'package:jambicraff/helpers/widgets/my_text.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';

class HistorySearchScreen extends StatefulWidget {
  @override
  _HistorySearchScreenState createState() => _HistorySearchScreenState();
}

class _HistorySearchScreenState extends State<HistorySearchScreen> {
  bool _isInProgress = false;
  Timer? _timer;
  late ThemeData theme;
  late CustomTheme customTheme;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => startTimer());

    theme = AppTheme.theme;
    customTheme = AppTheme.customTheme;
  }

  void _onSubmit(text) {
    startTimer();
  }

  void startTimer() {
    setState(() {
      _isInProgress = true;
    });
    const oneSec = Duration(milliseconds: 2500);
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
    return Scaffold(
        body: ListView(
      children: <Widget>[
        Container(
          margin: MySpacing.all(8),
          child: MyCard(
            shadow: MyShadow(elevation: 2),
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
                          color: theme.colorScheme.onBackground.withAlpha(240),
                        ).autoDirection()),
                    Expanded(
                      flex: 1,
                      child: Padding(
                        padding: MySpacing.fromLTRB(16, 0, 8, 0),
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
                    MyContainer.rounded(
                      paddingAll: 12,
                      color: theme.colorScheme.primary,
                      child: Center(
                        child: MyText.titleSmall("A",
                            color: theme.colorScheme.onPrimary),
                      ),
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
        ),
        MySpacing.height(32),
        _isInProgress
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
                        Icons.sentiment_dissatisfied_outlined,
                        size: 32,
                        color: theme.colorScheme.onBackground,
                      ),
                      Container(
                        margin: MySpacing.top(8),
                        child:
                            MyText.titleMedium("No Result!", fontWeight: 700),
                      ),
                      MyText.titleSmall("Try another keyword", fontWeight: 500),
                    ],
                  ),
                )),
      ],
    ));
  }

  Widget _suggestionWidget(String suggestion) {
    return Container(
      margin: MySpacing.top(8),
      child: Row(
        children: <Widget>[
          Icon(
            Icons.history,
            size: 22,
            color: theme.colorScheme.onBackground.withAlpha(220),
          ),
          Expanded(
            child: Container(
                padding: MySpacing.fromLTRB(16, 0, 8, 0),
                child: MyText.titleSmall(suggestion, fontWeight: 500)),
          )
        ],
      ),
    );
  }
}
