/*
* File : Gallery Bottom Sheet
* Version : 1.0.0
* */

import 'package:jambicraff/images.dart';
import 'package:jambicraff/helpers/theme/app_theme.dart';
import 'package:jambicraff/helpers/widgets/my_container.dart';
import 'package:jambicraff/helpers/widgets/my_spacing.dart';
import 'package:jambicraff/helpers/widgets/my_text.dart';
import 'package:flutter/material.dart';

class GalleryBottomSheet extends StatefulWidget {
  @override
  _GalleryBottomSheetState createState() => _GalleryBottomSheetState();
}

class _GalleryBottomSheetState extends State<GalleryBottomSheet> {
  late ThemeData theme;
  late CustomTheme customTheme;

  @override
  void initState() {
    super.initState();
    theme = AppTheme.theme;
    customTheme = AppTheme.customTheme;
  }

  final List<String> _imageList = Images.squares.sublist(0, 14);

  _generateGridItems() {
    List<Widget> list = [];
    for (int i = 0; i < 32; i++) {
      list.add(InkWell(
        onTap: () {
          _showBottomSheet(context);
        },
        child: MyContainer.none(
          borderRadiusAll: 4,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          child: Image(image: AssetImage(_imageList[i % 14]), fit: BoxFit.fill),
        ),
      ));
    }
    return list;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: GridView.count(
            crossAxisCount: 2,
            padding: MySpacing.all(16),
            mainAxisSpacing: 16,
            crossAxisSpacing: 16,
            children: _generateGridItems()));
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
                padding: MySpacing.all(16),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    ListTile(
                      dense: true,
                      leading: Icon(Icons.visibility_outlined,
                          color: theme.colorScheme.onBackground),
                      title: MyText.bodyLarge("Preview", fontWeight: 600),
                    ),
                    ListTile(
                        dense: true,
                        leading: Icon(Icons.share_outlined,
                            color: theme.colorScheme.onBackground),
                        title: MyText.bodyLarge("Share", fontWeight: 600)),
                    ListTile(
                        dense: true,
                        leading: Icon(Icons.download_outlined,
                            color: theme.colorScheme.onBackground),
                        title: MyText.bodyLarge("Download", fontWeight: 600)),
                    ListTile(
                        dense: true,
                        leading: Icon(Icons.content_copy,
                            color: theme.colorScheme.onBackground),
                        title:
                            MyText.bodyLarge("Make a copy", fontWeight: 600)),
                    ListTile(
                        dense: true,
                        leading: Icon(
                          Icons.delete_outline,
                          color: theme.colorScheme.onBackground,
                        ),
                        title: MyText.bodyLarge("Delete", fontWeight: 600)),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
