/*
* File : Create File Bottom Sheet
* Version : 1.0.0
* */

import 'package:jambicraff/helpers/widgets/my_text.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';

import 'package:jambicraff/helpers/theme/app_theme.dart';

class FileManagerBottomSheetWidget extends StatefulWidget {
  @override
  _FileManagerBottomSheetWidgetState createState() =>
      _FileManagerBottomSheetWidgetState();
}

class _FileManagerBottomSheetWidgetState
    extends State<FileManagerBottomSheetWidget> {
  late CustomTheme customTheme;
  late ThemeData theme;

  @override
  void initState() {
    super.initState();
    customTheme = AppTheme.customTheme;
    theme = AppTheme.theme;
    WidgetsBinding.instance
        .addPostFrameCallback((_) => _showBottomSheet(context));
  }

  final List<int> _list = List.generate(20, (i) => i);

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
          title: MyText.titleMedium("File Manager", fontWeight: 600),
        ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            _showBottomSheet(context);
          },
          elevation: 2,
          backgroundColor: theme.colorScheme.primary,
          label: MyText("CREATE",
              color: theme.colorScheme.onPrimary,
              fontWeight: 600,
              letterSpacing: 0.3),
          icon: Icon(
            LucideIcons.plus,
            color: theme.colorScheme.onPrimary,
          ),
        ),
        body: Container(
          color: theme.colorScheme.background,
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: ListView.builder(
            itemCount: _list.length,
            itemBuilder: (context, index) {
              return Ink(
                  color: theme.colorScheme.background,
                  child: ListTile(
                    leading: Icon(
                      LucideIcons.folder,
                      color: theme.colorScheme.onBackground,
                    ),
                    title: MyText.bodyLarge('Folder - ${_list[index]}',
                        color: theme.colorScheme.onBackground),
                  ));
            },
          ),
        ));
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
                padding: EdgeInsets.all(16),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(left: 12, bottom: 8),
                      child: MyText.bodySmall("CREATE",
                          color: theme.colorScheme.onBackground.withAlpha(200),
                          letterSpacing: 0.3,
                          fontWeight: 700),
                    ),
                    ListTile(
                      dense: true,
                      leading: Icon(LucideIcons.file,
                          color: theme.colorScheme.onBackground.withAlpha(220)),
                      title: MyText.bodyLarge("File",
                          color: theme.colorScheme.onBackground,
                          letterSpacing: 0.3,
                          fontWeight: 500),
                    ),
                    ListTile(
                      dense: true,
                      leading: Icon(LucideIcons.folder,
                          color: theme.colorScheme.onBackground.withAlpha(220)),
                      title: MyText.bodyLarge("Folder",
                          color: theme.colorScheme.onBackground,
                          letterSpacing: 0.3,
                          fontWeight: 500),
                    ),
                    ListTile(
                      dense: true,
                      leading: Icon(LucideIcons.folder,
                          color: theme.colorScheme.onBackground.withAlpha(220)),
                      title: MyText.bodyLarge("Sharable Folder",
                          color: theme.colorScheme.onBackground,
                          letterSpacing: 0.3,
                          fontWeight: 500),
                    ),
                    Divider(
                      color: theme.dividerColor,
                    ),
                    ListTile(
                      dense: true,
                      leading: Icon(LucideIcons.uploadCloud,
                          color: theme.colorScheme.onBackground.withAlpha(220)),
                      title: MyText.bodyLarge("Upload photo",
                          color: theme.colorScheme.onBackground,
                          letterSpacing: 0.3,
                          fontWeight: 500),
                    ),
                    ListTile(
                      dense: true,
                      leading: Icon(LucideIcons.camera,
                          color: theme.colorScheme.onBackground.withAlpha(220)),
                      title: MyText.bodyLarge("Take Photo",
                          color: theme.colorScheme.onBackground,
                          letterSpacing: 0.3,
                          fontWeight: 500),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
