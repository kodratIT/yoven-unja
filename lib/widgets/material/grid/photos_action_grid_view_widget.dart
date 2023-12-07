/*
* File : Action with Grids
* Version : 1.0.0
* */

import 'package:yoven/helpers/theme/app_theme.dart';
import 'package:yoven/helpers/widgets/my_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:lucide_icons/lucide_icons.dart';

class PhotosActionGridViewWidget extends StatefulWidget {
  @override
  _PhotosActionGridViewWidgetState createState() =>
      _PhotosActionGridViewWidgetState();
}

class TextIconItem {
  String text;
  IconData iconData;

  TextIconItem(this.text, this.iconData);
}

class _PhotosActionGridViewWidgetState
    extends State<PhotosActionGridViewWidget> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey =
      GlobalKey<ScaffoldMessengerState>();

  late CustomTheme customTheme;
  late ThemeData theme;

  @override
  void initState() {
    super.initState();
    customTheme = AppTheme.customTheme;
    theme = AppTheme.theme;
  }

  final List<TextIconItem> _textIconChoice = [
    TextIconItem("View", LucideIcons.image),
    TextIconItem("Share", LucideIcons.share),
    TextIconItem("Delete", LucideIcons.delete),
    TextIconItem("Info", LucideIcons.info),
  ];

  final List<String> _imageList = [
    './assets/images/all/all-1.jpg',
    './assets/images/all/all-2.jpg',
    './assets/images/all/all-3.jpg',
    './assets/images/all/all-4.jpg',
    './assets/images/all/all-5.jpg',
    './assets/images/all/all-6.jpg',
    './assets/images/all/all-7.jpg',
    './assets/images/all/all-8.jpg',
    './assets/images/all/all-9.jpg',
    './assets/images/all/all-10.jpg',
    './assets/images/all/all-11.jpg',
    './assets/images/all/all-12.jpg',
    './assets/images/all/all-13.jpg',
    './assets/images/all/all-14.jpg',
    './assets/images/all/all-15.jpg',
  ];

  _generateGridItems() {
    List<Widget> list = [];
    for (int i = 0; i < 32; i++) {
      list.add(Stack(
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(4)),
            child: Image.asset(
              _imageList[i % 15],
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.fill,
            ),
          ),
          Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(4),
                        bottomRight: Radius.circular(4)),
                    color: Color(0xaa000000)),
                padding: EdgeInsets.all(12),
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
                        padding: EdgeInsets.all(0),
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
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 16, bottom: 0),
                                    child: MyText.labelMedium(choice.text,
                                        fontWeight: 600),
                                  )
                                ],
                              ),
                            );
                          }).toList();
                        },
                        onSelected: (dynamic textIconItem) {
                          showSimpleSnackbar(textIconItem.text + " clicked");
                        },
                        icon: Icon(
                          LucideIcons.moreVertical,
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
    return GetBuilder(
      tag: 'photos_action_grid_view_widget',
      builder: (controller) {
        return Scaffold(
            key: _scaffoldKey,
            appBar: AppBar(
              elevation: 0,
              leading: InkWell(
                onTap: () => Navigator.of(context).pop(),
                child: Icon(
                  LucideIcons.chevronLeft,
                  size: 20,
                ),
              ),
              title: MyText.titleMedium("Photo with Action", fontWeight: 600),
            ),
            body: Container(
                padding:
                    EdgeInsets.only(left: 12, right: 12, top: 0, bottom: 16),
                color: theme.colorScheme.background,
                child: GridView.count(
                    crossAxisCount: 2,
                    mainAxisSpacing: 8,
                    crossAxisSpacing: 8,
                    children: _generateGridItems())));
      },
    );
  }

  void showSimpleSnackbar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: Duration(milliseconds: 1000),
        content: MyText.titleSmall(message, color: theme.colorScheme.onPrimary),
        backgroundColor: theme.colorScheme.primary,
      ),
    );
  }
}
