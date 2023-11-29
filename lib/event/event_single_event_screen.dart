import 'package:yoven/helpers/theme/app_theme.dart';
import 'package:yoven/helpers/utils/generator.dart';
import 'package:yoven/helpers/widgets/my_spacing.dart';
import 'package:yoven/helpers/widgets/my_text.dart';
import 'package:yoven/helpers/widgets/my_text_style.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';

class EventSingleEventScreen extends StatefulWidget {
  @override
  _EventSingleEventScreenState createState() => _EventSingleEventScreenState();
}

class _EventSingleEventScreenState extends State<EventSingleEventScreen> {
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
        body: Column(
      children: [
        Stack(
          children: [
            Image(
              image: AssetImage('./assets/images/apps/event/pattern-1.png'),
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
                          'Fair Jobs Unja',
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
                                MyText.bodySmall("Thursday, Des 04, 2023",
                                    fontWeight: 600,
                                    color: theme.colorScheme.onBackground),
                                Container(
                                  margin: MySpacing.top(2),
                                  child: MyText.bodySmall("8:30 AM - 11:30 AM",
                                      fontWeight: 500,
                                      color: theme.colorScheme.onBackground,
                                      xMuted: true),
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                    Container(
                      margin: MySpacing.top(16),
                      child: Row(
                        children: [
                          Container(
                            padding: MySpacing.all(8),
                            decoration: BoxDecoration(
                                color: theme.colorScheme.primary.withAlpha(24),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8))),
                            child: Icon(
                              LucideIcons.mapPin,
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
                                  MyText.bodySmall("Auditorium",
                                      fontWeight: 600,
                                      color: theme.colorScheme.onBackground),
                                  Container(
                                    margin: MySpacing.top(2),
                                    child: MyText.bodySmall(
                                        "Universitas Jambi",
                                        fontWeight: 500,
                                        color: theme.colorScheme.onBackground,
                                        xMuted: true),
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      margin: MySpacing.top(16),
                      child: Row(
                        children: [
                          Container(
                            padding: MySpacing.all(8),
                            decoration: BoxDecoration(
                                color: theme.colorScheme.primary.withAlpha(24),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8))),
                            child: Icon(
                              LucideIcons.tag,
                              size: 18,
                              color: theme.colorScheme.primary,
                            ),
                          ),
                          Expanded(
                            child: Container(
                              margin: MySpacing.left(16),
                              child: MyText.bodyMedium("Free",
                                  fontWeight: 600,
                                  letterSpacing: 0.3,
                                  color: theme.colorScheme.onBackground),
                            ),
                          )
                        ],
                      ),
                    ),
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
                        text: Generator.getDummyText(20),
                        style: MyTextStyle.titleSmall(
                            color: theme.colorScheme.onBackground,
                            muted: true,
                            fontWeight: 500)),
                    TextSpan(
                        text: " Read More",
                        style: MyTextStyle.bodySmall(
                            color: theme.colorScheme.primary, fontWeight: 600))
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
                  onPressed: () {},
                  style: ButtonStyle(
                      elevation: MaterialStatePropertyAll(0),
                      padding: MaterialStateProperty.all(MySpacing.xy(16, 0))),
                  child: MyText.bodyMedium("Daftar",
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
