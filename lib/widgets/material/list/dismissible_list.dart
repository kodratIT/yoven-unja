/*
* File : Dismissible List
* Version : 1.0.0
* */

import 'package:yoven/helpers/theme/app_theme.dart';
import 'package:yoven/helpers/widgets/my_spacing.dart';
import 'package:yoven/helpers/widgets/my_text.dart';
import 'package:flutter/material.dart';

class DismissibleList extends StatefulWidget {
  @override
  _WidgetState createState() => _WidgetState();
}

class SingleMail {
  String name, title, message, date;
  bool isRead;

  SingleMail(this.name, this.title, this.message, this.date, this.isRead);
}

class _WidgetState extends State<DismissibleList> {
  final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey =
      GlobalKey<ScaffoldMessengerState>();

  late ThemeData theme;
  late CustomTheme customTheme;

  late List<SingleMail> _mailList;

  @override
  void initState() {
    super.initState();
    theme = AppTheme.theme;
    customTheme = AppTheme.customTheme;
    _mailList = [
      SingleMail("BookMyShow", "#stayinhome challenge is back",
          "this is dummy mail content", "25 May", false),
      SingleMail("Dribble", "#stayinhome challenge is back",
          "this is dummy mail content", "21 April", true),
      SingleMail("Google Trends", "#stayinhome challenge is back",
          "this is dummy mail content", "22 May", false),
      SingleMail("Dribble", "#stayinhome challenge is back",
          "this is dummy mail content", "19 Feb", false),
      SingleMail("Coursera", "#stayinhome challenge is back",
          "this is dummy mail content", "17 April", true),
      SingleMail("Lourensa", "#stayinhome challenge is back",
          "this is dummy mail content", "15 May", false),
      SingleMail("Codeforces", "#stayinhome challenge is back",
          "this is dummy mail content", "13 Jan", true),
      SingleMail("Flutter", "#stayinhome challenge is back",
          "this is dummy mail content", "28 May", true),
      SingleMail("Google", "#stayinhome challenge is back",
          "this is dummy mail content", "30 April", false),
      SingleMail("Dribble", "#stayinhome challenge is back",
          "this is dummy mail content", "25 May", true),
      SingleMail("Google Trends", "#stayinhome challenge is back",
          "this is dummy mail content", "28 May", false),
      SingleMail("Dribble", "#stayinhome challenge is back",
          "this is dummy mail content", "27 Feb", true),
      SingleMail("Coursera", "#stayinhome challenge is back",
          "this is dummy mail content", "14 May", false),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView.builder(
      padding: MySpacing.all(0),
      itemCount: _mailList.length,
      itemBuilder: (context, index) {
        return Dismissible(
          background: Container(
            color: theme.primaryColor,
            padding: MySpacing.symmetric(horizontal: 20),
            alignment: AlignmentDirectional.centerStart,
            child: Row(
              children: <Widget>[
                Icon(
                  Icons.delete_outline,
                  color: theme.colorScheme.onPrimary,
                ),
                Padding(
                  padding: MySpacing.left(8),
                  child: MyText.bodyMedium("Delete",
                      fontWeight: 500, color: theme.colorScheme.onPrimary),
                )
              ],
            ),
          ),
          secondaryBackground: Container(
            color: theme.primaryColor,
            padding: MySpacing.x(20),
            alignment: AlignmentDirectional.centerEnd,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                MyText.bodyMedium("Archive",
                    fontWeight: 500, color: theme.colorScheme.onPrimary),
                Padding(
                  padding: MySpacing.left(8),
                  child: Icon(
                    Icons.archive_outlined,
                    color: theme.colorScheme.onPrimary,
                  ),
                ),
              ],
            ),
          ),
          onDismissed: (direction) {
            if (direction == DismissDirection.endToStart) {
              setState(() {
                _mailList.removeAt(index);
                showSnackBarWithFloating("Archived");
              });
            } else {
              setState(() {
                _mailList.removeAt(index);
                showSnackBarWithFloating("Deleted");
              });
            }
          },
          key: UniqueKey(),
          child: Padding(
            padding: MySpacing.xy(16, 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                CircleAvatar(
                  backgroundColor: theme.colorScheme.primary,
                  child: MyText(
                    _mailList[index].name[0],
                    color: theme.colorScheme.onPrimary,
                  ),
                ),
                MySpacing.width(20),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Expanded(
                            flex: 1,
                            child: MyText.titleSmall(
                              _mailList[index].name,
                              fontWeight: _mailList[index].isRead ? 600 : 800,
                            ),
                          ),
                          MyText.titleSmall(
                            _mailList[index].date,
                            fontWeight: _mailList[index].isRead ? 600 : 800,
                          ),
                        ],
                      ),
                      MyText.titleSmall(
                        _mailList[index].title,
                        fontWeight: _mailList[index].isRead ? 600 : 800,
                      ),
                      MyText.bodyMedium(
                        _mailList[index].message,
                        fontWeight: 600,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
    ));
  }

  void showSnackBarWithFloating(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: MyText.titleSmall(message, color: theme.colorScheme.onPrimary),
        backgroundColor: theme.colorScheme.primary,
        behavior: SnackBarBehavior.floating,
      ),
    );
  }
}
