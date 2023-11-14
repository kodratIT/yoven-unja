import 'package:yoven/helpers/theme/app_theme.dart';
import 'package:yoven/helpers/widgets/my_spacing.dart';
import 'package:yoven/helpers/widgets/my_text.dart';
import 'package:yoven/helpers/widgets/my_text_style.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';

class EventCreateScreen extends StatefulWidget {
  @override
  _EventCreateScreenState createState() => _EventCreateScreenState();
}

class _EventCreateScreenState extends State<EventCreateScreen> {
  late CustomTheme customTheme;
  late ThemeData theme;

  @override
  void initState() {
    super.initState();
    customTheme = AppTheme.customTheme;
    theme = AppTheme.theme;
  }

  final List<String> _simpleChoice = ["Change place", "Add another", "Remove"];
  bool _switch = true;

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
                            MyText.bodyMedium("Becky Parra",
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
                locationWidget(),
                eventTypeWidget(),
                inviteWidget()
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
                        text: "\$99",
                        style: MyTextStyle.bodyLarge(
                            fontWeight: 700,
                            letterSpacing: 0,
                            color: theme.colorScheme.primary)),
                    TextSpan(
                        text: " /per person",
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
                      Container(
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

  Widget locationWidget() {
    return Container(
      margin: MySpacing.fromLTRB(24, 24, 24, 0),
      decoration: BoxDecoration(
          color: customTheme.card,
          border: Border.all(color: customTheme.border, width: 1),
          borderRadius: BorderRadius.all(Radius.circular(4))),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(2), bottomLeft: Radius.circular(2)),
            child: Image(
              image: AssetImage('./assets/images/apps/event/pattern-1.png'),
              height: 72,
              width: 80,
              fit: BoxFit.cover,
            ),
          ),
          Expanded(
            child: Container(
              margin: MySpacing.left(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MyText.titleSmall("Flutter Academy",
                      fontWeight: 600, color: theme.colorScheme.onBackground),
                  Container(
                    margin: MySpacing.top(2),
                    child: MyText.bodySmall("8:00 - 11:00 AM",
                        fontSize: 12,
                        fontWeight: 600,
                        color: theme.colorScheme.onBackground,
                        xMuted: true),
                  )
                ],
              ),
            ),
          ),
          PopupMenuButton(
            itemBuilder: (BuildContext context) {
              return _simpleChoice.map((String choice) {
                return PopupMenuItem(
                  height: 36,
                  value: choice,
                  child: MyText.bodyMedium(
                    choice,
                    color: theme.colorScheme.onBackground,
                  ),
                );
              }).toList();
            },
            color: customTheme.card,
            icon: Icon(
              LucideIcons.chevronDown,
              color: theme.colorScheme.onBackground,
            ),
          )
        ],
      ),
    );
  }

  Widget eventTypeWidget() {
    return Container(
      margin: MySpacing.fromLTRB(24, 24, 24, 0),
      padding: MySpacing.fromLTRB(16, 16, 8, 16),
      decoration: BoxDecoration(
          color: customTheme.card,
          border: Border.all(color: customTheme.border, width: 1),
          borderRadius: BorderRadius.all(Radius.circular(4))),
      child: Row(
        children: [
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MyText.bodyLarge("Public event",
                  color: theme.colorScheme.onBackground, fontWeight: 600),
              Container(
                margin: MySpacing.top(2),
                child: MyText.bodySmall("Add event to the public feed",
                    color: theme.colorScheme.onBackground,
                    fontWeight: 600,
                    xMuted: true),
              ),
            ],
          )),
          Switch(
            onChanged: (bool value) {
              setState(() {
                _switch = value;
              });
            },
            value: _switch,
            activeColor: theme.colorScheme.primary,
          )
        ],
      ),
    );
  }

  Widget inviteWidget() {
    return Container(
      margin: MySpacing.fromLTRB(24, 24, 24, 0),
      padding: MySpacing.all(16),
      decoration: BoxDecoration(
          color: customTheme.card,
          border: Border.all(color: customTheme.border, width: 1),
          borderRadius: BorderRadius.all(Radius.circular(4))),
      child: Column(
        children: [
          Row(
            children: [
              MyText.bodyMedium("Invite Friends",
                  color: theme.colorScheme.onBackground, fontWeight: 600)
            ],
          ),
          Container(
            margin: MySpacing.top(16),
            child: singleFriend(
                isSelected: true,
                name: "Trinity Knights",
                image: './assets/images/profile/avatar_5.jpg'),
          ),
          Container(
            margin: MySpacing.top(12),
            child: singleFriend(
                isSelected: false,
                name: "Cara Beck",
                image: './assets/images/profile/avatar_2.jpg'),
          ),
          Container(
            margin: MySpacing.top(12),
            child: singleFriend(
                isSelected: true,
                name: "Ayat Huber",
                image: './assets/images/profile/avatar_3.jpg'),
          ),
          Container(
            margin: MySpacing.top(12),
            child: Row(
              children: [
                Container(
                    width: 38,
                    height: 38,
                    decoration: BoxDecoration(
                        color: theme.colorScheme.primary.withAlpha(32),
                        borderRadius: BorderRadius.all(Radius.circular(8))),
                    child: Center(
                      child: MyText.bodyMedium("48",
                          color: theme.colorScheme.primary, fontWeight: 800),
                    )),
                Expanded(
                  child: Container(
                    margin: MySpacing.left(16),
                    child: MyText.bodyMedium("Invite more",
                        fontWeight: 600,
                        color: theme.colorScheme.onBackground.withAlpha(220)),
                  ),
                ),
                Icon(
                  LucideIcons.chevronRight,
                  size: 20,
                  color: theme.colorScheme.onBackground.withAlpha(200),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget singleFriend(
      {required String image, required String name, required bool isSelected}) {
    return Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(4)),
          child: Image(
            image: AssetImage(image),
            width: 38,
            height: 38,
          ),
        ),
        Expanded(
          child: Container(
            margin: MySpacing.left(16),
            child: MyText.bodyMedium(name,
                fontWeight: 600,
                color: isSelected
                    ? customTheme.colorSuccess.withAlpha(220)
                    : theme.colorScheme.onBackground.withAlpha(180)),
          ),
        ),
        Icon(
          LucideIcons.check,
          size: 20,
          color: isSelected
              ? customTheme.colorSuccess.withAlpha(240)
              : theme.colorScheme.onBackground.withAlpha(100),
        )
      ],
    );
  }
}
