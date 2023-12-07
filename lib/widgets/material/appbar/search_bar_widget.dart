/*
* File : Searchbar widget
* Version : 1.0.0
* */

import 'package:jambicraff/helpers/theme/app_theme.dart';
import 'package:jambicraff/helpers/widgets/my_spacing.dart';
import 'package:jambicraff/helpers/widgets/my_text.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';

class SearchBarWidget extends StatefulWidget {
  @override
  _SearchBarWidgetState createState() => _SearchBarWidgetState();
}

class _SearchBarWidgetState extends State<SearchBarWidget> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  late ThemeData theme;
  late CustomTheme customTheme;

  @override
  void initState() {
    super.initState();
    theme = AppTheme.theme;
    customTheme = AppTheme.customTheme;
  }

  int _selectedPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      key: _scaffoldKey,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pop(context);
        },
        child: Icon(LucideIcons.chevronLeft),
      ),
      /*---------------Navigation Drawer ------------------*/
      drawer: Drawer(
          child: Container(
        color: theme.colorScheme.background,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Padding(
              padding: MySpacing.fromLTRB(16, 0, 16, 12),
              child: Container(
                margin: MySpacing.top(36),
                child: MyText.titleLarge("Mail",
                    color: theme.colorScheme.primary, letterSpacing: 0.2),
              ),
            ),
            Expanded(
              flex: 1,
              child: SingleChildScrollView(
                child: Padding(
                  padding: MySpacing.bottom(8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Divider(
                        height: 1,
                        color: theme.dividerColor,
                        thickness: 1,
                      ),
                      singleDrawerItem(Icons.inbox, "All Inboxes", 0),
                      Divider(
                        height: 1,
                        color: theme.dividerColor,
                        thickness: 1,
                      ),
                      singleDrawerItem(Icons.email_outlined, "Primary", 1),
                      singleDrawerItem(
                          Icons.account_circle_outlined, "Social", 2),
                      singleDrawerItem(Icons.tag_outlined, "Promotion", 3),
                      Container(
                        margin: EdgeInsets.only(
                            top: 12, left: 16, right: 16, bottom: 12),
                        child: Text("ALL LABELS",
                            style: theme.textTheme.bodySmall!.merge(TextStyle(
                                color: theme.colorScheme.onBackground
                                    .withAlpha(240),
                                fontWeight: FontWeight.w700,
                                letterSpacing: 0.35,
                                wordSpacing: 1.2))),
                      ),
                      singleDrawerItem(Icons.star_outlined, "Starred", 4),
                      singleDrawerItem(Icons.lock_clock_outlined, "Snoozed", 5),
                      singleDrawerItem(LucideIcons.send, "Sent", 6),
                      singleDrawerItem(Icons.file_copy_outlined, "Drafts", 7),
                      singleDrawerItem(Icons.email_outlined, "All Mail", 8),
                      singleDrawerItem(Icons.sd_card_alert_outlined, "Spam", 9),
                      singleDrawerItem(
                          Icons.restore_from_trash_outlined, "Bin", 10),
                      Container(
                        margin: EdgeInsets.only(
                            top: 12, left: 16, right: 16, bottom: 12),
                        child: Text("OTHER APPS",
                            style: theme.textTheme.bodySmall!.merge(TextStyle(
                                color: theme.colorScheme.onBackground
                                    .withAlpha(240),
                                fontWeight: FontWeight.w700,
                                letterSpacing: 0.35,
                                wordSpacing: 1.2))),
                      ),
                      singleDrawerItem(
                          Icons.calendar_today_outlined, "Calender", 11),
                      singleDrawerItem(
                          Icons.contact_mail_outlined, "Contact", 12),
                      Divider(
                        height: 1,
                        color: theme.dividerColor,
                        thickness: 1,
                      ),
                      singleDrawerItem(Icons.settings_outlined, "Settings", 13),
                      singleDrawerItem(
                          LucideIcons.helpCircle, "Help and feedback", 14),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      )),
      body: Stack(
        clipBehavior: Clip.none,
        children: <Widget>[
          // Replace this container with your Map widget
          Center(
            child: MyText.titleSmall("Content place here",
                color: theme.colorScheme.onBackground.withAlpha(240),
                letterSpacing: 0.2),
          ),
          Positioned(
            top: 40,
            right: 16,
            left: 16,
            child: Card(
              elevation: 3,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: MySpacing.xy(12, 8),
                child: Row(
                  children: <Widget>[
                    GestureDetector(
                        onTap: () {
                          _scaffoldKey.currentState!.openDrawer();
                        },
                        child: Icon(
                          Icons.menu_outlined,
                          size: 24,
                          color: theme.colorScheme.onBackground.withAlpha(240),
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
                              isDense: true),
                        ),
                      ),
                    ),
                    CircleAvatar(
                      radius: 16,
                      backgroundColor: theme.colorScheme.secondary,
                      child: Text(
                        "D",
                        style: theme.textTheme.titleSmall!.merge(
                            TextStyle(color: theme.colorScheme.onSecondary)),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget singleDrawerItem(IconData iconData, String title, int position) {
    return ListTile(
      dense: true,
      contentPadding: MySpacing.x(16),
      leading: Icon(iconData,
          size: 20,
          color: _selectedPage == position
              ? theme.colorScheme.primary
              : theme.colorScheme.onBackground.withAlpha(240)),
      title: MyText.titleSmall(title,
          fontWeight: _selectedPage == position ? 700 : 600,
          color: _selectedPage == position
              ? theme.colorScheme.primary
              : theme.colorScheme.onBackground.withAlpha(240)),
      onTap: () {
        setState(() {
          _selectedPage = position;
        });
        _scaffoldKey.currentState!.openEndDrawer();
      },
    );
  }
}
