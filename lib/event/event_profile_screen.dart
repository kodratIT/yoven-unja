import 'package:yoven/helpers/theme/app_theme.dart';
import 'package:yoven/helpers/utils/generator.dart';
import 'package:yoven/helpers/widgets/my_container.dart';
import 'package:yoven/helpers/widgets/my_spacing.dart';
import 'package:yoven/helpers/widgets/my_text.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';

class EventProfileScreen extends StatefulWidget {
  @override
  _EventProfileScreenState createState() => _EventProfileScreenState();
}

class _EventProfileScreenState extends State<EventProfileScreen> {
  late CustomTheme customTheme;
  late ThemeData theme;

  @override
  void initState() {
    super.initState();
    customTheme = AppTheme.customTheme;
    theme = AppTheme.theme;
    desc = Generator.getDummyText(8);
  }

  String? desc;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      padding: MySpacing.top(MySpacing.safeAreaTop(context) + 20),
      children: [
        Column(
          children: [
            Container(
              padding: MySpacing.fromLTRB(24, 8, 24, 0),
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(50)),
                child: Image(
                  image: AssetImage('./assets/images/profile/avatar_4.jpg'),
                  width: 100,
                  height: 100,
                ),
              ),
            ),
            Container(
              margin: MySpacing.top(8),
              child: MyText.titleLarge("Martyn Rankin", fontWeight: 600),
            ),
          ],
        ),
        MyContainer.bordered(
          margin: MySpacing.fromLTRB(24, 24, 24, 0),
          padding: MySpacing.all(24),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  MyText.bodySmall("My balance".toUpperCase(),
                      fontSize: 12, fontWeight: 600, xMuted: true),
                  MyText.bodyMedium("\$ 24", fontWeight: 600),
                ],
              ),
              MyContainer(
                padding: MySpacing.fromLTRB(16, 8, 16, 8),
                color: theme.colorScheme.primary.withAlpha(28),
                borderRadiusAll: 4,
                child: Row(
                  children: [
                    Icon(
                      LucideIcons.plus,
                      color: theme.colorScheme.primary,
                      size: 20,
                    ),
                    Container(
                        margin: MySpacing.left(8),
                        child: MyText.bodyMedium("Add Money",
                            color: theme.colorScheme.primary, fontWeight: 600))
                  ],
                ),
              )
            ],
          ),
        ),
        Container(
          margin: MySpacing.fromLTRB(24, 16, 24, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MyText.bodySmall("INVITE",
                  fontSize: 11.5, fontWeight: 600, xMuted: true),
              Container(
                margin: MySpacing.top(16),
                child: Row(
                  children: [
                    Container(
                      padding: MySpacing.all(8),
                      decoration: BoxDecoration(
                          color: theme.colorScheme.primary,
                          borderRadius: BorderRadius.all(Radius.circular(8))),
                      child: Icon(
                        LucideIcons.plus,
                        size: 22,
                        color: theme.colorScheme.onPrimary,
                      ),
                    ),
                    Container(
                      margin: MySpacing.left(16),
                      child: MyText.bodyMedium("Add Friend",
                          color: theme.colorScheme.primary, fontWeight: 600),
                    )
                  ],
                ),
              ),
              Container(
                margin: MySpacing.top(16),
                child: singleInvite(
                    image: './assets/images/profile/avatar_2.jpg',
                    name: "Walter Gale",
                    status: "Joined"),
              ),
              Container(
                margin: MySpacing.top(16),
                child: singleInvite(
                    image: './assets/images/profile/avatar_3.jpg',
                    name: "Tala Deacon",
                    status: "Joined"),
              ),
              Container(
                margin: MySpacing.top(16),
                child: singleInvite(
                    image: './assets/images/profile/avatar_4.jpg',
                    name: "Isha Cameron",
                    status: "Invite"),
              )
            ],
          ),
        )
      ],
    ));
  }

  Widget singleInvite(
      {required String image, required String name, required String status}) {
    return Row(
      children: [
        ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(8)),
            child: Image(
              image: AssetImage(image),
              width: 40,
              height: 40,
            )),
        Expanded(
          child: Container(
            margin: MySpacing.left(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MyText.bodyMedium(name,
                    color: theme.colorScheme.onBackground, fontWeight: 600),
                MyText.bodySmall(
                  status,
                  fontWeight: 500,
                  muted: true,
                  color: theme.colorScheme.onBackground,
                ),
              ],
            ),
          ),
        ),
        Container(
          padding: MySpacing.fromLTRB(16, 8, 16, 8),
          decoration: BoxDecoration(
            color: theme.colorScheme.primary.withAlpha(40),
            borderRadius: BorderRadius.all(Radius.circular(4)),
          ),
          child: MyText.bodySmall("+ \$9",
              color: theme.colorScheme.primary,
              letterSpacing: 0.3,
              fontWeight: 700),
        )
      ],
    );
  }
}
