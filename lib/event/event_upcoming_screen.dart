import 'package:yoven/event/event_ticket_dialog.dart';
import 'package:yoven/event/event_ticket_screen.dart';
import 'package:yoven/helpers/theme/app_theme.dart';
import 'package:yoven/helpers/widgets/my_spacing.dart';
import 'package:yoven/helpers/widgets/my_text.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';

class EventUpcomingScreen extends StatefulWidget {
  @override
  _EventUpcomingScreenState createState() => _EventUpcomingScreenState();
}

class _EventUpcomingScreenState extends State<EventUpcomingScreen> {
  late CustomTheme customTheme;
  late ThemeData theme;

  @override
  void initState() {
    super.initState();
    customTheme = AppTheme.customTheme;
    theme = AppTheme.theme;
  }

  int selectedCategory = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          automaticallyImplyLeading: false,
          title: MyText.titleMedium("Upcoming",
              color: theme.colorScheme.onBackground, fontWeight: 600),
        ),
        body: ListView(
          padding: MySpacing.zero,
          children: [
            singleEvent(
                image: './assets/images/apps/event/pattern-1.png',
                time: "08:15 PM",
                date: "Fri, Apr 12, 2020",
                name: "Flutter Meet 1"),
            Container(
                margin: MySpacing.fromLTRB(24, 0, 24, 0),
                child: Divider(
                  height: 0,
                )),
            singleEvent(
                image: './assets/images/apps/event/pattern-1.png',
                time: "08:15 PM",
                date: "Fri, Apr 12, 2020",
                name: "Flutter Meet 2"),
            Container(
                margin: MySpacing.fromLTRB(24, 0, 24, 0),
                child: Divider(
                  height: 0,
                )),
            singleEvent(
                image: './assets/images/apps/event/pattern-1.png',
                time: "08:15 PM",
                date: "Fri, Apr 12, 2020",
                name: "Flutter Meet 3"),
            Container(
                margin: MySpacing.fromLTRB(24, 0, 24, 0),
                child: Divider(
                  height: 0,
                )),
            singleEvent(
                image: './assets/images/apps/event/pattern-1.png',
                time: "08:15 PM",
                date: "Fri, Apr 12, 2020",
                name: "Flutter Meet 4"),
            Container(
                margin: MySpacing.fromLTRB(24, 0, 24, 0),
                child: Divider(
                  height: 0,
                )),
          ],
        ));
  }

  Widget singleEvent(
      {required String image,
      required String name,
      required String date,
      required String time}) {
    return Container(
      margin: MySpacing.all(24),
      child: InkWell(
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => EventTicketScreen()));
        },
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(8)),
              child: Image(
                image: AssetImage(image),
                width: 100,
                height: 72,
                fit: BoxFit.cover,
              ),
            ),
            Expanded(
              child: Container(
                margin: MySpacing.left(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        MyText.titleSmall(name,
                            color: theme.colorScheme.onBackground,
                            fontWeight: 600),
                        InkWell(
                          onTap: () {
                            showDialog(
                                context: context,
                                builder: (BuildContext context) =>
                                    EventTicketDialog());
                          },
                          child: Container(
                            padding: MySpacing.all(6),
                            child: Icon(
                              LucideIcons.qrCode,
                              color:
                                  theme.colorScheme.onBackground.withAlpha(200),
                              size: 20,
                            ),
                          ),
                        )
                      ],
                    ),
                    Container(
                      margin: MySpacing.top(8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              MyText.bodySmall("Date",
                                  fontWeight: 600,
                                  letterSpacing: 0,
                                  fontSize: 12,
                                  color: theme.colorScheme.onBackground,
                                  xMuted: true),
                              Container(
                                margin: MySpacing.top(2),
                                child: MyText.bodyMedium(date,
                                    color: theme.colorScheme.onBackground),
                              )
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              MyText.bodySmall("Time",
                                  fontWeight: 600,
                                  letterSpacing: 0,
                                  color: theme.colorScheme.onBackground,
                                  fontSize: 12,
                                  xMuted: true),
                              Container(
                                margin: MySpacing.top(2),
                                child: MyText.bodyMedium(time,
                                    color: theme.colorScheme.onBackground),
                              )
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
