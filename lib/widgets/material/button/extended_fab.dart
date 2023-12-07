/*
* File : Extended FAB
* Version : 1.0.0
* */

import 'package:yoven/helpers/theme/app_theme.dart';
import 'package:yoven/helpers/widgets/my_spacing.dart';
import 'package:yoven/helpers/widgets/my_text.dart';
import 'package:flutter/material.dart';

class ExtendedFAB extends StatefulWidget {
  @override
  _ExtendedFABState createState() => _ExtendedFABState();
}

class Contact {
  String name, number;

  Contact(this.name, this.number);
}

class _ExtendedFABState extends State<ExtendedFAB> {
  late ThemeData theme;
  final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey =
      GlobalKey<ScaffoldMessengerState>();
  late CustomTheme customTheme;

  late List<Contact> _contactList;

  @override
  void initState() {
    super.initState();
    theme = AppTheme.theme;
    customTheme = AppTheme.customTheme;
    _contactList = [
      Contact("Zahra Tate", "+1 987456321"),
      Contact("Willard Palmer", "+4 154789632"),
      Contact("Charlotte Small", "+1 521478963"),
      Contact("Stanley Lindsey", "+18 123654789"),
      Contact("Ebony Bowman", "+4 987456321"),
      Contact("Rosa Lloyd", "+91 789456321"),
      Contact("Shane Roman", "+1 147852369"),
      Contact("Ashley Cruz", "+14 159632147"),
      Contact("Elle Mendoza", "+78 697412369"),
      Contact("Kieron Lucero", "+178 52314569"),
      Contact("Mitchell Brady", "0291 215496"),
      Contact("Casey Calderon", "+1 125893478"),
      Contact("Jodie Caldwell", "+1 147852369"),
    ];
  }

  @override
  Widget build(BuildContext context) {
    theme = Theme.of(context);
    return Scaffold(
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            showSnackBar("Add  contact");
          },
          elevation: 2,
          label: MyText.titleSmall(" contact".toUpperCase(),
              fontWeight: 600,
              color: theme.colorScheme.onPrimary,
              letterSpacing: 0.3),
          icon: Icon(Icons.add),
        ),
        body: Container(
            color: theme.colorScheme.background,
            child: ListView.builder(
              padding: MySpacing.all(0),
              itemCount: _contactList.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: MySpacing.fromLTRB(16, 16, 16, 8),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      CircleAvatar(
                        backgroundColor: theme.colorScheme.secondary,
                        child: MyText.titleMedium(_contactList[index].name[0],
                            color: theme.colorScheme.onSecondary),
                      ),
                      MySpacing.width(20),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            MyText.titleMedium(_contactList[index].name,
                                fontWeight: 600),
                            MyText.bodyMedium(_contactList[index].number,
                                fontWeight: 500),
                          ],
                        ),
                      )
                    ],
                  ),
                );
              },
            )));
  }

  void showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: MyText.titleSmall(message, color: theme.colorScheme.onPrimary),
        backgroundColor: theme.colorScheme.primary,
        behavior: SnackBarBehavior.fixed,
      ),
    );
  }
}
