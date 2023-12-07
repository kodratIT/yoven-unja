/*
* File : Add Contact
* Version : 1.0.0
* */

import 'package:yoven/helpers/theme/app_theme.dart';
import 'package:yoven/helpers/widgets/my_button.dart';
import 'package:yoven/helpers/widgets/my_spacing.dart';
import 'package:yoven/helpers/widgets/my_text.dart';
import 'package:yoven/helpers/widgets/my_text_style.dart';
import 'package:yoven/images.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';

class AddContactDialog extends StatefulWidget {
  @override
  _AddContactDialogState createState() => _AddContactDialogState();
}

class Contact {
  String name, number;

  Contact(this.name, this.number);
}

class _AddContactDialogState extends State<AddContactDialog> {
  late ThemeData theme;
  late CustomTheme customTheme;

  @override
  void initState() {
    super.initState();
    theme = AppTheme.theme;
    customTheme = AppTheme.customTheme;
  }

  void _showDialog() {
    showDialog(
        context: context,
        builder: (BuildContext context) => _AddContactDialog());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            _showDialog();
          },
          elevation: 2,
          child: Icon(LucideIcons.userCircle2),
        ),
        body: Center(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              MyText.titleSmall("Tap on ",
                  color: theme.colorScheme.onBackground, letterSpacing: 0.2),
              Icon(LucideIcons.userCircle2,
                  size: 18, color: theme.colorScheme.onBackground),
              MyText.titleSmall(" to add  contact",
                  color: theme.colorScheme.onBackground, letterSpacing: 0.2),
            ],
          ),
        ));
  }
}

class _AddContactDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      child: Container(
        padding: MySpacing.all(16),
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
                            image: AssetImage(Images.profilePlaceholder),
                            fit: BoxFit.cover,
                          ))),
                  MySpacing.width(20),
                  Expanded(
                    child: Column(
                      children: <Widget>[
                        TextFormField(
                          style: MyTextStyle.bodyMedium(),
                          decoration: InputDecoration(
                            hintStyle: MyTextStyle.bodyMedium(),
                            hintText: "First name",
                            border: UnderlineInputBorder(
                              borderSide: BorderSide(),
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(),
                            ),
                          ),
                          textCapitalization: TextCapitalization.sentences,
                        ),
                        TextFormField(
                          style: MyTextStyle.bodyMedium(),
                          decoration: InputDecoration(
                            hintStyle: MyTextStyle.bodyMedium(),
                            hintText: "Surname",
                            border: UnderlineInputBorder(
                              borderSide: BorderSide(),
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(),
                            ),
                          ),
                          textCapitalization: TextCapitalization.sentences,
                        ),
                      ],
                    ),
                  )
                ],
              ),
              Container(
                margin: MySpacing.top(8),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      width: 64,
                      child: Center(
                        child: Icon(
                          LucideIcons.home,
                          size: 20,
                          color: themeData.colorScheme.onBackground,
                        ),
                      ),
                    ),
                    MySpacing.width(20),
                    Expanded(
                      child: TextFormField(
                        style: MyTextStyle.bodyMedium(),
                        decoration: InputDecoration(
                          hintStyle: MyTextStyle.bodyMedium(),
                          hintText: "Company",
                          border: UnderlineInputBorder(
                            borderSide: BorderSide(),
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(),
                          ),
                        ),
                        textCapitalization: TextCapitalization.sentences,
                      ),
                    )
                  ],
                ),
              ),
              Container(
                margin: MySpacing.top(8),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      width: 64,
                      child: Center(
                        child: Icon(
                          LucideIcons.briefcase,
                          size: 20,
                          color: themeData.colorScheme.onBackground,
                        ),
                      ),
                    ),
                    MySpacing.width(20),
                    Expanded(
                      child: TextFormField(
                        style: MyTextStyle.bodyMedium(),
                        decoration: InputDecoration(
                          hintStyle: MyTextStyle.bodyMedium(),
                          hintText: "Job title",
                          border: UnderlineInputBorder(
                            borderSide: BorderSide(),
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(),
                          ),
                        ),
                        textCapitalization: TextCapitalization.sentences,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: MySpacing.only(top: 8),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      width: 64,
                      child: Center(
                        child: Icon(
                          LucideIcons.mail,
                          size: 20,
                          color: themeData.colorScheme.onBackground,
                        ),
                      ),
                    ),
                    MySpacing.width(20),
                    Expanded(
                      child: TextFormField(
                        style: MyTextStyle.bodyMedium(),
                        decoration: InputDecoration(
                          hintStyle: MyTextStyle.bodyMedium(),
                          hintText: "Email",
                          border: UnderlineInputBorder(
                            borderSide: BorderSide(),
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(),
                          ),
                        ),
                        textCapitalization: TextCapitalization.sentences,
                      ),
                    )
                  ],
                ),
              ),
              Container(
                margin: MySpacing.top(8),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      width: 64,
                      child: Center(
                        child: Icon(
                          LucideIcons.phone,
                          size: 20,
                          color: themeData.colorScheme.onBackground,
                        ),
                      ),
                    ),
                    MySpacing.width(20),
                    Expanded(
                      child: TextFormField(
                        style: MyTextStyle.bodyMedium(),
                        decoration: InputDecoration(
                          hintStyle: MyTextStyle.bodyMedium(),
                          hintText: "Phone",
                          border: UnderlineInputBorder(
                            borderSide: BorderSide(),
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(),
                          ),
                        ),
                        textCapitalization: TextCapitalization.sentences,
                      ),
                    )
                  ],
                ),
              ),
              Container(
                margin: MySpacing.top(8),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      width: 64,
                      child: Center(
                        child: Icon(
                          LucideIcons.filePlus,
                          size: 20,
                          color: themeData.colorScheme.onBackground,
                        ),
                      ),
                    ),
                    MySpacing.width(20),
                    Expanded(
                      child: TextFormField(
                        style: MyTextStyle.bodyMedium(),
                        decoration: InputDecoration(
                          hintStyle: MyTextStyle.bodyMedium(),
                          hintText: "Note",
                          border: UnderlineInputBorder(
                            borderSide: BorderSide(),
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(),
                          ),
                        ),
                        textCapitalization: TextCapitalization.sentences,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                  margin: MySpacing.top(16),
                  child: MyButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    elevation: 0,
                    borderRadiusAll: 4,
                    child: MyText.labelMedium("Add to contact".toUpperCase(),
                        color: themeData.colorScheme.onPrimary,
                        letterSpacing: 0.4),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
