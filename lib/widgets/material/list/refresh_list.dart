/*
* File : Refresh List
* Version : 1.0.0
* */

import 'dart:async';

import 'package:yoven/helpers/theme/app_theme.dart';
import 'package:yoven/helpers/widgets/my_text.dart';
import 'package:flutter/material.dart';

class RefreshList extends StatefulWidget {
  @override
  _RefreshListState createState() => _RefreshListState();
}

class _RefreshListState extends State<RefreshList> {
  final GlobalKey<AnimatedListState> listKey = GlobalKey<AnimatedListState>();

  late ThemeData theme;
  late CustomTheme customTheme;

  @override
  void initState() {
    super.initState();
    theme = AppTheme.theme;
    customTheme = AppTheme.customTheme;
  }

  List<String> _items = [
    "Item - 2",
    "Item - 1",
  ];

  Widget _buildItem(BuildContext context, int index, animation) {
    String item = _items[index];
    return SlideTransition(
      position: Tween<Offset>(
        begin: Offset(0, 1),
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
          .insertItem(0, duration: Duration(milliseconds: 200));
      _items = ["Item - ${_items.length + 1}", ..._items];
    });
  }
}
