import 'package:yoven/event/event_ticket_dialog.dart';
import 'package:yoven/helpers/theme/app_theme.dart';
import 'package:yoven/helpers/utils/generator.dart';
import 'package:yoven/helpers/widgets/my_spacing.dart';
import 'package:yoven/helpers/widgets/my_text.dart';
import 'package:yoven/helpers/widgets/my_text_style.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';

class EventTicketScreen extends StatefulWidget {

  final int eventId; 
  final String title; 
  final String date; 
  final String subject; 
  final String time; 
  final String image; 
  final String about; 
  final String locationDetail;
  EventTicketScreen({
    required this.eventId,
    required this.title,
    required this.subject,
    required this.date,
    required this.time,
    required this.image,
    required this.about,
    required this.locationDetail,
    });

  @override
  _EventTicketScreenState createState() => _EventTicketScreenState();
}

class _EventTicketScreenState extends State<EventTicketScreen> {
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
        body: Column(
      children: [
        Stack(
          children: [
            Image(
              image: NetworkImage('${widget.image}'),
              fit: BoxFit.cover,
              width: MediaQuery.of(context).size.width,
              height: 240,
            ),
            Positioned(
              child: Container(
                margin: MySpacing.fromLTRB(24, 48, 24, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        padding: MySpacing.all(8),
                        decoration: BoxDecoration(
                          color: customTheme.card,
                          border:
                              Border.all(color: customTheme.border, width: 1),
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                        ),
                        child: Icon(LucideIcons.chevronLeft,
                            color:
                                theme.colorScheme.onBackground.withAlpha(220),
                            size: 20),
                      ),
                    ),
                    Container(
                      padding: MySpacing.all(8),
                      decoration: BoxDecoration(
                        color: customTheme.card,
                        border: Border.all(color: customTheme.border, width: 1),
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                      ),
                      child: Icon(LucideIcons.share,
                          color: theme.colorScheme.onBackground.withAlpha(220),
                          size: 20),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
        Expanded(
          child: ListView(
            padding: MySpacing.vertical(16),
            children: [
              Container(
                margin: MySpacing.fromLTRB(24, 0, 24, 0),
                child: Row(
                  children: [
                    Expanded(
                      child: MyText.headlineSmall(
                          '${widget.title}',
                          fontSize: 22,
                          color: theme.colorScheme.onBackground,
                          fontWeight: 600),
                    ),
                    Container(
                      margin: MySpacing.left(16),
                      padding: MySpacing.all(8),
                      decoration: BoxDecoration(
                          color: theme.colorScheme.primary
                              .withAlpha(24)
                              .withAlpha(20),
                          borderRadius: BorderRadius.all(Radius.circular(8))),
                      child: Icon(LucideIcons.heart,
                          size: 18, color: theme.colorScheme.primary),
                    )
                  ],
                ),
              ),
              Container(
                margin: MySpacing.fromLTRB(24, 16, 24, 0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Container(
                          padding: MySpacing.all(8),
                          decoration: BoxDecoration(
                              color: theme.colorScheme.primary.withAlpha(24),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8))),
                          child: Icon(
                            LucideIcons.calendar,
                            size: 18,
                            color: theme.colorScheme.primary,
                          ),
                        ),
                        Expanded(
                          child: Container(
                            margin: MySpacing.left(16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                MyText.bodySmall("${widget.date}",
                                    fontWeight: 600,
                                    color: theme.colorScheme.onBackground),
                                Container(
                                  margin: MySpacing.top(2),
                                  child: MyText.bodySmall("${widget.time}",
                                      fontSize: 12,
                                      fontWeight: 500,
                                      color: theme.colorScheme.onBackground,
                                      xMuted: true),
                                ),
                              ],
                            ),
                          ),
                        ),
                        // Container(
                        //   padding: MySpacing.fromLTRB(16, 4, 4, 4),
                        //   decoration: BoxDecoration(
                        //       color: theme.colorScheme.primary.withAlpha(28),
                        //       borderRadius:
                        //           BorderRadius.all(Radius.circular(32))),
                        //   child: Row(
                        //     children: [
                        //       MyText.bodySmall("Add to Reminder",
                        //           letterSpacing: 0,
                        //           fontSize: 12,
                        //           color: theme.colorScheme.primary,
                        //           fontWeight: 400),
                        //       Container(
                        //         padding: MySpacing.all(8),
                        //         margin: MySpacing.left(8),
                        //         decoration: BoxDecoration(
                        //             color: theme.colorScheme.primary,
                        //             shape: BoxShape.circle),
                        //         child: Icon(
                        //           LucideIcons.plus,
                        //           color: theme.colorScheme.onPrimary,
                        //           size: 18,
                        //         ),
                        //       )
                        //     ],
                        //   ),
                        // )
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                margin: MySpacing.fromLTRB(24, 16, 24, 0),
                child: Row(
                  children: [
                    Generator.buildOverlaysProfile(
                        images: [
                          './assets/images/profile/avatar_2.jpg',
                          './assets/images/profile/avatar_1.jpg',
                          './assets/images/profile/avatar_3.jpg',
                          './assets/images/profile/avatar_4.jpg',
                        ],
                        size: 36,
                        leftFraction: 0.7,
                        overlayBorderThickness: 2.5,
                        enabledOverlayBorder: true,
                        overlayBorderColor: customTheme.card),
                    MyText.bodySmall("+42 Participant",
                        color: theme.colorScheme.primary, fontWeight: 500)
                  ],
                ),
              ),
              Container(
                margin: MySpacing.fromLTRB(24, 24, 24, 0),
                child: MyText.titleMedium("About This Event",
                    fontWeight: 700, color: theme.colorScheme.onBackground),
              ),
              Container(
                margin: MySpacing.fromLTRB(24, 12, 24, 0),
                child: RichText(
                  text: TextSpan(children: <TextSpan>[
                    TextSpan(
                        text: "${widget.about}",
                        style: MyTextStyle.titleSmall(
                            color: theme.colorScheme.onBackground,
                            muted: true,
                            letterSpacing: 0.3,
                            fontWeight: 500)),
                  ]),
                ),
              ),
              Container(
                margin: MySpacing.fromLTRB(24, 24, 24, 0),
                child: MyText.titleMedium("Location",
                    fontWeight: 700, color: theme.colorScheme.onBackground),
              ),
              Container(
                margin: MySpacing.fromLTRB(24, 16, 24, 0),
                child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                  child: Image(
                    image: AssetImage('./assets/other/map-md-snap.png'),
                    height: 200,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Container(
                margin: MySpacing.fromLTRB(24, 16, 24, 0),
                child: ElevatedButton(
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) => EventTicketDialog(
                          title: '${widget.title}',
                          time: '${widget.time}',
                          date: '${widget.date}',
                          image: '${widget.image}',
                          location: '${widget.subject}',
                          locationDetail: '${widget.locationDetail}',

                        ));
                  },
                  style: ButtonStyle(
                      elevation: MaterialStatePropertyAll(0),
                      padding: MaterialStateProperty.all(MySpacing.xy(16, 0))),
                  child: MyText.bodyMedium("Show my Ticket",
                      fontWeight: 600, color: theme.colorScheme.onPrimary),
                ),
              )
            ],
          ),
        )
      ],
    ));
  }
}
