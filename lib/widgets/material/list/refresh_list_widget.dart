/*
* File : Refresh List
* Version : 1.0.0
* */

import 'dart:async';

import 'package:jambicraff/helpers/theme/app_theme.dart';
import 'package:jambicraff/helpers/widgets/my_text.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';

class RefreshListWidget extends StatefulWidget {
  @override
  _RefreshListWidgetState createState() => _RefreshListWidgetState();
}

class _RefreshListWidgetState extends State<RefreshListWidget> {
  final GlobalKey<AnimatedListState> listKey = GlobalKey<AnimatedListState>();

  late CustomTheme customTheme;
  late ThemeData theme;

  @override
  void initState() {
    super.initState();
    customTheme = AppTheme.customTheme;
    theme = AppTheme.theme;
  }

  List<String> _items = [
    "Item - 2",
    "Item - 1",
  ];

  Widget _buildItem(BuildContext context, int index, animation) {
    String item = _items[index];
    return SlideTransition(
      position: Tween<Offset>(
        begin: const Offset(0, 1),
        end: Offset.zero,
      ).animate(animation),
      child: ListTile(
        title: MyText.bodyLarge(item, fontWeight: 600, letterSpacing: 0.3),
      ),
    );
  }

  Future<void> _onRefresh() async {
    await Future.delayed(Duration(milliseconds: 2000));
    addItem();
    return;
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
          title: MyText.titleMedium("Pull to Refresh", fontWeight: 600),
        ),
        body: RefreshIndicator(
          backgroundColor: theme.colorScheme.background,
          color: theme.colorScheme.primary,
          onRefresh: _onRefresh,
          child: AnimatedList(
            key: listKey,
            initialItemCount: _items.length,
            itemBuilder: (context, index, animation) {
              return _buildItem(context, index, animation);
            },
          ),
        ));
  }

  void addItem() {
    setState(() {
      listKey.currentState!
          .insertItem(0, duration: const Duration(milliseconds: 200));
      _items = ["Item - ${_items.length + 1}", ..._items];
    });
  }
}
