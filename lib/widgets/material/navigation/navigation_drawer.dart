/*
* File : Navigation Drawer widget
* Version : 1.0.0
* Description :
* */

import 'package:jambicraff/images.dart';
import 'package:jambicraff/helpers/theme/app_theme.dart';
import 'package:jambicraff/helpers/widgets/my_spacing.dart';
import 'package:jambicraff/helpers/widgets/my_text.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';

class NavigationDrawerWidget extends StatefulWidget {
  @override
  _NavigationDrawerWidgetState createState() => _NavigationDrawerWidgetState();
}

class _NavigationDrawerWidgetState extends State<NavigationDrawerWidget> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey =
      GlobalKey<ScaffoldMessengerState>();

  int _selectedPage = 0;

  late ThemeData theme;
  late CustomTheme customTheme;

  @override
  void initState() {
    super.initState();
    theme = AppTheme.theme;
    customTheme = AppTheme.customTheme;
  }

  @override
  Widget build(BuildContext context) {
    theme = Theme.of(context);
    return Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          title: MyText.titleMedium("Drawer", fontWeight: 600),
        ),
        drawer: Drawer(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            /*---------- Drawer Header ----------------*/
            Expanded(
              flex: 2,
              child: DrawerHeader(
                padding: MySpacing.all(0),
                margin: MySpacing.all(0),
                decoration: BoxDecoration(color: theme.primaryColor),
                child: Padding(
                  padding: MySpacing.fromLTRB(16, 0, 16, 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Expanded(
                        flex: 1,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Container(
                                  width: 60,
                                  height: 60,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                        image: AssetImage(Images.profiles[1]),
                                        fit: BoxFit.fill),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Container(
                                  width: 40,
                                  height: 40,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                        image: AssetImage(Images.profiles[2]),
                                        fit: BoxFit.fill),
                                  ),
                                ),
                                MySpacing.width(20),
                                Container(
                                  width: 40,
                                  height: 40,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                        image: AssetImage(Images.profiles[3]),
                                        fit: BoxFit.fill),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          MyText.titleLarge("Taslima Beattie",
                              fontWeight: 600,
                              color: theme.colorScheme.onPrimary),
                          MyText.bodyMedium("tas@gmail.com",
                              color: theme.colorScheme.onPrimary,
                              fontWeight: 400)
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),

            /*------------- Drawer Content -------------*/
            Expanded(
              flex: 6,
              child: Container(
                color: theme.colorScheme.background,
                child: Padding(
                  padding: MySpacing.bottom(8),
                  child: ListView(
                    padding: MySpacing.all(0),
                    children: <Widget>[
                      singleDrawerItem(Icons.inbox, "All Inboxes", 0),
                      Divider(
                        height: 1,
                        color: theme.dividerColor,
                        thickness: 1,
                      ),
                      singleDrawerItem(Icons.email_outlined, "Primary", 1),
                      singleDrawerItem(Icons.groups_outlined, "Social", 2),
                      singleDrawerItem(Icons.tag_outlined, "Promotion", 3),
                      Container(
                        margin: MySpacing.only(
                            top: 12, left: 16, right: 16, bottom: 12),
                        child: Text("ALL LABELS",
                            style: theme.textTheme.bodySmall!.merge(TextStyle(
                                color: theme.colorScheme.onBackground
                                    .withAlpha(240),
                                fontWeight: FontWeight.w700,
                                letterSpacing: 0.35,
                                wordSpacing: 1.2))),
                      ),
                      singleDrawerItem(Icons.star_outline, "Starred", 4),
                      singleDrawerItem(Icons.schedule_outlined, "Snoozed", 5),
                      singleDrawerItem(Icons.send_outlined, "Sent", 6),
                      singleDrawerItem(
                          Icons.insert_drive_file_outlined, "Drafts", 7),
                      singleDrawerItem(
                          Icons.mark_email_read_outlined, "All Mail", 8),
                      singleDrawerItem(
                          Icons.report_gmailerrorred_outlined, "Spam", 9),
                      singleDrawerItem(Icons.delete_outline, "Bin", 10),
                      Container(
                        margin: MySpacing.only(
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
                          Icons.perm_contact_cal_outlined, "Contact", 12),
                      Divider(
                        height: 1,
                        color: theme.dividerColor,
                        thickness: 1,
                      ),
                      singleDrawerItem(Icons.build_outlined, "Settings", 13),
                      singleDrawerItem(
                          Icons.help_outline, "Help and feedback", 14),
                    ],
                  ),
                ),
              ),
            )
          ],
        )),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Icon(
            LucideIcons.chevronLeft,
            color: theme.colorScheme.onPrimary,
          ),
        ),
        body: Container(
          color: theme.colorScheme.background,
        ));
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
      title: Text(title,
          style: theme.textTheme.titleSmall!
              .merge(TextStyle(
                  fontWeight: _selectedPage == position
                      ? FontWeight.w600
                      : FontWeight.w500,
                  letterSpacing: 0.2))
              .merge(TextStyle(
                  color: _selectedPage == position
                      ? theme.colorScheme.primary
                      : theme.colorScheme.onBackground.withAlpha(240)))),
      onTap: () {
        setState(() {
          _selectedPage = position;
        });
        _scaffoldKey.currentState!.openEndDrawer();
      },
    );
  }

  void showSnackBarWithFloating(String message) {
    scaffoldMessengerKey.currentState!.showSnackBar(
      SnackBar(
        content: Text(
          message,
          style: theme.textTheme.titleSmall!
              .merge(TextStyle(color: theme.colorScheme.onPrimary)),
        ),
        backgroundColor: theme.colorScheme.primary,
        behavior: SnackBarBehavior.floating,
      ),
    );
  }
}
