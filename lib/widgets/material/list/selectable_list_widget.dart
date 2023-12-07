/*
* File : Selectable List
* Version : 1.0.0
* */

import 'package:yoven/helpers/theme/app_theme.dart';
import 'package:yoven/helpers/widgets/my_text.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';

class SelectableListWidget extends StatefulWidget {
  @override
  _SelectableListWidgetState createState() => _SelectableListWidgetState();
}

class _SelectableListWidgetState extends State<SelectableListWidget> {
  final List<int> _list = List.generate(20, (i) => i);
  final List<bool> _selected = List.generate(20, (i) => false);
  bool _isSelectable = false;

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
          title: MyText.titleMedium("Selectable List", fontWeight: 600),
        ),
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
