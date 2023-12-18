import 'package:yoven/helpers/theme/app_theme.dart';
import 'package:yoven/helpers/widgets/my_dashed_divider.dart';
import 'package:yoven/helpers/widgets/my_spacing.dart';
import 'package:yoven/helpers/widgets/my_text.dart';
import 'package:flutter/material.dart';

class EventTicketDialog extends StatefulWidget {

  final String title; 
  final String date; 
  final String time; 
  final String image; 
  final String location;
  final String locationDetail;
  EventTicketDialog({
    required this.title,
    required this.date,
    required this.time,
    required this.image,
    required this.location,
    required this.locationDetail,
    });
  @override
  _EventTicketDialogState createState() => _EventTicketDialogState();
}

class _EventTicketDialogState extends State<EventTicketDialog> {
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
    return Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(8), topRight: Radius.circular(8)),
              child: Image(
                image: AssetImage('./assets/images/apps/event/pattern-1.png'),
                width: MediaQuery.of(context).size.width,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              margin: MySpacing.fromLTRB(16, 16, 16, 0),
              child: MyText.bodyLarge("${widget.title}",
                  color: theme.colorScheme.onBackground, fontWeight: 600),
            ),
            Container(
              margin: MySpacing.fromLTRB(16, 16, 16, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        MyText.bodySmall("Date",
                            color: theme.colorScheme.onBackground,
                            xMuted: true),
                        MyText.bodyMedium("${widget.date}",
                            color: theme.colorScheme.onBackground)
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        MyText.bodySmall("Time",
                            color: theme.colorScheme.onBackground,
                            xMuted: true),
                        MyText.bodyMedium("${widget.time}",
                            color: theme.colorScheme.onBackground),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: MySpacing.fromLTRB(16, 16, 16, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MyText.bodySmall("Place",
                      xMuted: true, color: theme.colorScheme.onBackground),
                  MyText.bodyLarge("${widget.location}\n${widget.locationDetail}",
                      color: theme.colorScheme.onBackground, fontWeight: 500)
                ],
              ),
            ),
            Container(
              margin: MySpacing.top(24),
              child: MyDashedDivider(
                height: 1,
                color: theme.colorScheme.onBackground.withAlpha(60),
                dashWidth: 7,
              ),
            ),
            Container(
              margin: MySpacing.vertical(32),
              child: Center(
                  child: Image(
                image: AssetImage('./assets/other/barcode.png'),
                width: MediaQuery.of(context).size.width * 0.5,
                fit: BoxFit.fill,
              )),
            )
          ],
        ));
  }
}
