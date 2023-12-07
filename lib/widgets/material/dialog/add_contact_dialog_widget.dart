/*
* File : Add Contact
* Version : 1.0.0
* */

import 'package:yoven/helpers/theme/app_theme.dart';
import 'package:yoven/helpers/widgets/my_button.dart';
import 'package:yoven/helpers/widgets/my_text.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';

class AddContactDialogWidget extends StatefulWidget {
  @override
  _AddContactDialogWidgetState createState() => _AddContactDialogWidgetState();
}

class Contact {
  String name, number;

  Contact(this.name, this.number);
}

class _AddContactDialogWidgetState extends State<AddContactDialogWidget> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  late CustomTheme customTheme;
  late ThemeData theme;

  @override
  void initState() {
    super.initState();
    customTheme = AppTheme.customTheme;
    theme = AppTheme.theme;
  }

  @override
  Widget build(BuildContext context) {
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
          title: MyText.titleMedium("Contact", fontWeight: 600),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute<void>(
                builder: (BuildContext context) {
                  return _AddContactDialog();
                },
                fullscreenDialog: true));
          },
          elevation: 2,
          child: Icon(LucideIcons.userPlus),
        ),
        body: Container(
            color: theme.colorScheme.background,
            child: Center(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  MyText.titleSmall("Tap on ",
                      color: theme.colorScheme.onBackground,
                      letterSpacing: 0.2),
                  Icon(LucideIcons.userPlus,
                      size: 18, color: theme.colorScheme.onBackground),
                  MyText.titleSmall(" to add  contact",
                      color: theme.colorScheme.onBackground,
                      letterSpacing: 0.2),
                ],
              ),
            )));
  }
}

class _AddContactDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        title: MyText.titleMedium(
          'Create Contact',
          fontWeight: 600,
        ),
        actions: <Widget>[
          Container(
            margin: EdgeInsets.only(right: 16),
            child: Material(
                child: InkWell(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: Icon(LucideIcons.check))),
          )
        ],
      ),
      body: Container(
        padding: EdgeInsets.only(top: 8, bottom: 8, left: 16, right: 16),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                      width: 64,
                      height: 64,
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(32.0),
                          child: Image(
                            image: AssetImage(
                                "./assets/images/profile/avatar-place.png"),
                          ))),
                  Expanded(
                    flex: 1,
                    child: Container(
                      margin: EdgeInsets.only(left: 16),
                      child: Column(
                        children: <Widget>[
                          TextFormField(
                            style: theme.textTheme.titleSmall!.merge(TextStyle(
                                color: theme.colorScheme.onBackground)),
                            decoration: InputDecoration(
                              hintStyle: theme.textTheme.titleSmall!.merge(
                                  TextStyle(
                                      color: theme.colorScheme.onBackground)),
                              hintText: "First name",
                              border: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: AppTheme.customTheme.border),
                              ),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: AppTheme.customTheme.border),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: AppTheme.customTheme.border),
                              ),
                            ),
                            textCapitalization: TextCapitalization.sentences,
                          ),
                          TextFormField(
                            style: theme.textTheme.titleSmall!.merge(TextStyle(
                                color: theme.colorScheme.onBackground)),
                            decoration: InputDecoration(
                              hintStyle: theme.textTheme.titleSmall!.merge(
                                  TextStyle(
                                      color: theme.colorScheme.onBackground)),
                              hintText: "Surname",
                              border: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: AppTheme.customTheme.border),
                              ),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: AppTheme.customTheme.border),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: AppTheme.customTheme.border),
                              ),
                            ),
                            textCapitalization: TextCapitalization.sentences,
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
              Container(
                margin: EdgeInsets.only(top: 8),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      width: 64,
                      child: Center(
                        child: Icon(
                          LucideIcons.building,
                          color: theme.colorScheme.onBackground,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        margin: EdgeInsets.only(left: 16),
                        child: Column(
                          children: <Widget>[
                            TextFormField(
                              style: theme.textTheme.titleSmall!.merge(
                                  TextStyle(
                                      color: theme.colorScheme.onBackground)),
                              decoration: InputDecoration(
                                hintStyle: theme.textTheme.titleSmall!.merge(
                                    TextStyle(
                                        color: theme.colorScheme.onBackground)),
                                hintText: "Company",
                                border: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: AppTheme.customTheme.border),
                                ),
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: AppTheme.customTheme.border),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: AppTheme.customTheme.border),
                                ),
                              ),
                              textCapitalization: TextCapitalization.sentences,
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 8),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      width: 64,
                      child: Center(
                        child: Icon(
                          LucideIcons.briefcase,
                          color: theme.colorScheme.onBackground,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        margin: EdgeInsets.only(left: 16),
                        child: Column(
                          children: <Widget>[
                            TextFormField(
                              style: theme.textTheme.titleSmall!.merge(
                                  TextStyle(
                                      color: theme.colorScheme.onBackground)),
                              decoration: InputDecoration(
                                hintStyle: theme.textTheme.titleSmall!.merge(
                                    TextStyle(
                                        color: theme.colorScheme.onBackground)),
                                hintText: "Job title",
                                border: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: AppTheme.customTheme.border),
                                ),
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: AppTheme.customTheme.border),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: AppTheme.customTheme.border),
                                ),
                              ),
                              textCapitalization: TextCapitalization.sentences,
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 8),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      width: 64,
                      child: Center(
                        child: Icon(
                          LucideIcons.mail,
                          color: theme.colorScheme.onBackground,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        margin: EdgeInsets.only(left: 16),
                        child: Column(
                          children: <Widget>[
                            TextFormField(
                              style: theme.textTheme.titleSmall!.merge(
                                  TextStyle(
                                      color: theme.colorScheme.onBackground)),
                              decoration: InputDecoration(
                                hintStyle: theme.textTheme.titleSmall!.merge(
                                    TextStyle(
                                        color: theme.colorScheme.onBackground)),
                                hintText: "Email",
                                border: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: AppTheme.customTheme.border),
                                ),
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: AppTheme.customTheme.border),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: AppTheme.customTheme.border),
                                ),
                              ),
                              textCapitalization: TextCapitalization.sentences,
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 8),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      width: 64,
                      child: Center(
                        child: Icon(
                          LucideIcons.phone,
                          color: theme.colorScheme.onBackground,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        margin: EdgeInsets.only(left: 16),
                        child: Column(
                          children: <Widget>[
                            TextFormField(
                              style: theme.textTheme.titleSmall!.merge(
                                  TextStyle(
                                      color: theme.colorScheme.onBackground)),
                              decoration: InputDecoration(
                                hintStyle: theme.textTheme.titleSmall!.merge(
                                    TextStyle(
                                        color: theme.colorScheme.onBackground)),
                                hintText: "Phone",
                                border: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: AppTheme.customTheme.border),
                                ),
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: AppTheme.customTheme.border),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: AppTheme.customTheme.border),
                                ),
                              ),
                              textCapitalization: TextCapitalization.sentences,
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 8),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      width: 64,
                      child: Center(
                        child: Icon(
                          LucideIcons.stickyNote,
                          color: theme.colorScheme.onBackground,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        margin: EdgeInsets.only(left: 16),
                        child: Column(
                          children: <Widget>[
                            TextFormField(
                              style: theme.textTheme.titleSmall!.merge(
                                  TextStyle(
                                      color: theme.colorScheme.onBackground)),
                              decoration: InputDecoration(
                                hintStyle: theme.textTheme.titleSmall!.merge(
                                    TextStyle(
                                        color: theme.colorScheme.onBackground)),
                                hintText: "Note",
                                border: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: AppTheme.customTheme.border),
                                ),
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: AppTheme.customTheme.border),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: AppTheme.customTheme.border),
                                ),
                              ),
                              textCapitalization: TextCapitalization.sentences,
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 16),
                child: MyButton(
                    elevation: 0,
                    borderRadiusAll: 4,
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: MyText.labelMedium("Add to contact".toUpperCase(),
                        color: theme.colorScheme.onPrimary,
                        letterSpacing: 0.3)),
              )
            ],
          ),
        ),
      ),
    );
  }
}
