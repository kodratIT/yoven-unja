/*
* File : Personal Information Form
* Version : 1.0.0
* */

import 'package:yoven/helpers/theme/app_theme.dart';
import 'package:yoven/helpers/widgets/my_spacing.dart';
import 'package:yoven/helpers/widgets/my_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:lucide_icons/lucide_icons.dart';

class PersonalInformationFormWidget extends StatefulWidget {
  @override
  _PersonalInformationFormWidgetState createState() =>
      _PersonalInformationFormWidgetState();
}

class _PersonalInformationFormWidgetState
    extends State<PersonalInformationFormWidget> {
  int? _radioValue = 1;

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
    return GetBuilder(
      tag: 'personal_information_form_widget',
      builder: (controller) {
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
              title:
                  MyText.titleMedium("Personal Information", fontWeight: 600),
            ),
            body: SingleChildScrollView(
              child: Container(
                padding: MySpacing.nTop(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.only(
                          left: 0, right: 20, top: 0, bottom: 12),
                      child: MyText.titleMedium("Personal", fontWeight: 600),
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: "First Name",
                        border: theme.inputDecorationTheme.border,
                        enabledBorder: theme.inputDecorationTheme.border,
                        focusedBorder: theme.inputDecorationTheme.focusedBorder,
                        prefixIcon: Icon(LucideIcons.user, size: 24),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 8),
                      child: TextFormField(
                        decoration: InputDecoration(
                          labelText: "Last Name",
                          border: theme.inputDecorationTheme.border,
                          enabledBorder: theme.inputDecorationTheme.border,
                          focusedBorder:
                              theme.inputDecorationTheme.focusedBorder,
                          prefixIcon: Icon(LucideIcons.user, size: 24),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 8),
                      child: TextFormField(
                        decoration: InputDecoration(
                          labelText: "DOB",
                          hintText: "DD/MM/YYYY",
                          border: theme.inputDecorationTheme.border,
                          enabledBorder: theme.inputDecorationTheme.border,
                          focusedBorder:
                              theme.inputDecorationTheme.focusedBorder,
                          prefixIcon: Icon(
                            LucideIcons.calendar,
                            size: 24,
                          ),
                        ),
                      ),
                    ),
                    Row(
                      children: <Widget>[
                        MyText.bodyLarge("Gender", fontWeight: 600),
                        Container(
                          margin: EdgeInsets.only(left: 8),
                          child: Radio(
                            value: 1,
                            activeColor: theme.colorScheme.primary,
                            groupValue: _radioValue,
                            onChanged: (int? value) {
                              setState(() {
                                _radioValue = value;
                              });
                            },
                          ),
                        ),
                        MyText.titleSmall("Male",
                            color:
                                theme.colorScheme.onBackground.withAlpha(240),
                            letterSpacing: 0.2,
                            fontWeight: 500),
                        Container(
                          margin: EdgeInsets.only(left: 8),
                          child: Radio(
                            value: 2,
                            activeColor: theme.colorScheme.primary,
                            groupValue: _radioValue,
                            onChanged: (int? value) {
                              setState(() {
                                _radioValue = value;
                              });
                            },
                          ),
                        ),
                        MyText.titleSmall("Female",
                            color:
                                theme.colorScheme.onBackground.withAlpha(240),
                            letterSpacing: 0.2,
                            fontWeight: 500),
                      ],
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 20),
                      child: MyText.titleMedium("Contact", fontWeight: 600),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 8),
                      child: TextFormField(
                        decoration: InputDecoration(
                          labelText: "Email Address",
                          border: theme.inputDecorationTheme.border,
                          enabledBorder: theme.inputDecorationTheme.border,
                          focusedBorder:
                              theme.inputDecorationTheme.focusedBorder,
                          prefixIcon: Icon(
                            LucideIcons.mail,
                            size: 24,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 8),
                      child: TextFormField(
                        decoration: InputDecoration(
                          labelText: "Contact",
                          border: theme.inputDecorationTheme.border,
                          enabledBorder: theme.inputDecorationTheme.border,
                          focusedBorder:
                              theme.inputDecorationTheme.focusedBorder,
                          prefixIcon: Icon(
                            LucideIcons.phone,
                            size: 24,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 20),
                      child: MyText.titleMedium("Other Information",
                          fontWeight: 600),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 8),
                      child: TextFormField(
                        decoration: InputDecoration(
                          labelText: "Nick Name",
                          border: theme.inputDecorationTheme.border,
                          enabledBorder: theme.inputDecorationTheme.border,
                          focusedBorder:
                              theme.inputDecorationTheme.focusedBorder,
                          prefixIcon: Icon(LucideIcons.users2, size: 24),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 8),
                      child: TextFormField(
                        decoration: InputDecoration(
                          labelText: "Interest",
                          border: theme.inputDecorationTheme.border,
                          enabledBorder: theme.inputDecorationTheme.border,
                          focusedBorder:
                              theme.inputDecorationTheme.focusedBorder,
                          prefixIcon: Icon(LucideIcons.gamepad, size: 24),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 20),
                      alignment: Alignment.center,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                          boxShadow: [
                            BoxShadow(
                              color: theme.colorScheme.primary.withAlpha(28),
                              blurRadius: 4,
                              offset: Offset(0, 3),
                            ),
                          ],
                        ),
                        child: ElevatedButton(
                            onPressed: () {},
                            child: MyText.bodyMedium("SAVE",
                                fontWeight: 700,
                                letterSpacing: 0.2,
                                color: theme.colorScheme.onPrimary)),
                      ),
                    )
                  ],
                ),
              ),
            ));
      },
    );
  }
}
