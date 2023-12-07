/*
* File : Create File Bottom Sheet
* Version : 1.0.0
* */

import 'package:jambicraff/helpers/theme/app_theme.dart';
import 'package:jambicraff/helpers/widgets/my_spacing.dart';
import 'package:jambicraff/helpers/widgets/my_text.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';

class FileManagerBottomSheet extends StatefulWidget {
  @override
  _FileManagerBottomSheetState createState() => _FileManagerBottomSheetState();
}

class _FileManagerBottomSheetState extends State<FileManagerBottomSheet> {
  late ThemeData theme;
  late CustomTheme customTheme;

  @override
  void initState() {
    super.initState();
    theme = AppTheme.theme;
    customTheme = AppTheme.customTheme;
  }

  final List<int> _list = List.generate(20, (i) => i);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            _showBottomSheet(context);
          },
          elevation: 2,
          backgroundColor: theme.colorScheme.primary,
          label: MyText(
            "CREATE",
            fontWeight: 600,
            letterSpacing: 0.3,
            color: theme.colorScheme.onPrimary,
          ),
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
                padding: MySpacing.all(16),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                        margin: MySpacing.fromLTRB(12, 0, 0, 8),
                        child: MyText.bodySmall("CREATE",
                            color:
                                theme.colorScheme.onBackground.withAlpha(200),
                            letterSpacing: 0.3,
                            fontWeight: 700)),
                    ListTile(
                      dense: true,
                      leading: Icon(Icons.file_copy_outlined,
                          color: theme.colorScheme.onBackground.withAlpha(220)),
                      title: Text(
                        "File",
                        style: theme.textTheme.bodyLarge!.merge(TextStyle(
                            color: theme.colorScheme.onBackground,
                            letterSpacing: 0.3,
                            fontWeight: FontWeight.w500)),
                      ),
                    ),
                    ListTile(
                      dense: true,
                      leading: Icon(Icons.folder_open_outlined,
                          color: theme.colorScheme.onBackground.withAlpha(220)),
                      title: Text(
                        "Folder",
                        style: theme.textTheme.bodyLarge!.merge(TextStyle(
                            color: theme.colorScheme.onBackground,
                            letterSpacing: 0.3,
                            fontWeight: FontWeight.w500)),
                      ),
                    ),
                    ListTile(
                      dense: true,
                      leading: Icon(Icons.folder_open_outlined,
                          color: theme.colorScheme.onBackground.withAlpha(220)),
                      title: Text(
                        "Sharable Folder",
                        style: theme.textTheme.bodyLarge!.merge(TextStyle(
                            color: theme.colorScheme.onBackground,
                            letterSpacing: 0.3,
                            fontWeight: FontWeight.w500)),
                      ),
                    ),
                    Divider(
                      color: theme.dividerColor,
                    ),
                    ListTile(
                      dense: true,
                      leading: Icon(Icons.cloud_upload_outlined,
                          color: theme.colorScheme.onBackground.withAlpha(220)),
                      title: Text(
                        "Upload photo",
                        style: theme.textTheme.bodyLarge!.merge(TextStyle(
                            color: theme.colorScheme.onBackground,
                            letterSpacing: 0.3,
                            fontWeight: FontWeight.w500)),
                      ),
                    ),
                    ListTile(
                      dense: true,
                      leading: Icon(Icons.camera_alt_outlined,
                          color: theme.colorScheme.onBackground.withAlpha(220)),
                      title: Text(
                        "Take Photo",
                        style: theme.textTheme.bodyLarge!.merge(TextStyle(
                            color: theme.colorScheme.onBackground,
                            letterSpacing: 0.3,
                            fontWeight: FontWeight.w500)),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
