import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:yoven/auth/firebase_auth_/showToast.dart';
import 'package:yoven/event/event_full_app.dart';
import 'package:yoven/event/event_ticket_dialog.dart';
import 'package:yoven/event/event_ticket_screen.dart';
import 'package:yoven/event/event_upcoming_screen.dart';
import 'package:yoven/helpers/theme/app_theme.dart';
import 'package:yoven/helpers/utils/generator.dart';
import 'package:yoven/helpers/widgets/my_spacing.dart';
import 'package:yoven/helpers/widgets/my_text.dart';
import 'package:yoven/helpers/widgets/my_text_style.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:yoven/model/ModelEventAccept.dart';

class EventSingleEventScreen extends StatefulWidget {

  final int eventId; 
  final String title; 
  final String date; 
  final String subject; 
  final String time; 
  final String image; 
  final String about; 
  final String locationDetail;
  EventSingleEventScreen({
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
  _EventSingleEventScreenState createState() => _EventSingleEventScreenState();
}

class _EventSingleEventScreenState extends State<EventSingleEventScreen> {
  late CustomTheme customTheme;
  late ThemeData theme;
  bool statusRegis = false;
  String uid = '';
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  void initState() {
    super.initState();
    customTheme = AppTheme.customTheme;
    theme = AppTheme.theme;

    uid = getCurrentUserId();
    checkRegistrationStatus();


  }

  String getCurrentUserId() {
  User? user = FirebaseAuth.instance.currentUser;

  // Check if there is a currently signed-in user
  if (user != null) {
    String userId = user.uid;
    return userId;
  } else {
    // No user is signed in
      return '';
    }
  }

  Future<void> checkRegistrationStatus() async {
    try {
      String? uid = getCurrentUserId();
      bool isUserRegistered = await checkEventAccepted(widget.eventId, uid);
      setState(() {
        statusRegis = isUserRegistered;
      });
    } catch (e) {
      print('Error checking registration status: $e');
    }
  }

  Future<void> handleEventRegistration(ModelEventAccept event) async {
  try {
    // Check if the user is already registered for the event
    bool isUserRegistered = await checkEventAccepted(event.eventId, event.userId);

    if (isUserRegistered) {
      // User is already registered, you can handle this case accordingly
      showToast(message: 'Anda sudah terdaftar pada acara ini.');
    } else {
      // User is not registered, proceed with registration
      await _firestore.collection('event_aceppted').add({
        'event_id': event.eventId,
        'ticket': event.ticket,
        'timespent': event.timeSpent,
        'user_id': event.userId,
      });

      showToast(message: 'Pendaftaran Berhasil.');
    }
  } catch (e) {
    print('Error handling event registration: $e');
  }
}


  Future<bool> checkEventAccepted(int eventId, String? userId) async {
  try {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('event_aceppted')
        .where('event_id', isEqualTo: eventId)
        .where('user_id', isEqualTo: userId)
        .get();

    if (querySnapshot.docs.isNotEmpty) {
      return true;
    } 
    return false;
  } catch (e) {
    print('Error checking event_aceppted: $e');
    return false;
  }
}



  void _btnCreate() async {
    ModelEventAccept eventAccept = ModelEventAccept(
      eventId: widget.eventId,
      ticket: 'asadeada',
      timeSpent: DateTime.now(),
      userId: uid, // Anda dapat mengganti nilai ini dengan nilai yang sesuai dari Firebase Authentication
    );

    await handleEventRegistration(eventAccept);

  }
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Stack(
          children: [
            Image(
              image: AssetImage('${widget.image}'),
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
                                MyText.bodySmall("Thursday, ${widget.date}",
                                    fontWeight: 600,
                                    color: theme.colorScheme.onBackground),
                                Container(
                                  margin: MySpacing.top(2),
                                  child: MyText.bodySmall("${widget.time} AM",
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
                                  MyText.bodySmall("${widget.locationDetail}",
                                      fontWeight: 600,
                                      color: theme.colorScheme.onBackground),
                                  Container(
                                    margin: MySpacing.top(2),
                                    child: MyText.bodySmall(
                                        "${widget.subject}",
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
                        text: '${widget.about}',
                        style: MyTextStyle.titleSmall(
                            color: theme.colorScheme.onBackground,
                            muted: true,
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
                child: statusRegis
            ? ElevatedButton(
                onPressed: () {
                  // Code to execute if the user is registered
                  // For example, show a message or navigate to a different screen
                  // print('Telah Mendaftar');
                },
                style: ButtonStyle(
                  elevation: MaterialStateProperty.all(0),
                  padding: MaterialStateProperty.all(MySpacing.xy(16, 0)),
                ),
                child: MyText.bodyMedium(
                  "Telah Mendaftar",
                  fontWeight: 600,
                  color: theme.colorScheme.onSecondary,
                ),
              )
            : ElevatedButton(
                onPressed: () {
                  // Code to execute if the user is not registered
                  // For example, show a registration button
                  _btnCreate(); 
                   Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => EventFullApp(),
                    ),
                  );
                },
                style: ButtonStyle(
                  elevation: MaterialStateProperty.all(0),
                  padding: MaterialStateProperty.all(MySpacing.xy(16, 0)),
                ),
                child: MyText.bodyMedium(
                  "Daftar",
                  fontWeight: 600,
                  color: theme.colorScheme.onPrimary,
                ),
              ),
              )
            ],
          ),
        )
      ],
    ));
  }
}
