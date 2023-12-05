import 'package:yoven/auth/firebase_auth_/showToast.dart';
import 'package:yoven/helpers/theme/app_theme.dart';
import 'package:yoven/helpers/widgets/my_spacing.dart';
import 'package:yoven/helpers/widgets/my_text.dart';
import 'package:yoven/helpers/widgets/my_text_style.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';

class EventCreateScreen extends StatefulWidget {
  @override
  _EventCreateScreenState createState() => _EventCreateScreenState();
}

class _EventCreateScreenState extends State<EventCreateScreen> {
  late CustomTheme customTheme;
  late ThemeData theme;
  DateTime? selectedDate;

  _pickDate(BuildContext context) async {
      final DateTime? picked = await showDatePicker(
          context: context,
          initialDate: selectedDate!,
          firstDate: DateTime(2015, 8),
          lastDate: DateTime(2101));
      if (picked != null && picked != selectedDate) {
        setState(() {
          selectedDate = picked;
          showSnackbarWithFloating(
              "${picked.day} - ${picked.month} - ${picked.year}");
        });
      }
    }

  @override
  void initState() {
    super.initState();
    customTheme = AppTheme.customTheme;
    theme = AppTheme.theme;
    selectedDate = DateTime.now();

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: MySpacing.top(MySpacing.safeAreaTop(context) + 20),
              children: [
                Container(
                  margin: MySpacing.fromLTRB(24, 0, 24, 0),
                  child: Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(4)),
                        child: Image(
                          image: AssetImage(
                              './assets/images/profile/avatar_4.jpg'),
                          width: 44,
                          height: 44,
                        ),
                      ),
                      Container(
                        margin: MySpacing.left(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            MyText.bodyMedium("Kodrat Pamungkas",
                                color: theme.colorScheme.onBackground,
                                fontWeight: 600),
                            MyText("Create new event",
                                color: customTheme.colorSuccess,
                                fontWeight: 500),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  margin: MySpacing.fromLTRB(24, 8, 24, 0),
                  child: TextFormField(
                    style: MyTextStyle.headlineSmall(
                        color: theme.colorScheme.onBackground,
                        letterSpacing: -0.4,
                        fontWeight: 800),
                    decoration: InputDecoration(
                      fillColor: theme.colorScheme.background,
                      hintStyle: MyTextStyle.headlineSmall(
                          color: theme.colorScheme.onBackground,
                          letterSpacing: -0.4,
                          fontWeight: 800),
                      filled: false,
                      hintText: "Event title",
                      border: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                    ),
                    autocorrect: false,
                    textCapitalization: TextCapitalization.sentences,
                  ),
                ),
                Container(
                  margin: MySpacing.fromLTRB(24, 0, 24, 0),
                  child: TextFormField(
                    style: MyTextStyle.bodyMedium(
                        color: theme.colorScheme.onBackground,
                        fontWeight: 500,
                        letterSpacing: 0,
                        muted: true),
                    decoration: InputDecoration(
                      hintText: "Event Description",
                      hintStyle: MyTextStyle.bodyMedium(
                          color: theme.colorScheme.onBackground,
                          fontWeight: 600,
                          letterSpacing: 0,
                          xMuted: true),
                      border: UnderlineInputBorder(
                        borderSide: BorderSide(
                            width: 1.5,
                            color:
                                theme.colorScheme.onBackground.withAlpha(50)),
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                            width: 1.4,
                            color:
                                theme.colorScheme.onBackground.withAlpha(50)),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                            width: 1.5,
                            color:
                                theme.colorScheme.onBackground.withAlpha(50)),
                      ),
                    ),
                    maxLines: 3,
                    minLines: 1,
                    autofocus: false,
                    textCapitalization: TextCapitalization.sentences,
                  ),
                ),
                Container(
                  margin: MySpacing.fromLTRB(24, 0, 24, 0),
                  child: TextFormField(
                    style: MyTextStyle.bodyMedium(
                        color: theme.colorScheme.onBackground,
                        fontWeight: 500,
                        letterSpacing: 0,
                        muted: true),
                    decoration: InputDecoration(
                      hintText: "Event Start",
                      hintStyle: MyTextStyle.bodyMedium(
                          color: theme.colorScheme.onBackground,
                          fontWeight: 600,
                          letterSpacing: 0,
                          xMuted: true),
                      border: UnderlineInputBorder(
                        borderSide: BorderSide(
                            width: 1.5,
                            color:
                                theme.colorScheme.onBackground.withAlpha(50)),
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                            width: 1.4,
                            color:
                                theme.colorScheme.onBackground.withAlpha(50)),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                            width: 1.5,
                            color:
                                theme.colorScheme.onBackground.withAlpha(50)),
                      ),
                    ),
                    maxLines: 3,
                    minLines: 1,
                    autofocus: false,
                    textCapitalization: TextCapitalization.sentences,
                  ),
                ),
                Container(
                  margin: MySpacing.fromLTRB(24, 0, 24, 0),
                  child: TextFormField(
                    style: MyTextStyle.bodyMedium(
                        color: theme.colorScheme.onBackground,
                        fontWeight: 500,
                        letterSpacing: 0,
                        muted: true),
                    decoration: InputDecoration(
                      hintText: "Event Time ",
                      hintStyle: MyTextStyle.bodyMedium(
                          color: theme.colorScheme.onBackground,
                          fontWeight: 600,
                          letterSpacing: 0,
                          xMuted: true),
                      border: UnderlineInputBorder(
                        borderSide: BorderSide(
                            width: 1.5,
                            color:
                                theme.colorScheme.onBackground.withAlpha(50)),
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                            width: 1.4,
                            color:
                                theme.colorScheme.onBackground.withAlpha(50)),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                            width: 1.5,
                            color:
                                theme.colorScheme.onBackground.withAlpha(50)),
                      ),
                    ),
                    maxLines: 3,
                    minLines: 1,
                    autofocus: false,
                    textCapitalization: TextCapitalization.sentences,
                  ),
                ),
                Container(
                  margin: MySpacing.fromLTRB(24, 0, 24, 0),
                  child: TextFormField(
                    style: MyTextStyle.bodyMedium(
                        color: theme.colorScheme.onBackground,
                        fontWeight: 500,
                        letterSpacing: 0,
                        muted: true),
                    decoration: InputDecoration(
                      hintText: "Location",
                      hintStyle: MyTextStyle.bodyMedium(
                          color: theme.colorScheme.onBackground,
                          fontWeight: 600,
                          letterSpacing: 0,
                          xMuted: true),
                      border: UnderlineInputBorder(
                        borderSide: BorderSide(
                            width: 1.5,
                            color:
                                theme.colorScheme.onBackground.withAlpha(50)),
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                            width: 1.4,
                            color:
                                theme.colorScheme.onBackground.withAlpha(50)),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                            width: 1.5,
                            color:
                                theme.colorScheme.onBackground.withAlpha(50)),
                      ),
                    ),
                    maxLines: 3,
                    minLines: 1,
                    autofocus: false,
                    textCapitalization: TextCapitalization.sentences,
                  ),
                ),
                Container(
                  margin: MySpacing.fromLTRB(24, 0, 24, 0),
                  child: TextFormField(
                    style: MyTextStyle.bodyMedium(
                        color: theme.colorScheme.onBackground,
                        fontWeight: 500,
                        letterSpacing: 0,
                        muted: true),
                    decoration: InputDecoration(
                      hintText: "Location Detail",
                      hintStyle: MyTextStyle.bodyMedium(
                          color: theme.colorScheme.onBackground,
                          fontWeight: 600,
                          letterSpacing: 0,
                          xMuted: true),
                      border: UnderlineInputBorder(
                        borderSide: BorderSide(
                            width: 1.5,
                            color:
                                theme.colorScheme.onBackground.withAlpha(50)),
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                            width: 1.4,
                            color:
                                theme.colorScheme.onBackground.withAlpha(50)),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                            width: 1.5,
                            color:
                                theme.colorScheme.onBackground.withAlpha(50)),
                      ),
                    ),
                    maxLines: 3,
                    minLines: 1,
                    autofocus: false,
                    textCapitalization: TextCapitalization.sentences,
                  ),
                ),
                Container(
                  margin: MySpacing.fromLTRB(24, 0, 24, 0),
                  child: TextFormField(
                    style: MyTextStyle.bodyMedium(
                        color: theme.colorScheme.onBackground,
                        fontWeight: 500,
                        letterSpacing: 0,
                        muted: true),
                    decoration: InputDecoration(
                      hintText: "Category",
                      hintStyle: MyTextStyle.bodyMedium(
                          color: theme.colorScheme.onBackground,
                          fontWeight: 600,
                          letterSpacing: 0,
                          xMuted: true),
                      border: UnderlineInputBorder(
                        borderSide: BorderSide(
                            width: 1.5,
                            color:
                                theme.colorScheme.onBackground.withAlpha(50)),
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                            width: 1.4,
                            color:
                                theme.colorScheme.onBackground.withAlpha(50)),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                            width: 1.5,
                            color:
                                theme.colorScheme.onBackground.withAlpha(50)),
                      ),
                    ),
                    maxLines: 3,
                    minLines: 1,
                    autofocus: false,
                    textCapitalization: TextCapitalization.sentences,
                  ),
                ),
              
              ],
            ),
          ),
          Container(
            color: customTheme.card,
            padding: MySpacing.fromLTRB(24, 16, 24, 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                RichText(
                  text: TextSpan(children: <TextSpan>[
                    TextSpan(
                        // text: "\$99",
                        style: MyTextStyle.bodyLarge(
                            fontWeight: 700,
                            letterSpacing: 0,
                            color: theme.colorScheme.primary)),
                    TextSpan(
                        // text: " /per person",
                        style: MyTextStyle.bodySmall(
                          fontWeight: 600,
                          letterSpacing: 0,
                          color: theme.colorScheme.onBackground,
                        )),
                  ]),
                ),
                Container(
                  padding: MySpacing.fromLTRB(8, 8, 8, 8),
                  decoration: BoxDecoration(
                      color: theme.colorScheme.primary,
                      borderRadius: BorderRadius.all(Radius.circular(40))),
                  child: Row(
                    children: [
                      Container(
                        margin: MySpacing.left(12),
                        child: MyText.bodySmall("Create".toUpperCase(),
                            fontSize: 12,
                            letterSpacing: 0.7,
                            color: theme.colorScheme.onPrimary,
                            fontWeight: 600),
                             
                      ),
                       GestureDetector(
                        onTap: () {
                          showToast(message: "Event Successfully Created");
                        },
                        child: Container(
                          margin: MySpacing.left(16),
                          padding: MySpacing.all(4),
                          decoration: BoxDecoration(
                              color: theme.colorScheme.onPrimary,
                              shape: BoxShape.circle),
                          child: Icon(
                            LucideIcons.chevronRight,
                            size: 20,
                            color: theme.colorScheme.primary,
                          ),
                        ),
                      )
                    ],
                  ),
                  
                )
              ],
            ),
          )
        ],
      ),
    );
  }

   void showSnackbarWithFloating(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: MyText.titleSmall(message, color: theme.colorScheme.onPrimary),
        backgroundColor: theme.colorScheme.primary,
        behavior: SnackBarBehavior.floating,
      ),
    );
  }
}
