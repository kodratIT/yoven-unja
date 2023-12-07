/*
* File : Filter (Tags) Search
* Version : 1.0.0
* */

import 'dart:async';

import 'package:jambicraff/helpers/theme/app_theme.dart';
import 'package:jambicraff/helpers/widgets/my_spacing.dart';
import 'package:jambicraff/helpers/widgets/my_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:lucide_icons/lucide_icons.dart';

class FilterSearchWidget extends StatefulWidget {
  @override
  _FilterSearchWidgetState createState() => _FilterSearchWidgetState();
}

class _FilterSearchWidgetState extends State<FilterSearchWidget> {
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

  final List<String> _tagList = [
    "Not relevant",
    "Illegal",
    "Spam",
    "Offensive",
    "Uncivil",
    "Other",
  ];

  final List<String> _selectedTags = [];

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

  _buildChoiceList() {
    List<Widget> choices = [];
    for (var item in _tagList) {
      choices.add(Container(
        padding: MySpacing.all(2.0),
        child: ChoiceChip(
          selectedColor: theme.colorScheme.primary,
          label: MyText.bodyMedium(item,
              color: _selectedTags.contains(item)
                  ? theme.colorScheme.onPrimary
                  : theme.colorScheme.onBackground),
          selected: _selectedTags.contains(item),
          onSelected: (selected) {
            setState(() {
              _selectedTags.contains(item)
                  ? _selectedTags.remove(item)
                  : _selectedTags.add(item);
            });
          },
        ),
      ));
    }
    return choices;
  }

  @override
  Widget build(BuildContext context) {
    theme = Theme.of(context);
    return GetBuilder(
      tag: 'filter_search_widget',
      builder: (controller) {
        return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: theme,
            home: Scaffold(
                body: Column(
              children: <Widget>[
                MySpacing.height(32),
                Container(
                  margin: MySpacing.all(8),
                  child: Card(
                    elevation: 2,
                    child: Padding(
                      padding: MySpacing.xy(12, 8),
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
                                    color: theme.colorScheme.onBackground
                                        .withAlpha(240),
                                  )),
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
                                    textCapitalization:
                                        TextCapitalization.sentences,
                                    onSubmitted: _onSubmit,
                                  ),
                                ),
                              ),
                              CircleAvatar(
                                radius: 16,
                                backgroundColor: theme.colorScheme.secondary,
                                child: MyText.titleSmall("D",
                                    color: theme.colorScheme.onSecondary),
                              )
                            ],
                          ),
                          Divider(),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                margin: MySpacing.y(4),
                                child:
                                    MyText.bodyMedium("TAGS", fontWeight: 700),
                              ),
                              Wrap(
                                children: _buildChoiceList(),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
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
                                  Icons.sentiment_dissatisfied_outlined,
                                  size: 32,
                                  color: theme.colorScheme.onBackground,
                                ),
                                Container(
                                  margin: MySpacing.top(8),
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
            )));
      },
    );
  }
}
