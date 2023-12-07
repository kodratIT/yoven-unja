/*
* File : Selectable List
* Version : 1.0.0
* */

import 'package:jambicraff/helpers/theme/app_theme.dart';
import 'package:jambicraff/helpers/widgets/my_text.dart';
import 'package:flutter/material.dart';

class SelectableList extends StatefulWidget {
  @override
  _SelectableListState createState() => _SelectableListState();
}

class _SelectableListState extends State<SelectableList> {
  final List<int> _list = List.generate(20, (i) => i);
  final List<bool> _selected = List.generate(20, (i) => false);
  late ThemeData theme;
  bool _isSelectable = false;
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
        body: ListView.separated(
            itemCount: _list.length,
            itemBuilder: (context, index) {
              return Ink(
                color: _selected[index]
                    ? theme.colorScheme.primary
                    : theme.colorScheme.background,
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundColor: _selected[index]
                        ? theme.colorScheme.secondary
                        : theme.colorScheme.secondary.withAlpha(240),
                    child: _selected[index]
                        ? Icon(
                            Icons.done,
                            color: theme.colorScheme.onSecondary,
                          )
                        : MyText.bodyLarge(_list[index].toString(),
                            fontWeight: 600,
                            color: _selected[index]
                                ? theme.colorScheme.onPrimary
                                : theme.colorScheme.onSecondary),
                  ),
                  subtitle: MyText.bodyMedium('Sub Item',
                      fontWeight: 500,
                      color: _selected[index]
                          ? theme.colorScheme.onPrimary
                          : theme.colorScheme.onBackground),
                  title: MyText.bodyLarge('Item - ${_list[index]}',
                      fontWeight: 600,
                      color: _selected[index]
                          ? theme.colorScheme.onPrimary
                          : theme.colorScheme.onBackground),
                  onTap: () => {
                    if (_isSelectable)
                      {
                        setState(() {
                          _selected[index] = !_selected[index];
                        })
                      },
                    if (!_selected.contains(true))
                      {
                        setState(() {
                          _isSelectable = false;
                        })
                      }
                  },
                  onLongPress: (() => setState(() => {
                        if (_isSelectable)
                          {_selected[index] = true}
                        else
                          {_isSelectable = true, _selected[index] = true}
                      })),
                ),
              );
            },
            separatorBuilder: (_, __) => Divider(
                  height: 0.5,
                  color: theme.dividerColor,
                )));
  }
}
