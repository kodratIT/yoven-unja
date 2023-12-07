/*
* File : Action with Grids
* Version : 1.0.0
* */

import 'package:jambicraff/helpers/theme/app_theme.dart';
import 'package:jambicraff/helpers/widgets/my_container.dart';
import 'package:jambicraff/helpers/widgets/my_spacing.dart';
import 'package:jambicraff/helpers/widgets/my_text.dart';
import 'package:jambicraff/images.dart';
import 'package:flutter/material.dart';

class GridActionScreen extends StatefulWidget {
  @override
  _GridActionScreenState createState() => _GridActionScreenState();
}

class TextIconItem {
  String text;
  IconData iconData;

  TextIconItem(this.text, this.iconData);
}

class _GridActionScreenState extends State<GridActionScreen> {
  late ThemeData theme;
  late CustomTheme customTheme;

  @override
  void initState() {
    super.initState();
    theme = AppTheme.theme;
    customTheme = AppTheme.customTheme;
  }

  final List<TextIconItem> _textIconChoice = [
    TextIconItem("View", Icons.image_outlined),
    TextIconItem("Share", Icons.share_outlined),
    TextIconItem("Delete", Icons.delete_outline),
    TextIconItem("Info", Icons.info_outline),
  ];

  final List<String> _imageList = Images.squares.sublist(0, 14);

  _generateGridItems() {
    List<Widget> list = [];
    for (int i = 0; i < 32; i++) {
      list.add(Stack(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        fit: StackFit.expand,
        children: <Widget>[
          MyContainer(
            paddingAll: 0,
            borderRadiusAll: 8,
            clipBehavior: Clip.antiAliasWithSaveLayer,
            child: Image.asset(
              _imageList[i % 12],
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: MyContainer(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(8),
                    bottomRight: Radius.circular(8)),
                color: Color(0xaa000000),
                padding: MySpacing.all(12),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    MyText.titleMedium("Item $i",
                        fontWeight: 500, color: Colors.white),
                    SizedBox(
                      height: 16,
                      width: 16,
                      child: PopupMenuButton(
                        padding: MySpacing.all(0),
                        itemBuilder: (BuildContext context) {
                          return _textIconChoice.map((TextIconItem choice) {
                            return PopupMenuItem(
                              height: 36,
                              value: choice,
                              child: Row(
                                children: <Widget>[
                                  Icon(choice.iconData,
                                      size: 20,
                                      color: theme.colorScheme.onBackground),
                                  MySpacing.width(8),
                                  MyText.labelMedium(choice.text,
                                      fontWeight: 600)
                                ],
                              ),
                            );
                          }).toList();
                        },
                        onSelected: (dynamic textIconItem) {
                          showSimpleSnackBar(textIconItem.text + " clicked");
                        },
                        icon: Icon(
                          Icons.more_vert_sharp,
                          size: 18,
                          color: Colors.white,
                        ),
                        color: theme.colorScheme.background,
                      ),
                    ),
                  ],
                ),
              ))
        ],
      ));
    }
    return list;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            padding: MySpacing.xy(12, 16),
            color: theme.colorScheme.background,
            child: GridView.count(
                crossAxisCount: 2,
                mainAxisSpacing: 8,
                crossAxisSpacing: 8,
                children: _generateGridItems())));
  }

  void showSimpleSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: Duration(milliseconds: 1000),
        content: MyText.titleSmall(message, color: theme.colorScheme.onPrimary),
        backgroundColor: theme.colorScheme.primary,
      ),
    );
  }
}
