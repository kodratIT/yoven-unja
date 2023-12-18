import 'package:firebase_auth/firebase_auth.dart';
import 'package:yoven/event/event_ticket_dialog.dart';
import 'package:yoven/event/event_ticket_screen.dart';
import 'package:yoven/helpers/theme/app_theme.dart';
import 'package:yoven/helpers/widgets/my_spacing.dart';
import 'package:yoven/helpers/widgets/my_text.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class EventUpcomingScreen extends StatefulWidget {
  @override
  _EventUpcomingScreenState createState() => _EventUpcomingScreenState();
}

class _EventUpcomingScreenState extends State<EventUpcomingScreen> {
  late CustomTheme customTheme;
  late ThemeData theme;
  // final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  late String UID;
  late String DataEvent ;
  QuerySnapshot? globalEventSnapshot;
  // late QuerySnapshot<Map<String, dynamic>> fetchData;

  final CollectionReference eventsCollection =
      FirebaseFirestore.instance.collection('events');
  final CollectionReference acceptedCollection =
      FirebaseFirestore.instance.collection('event_accepted');
  
  

  List<Map<String, dynamic>> fetchData =[];

  late  List<Map<String, dynamic>> result ;

  @override
  void initState() {
    super.initState();
    customTheme = AppTheme.customTheme;
    theme = AppTheme.theme;
    fetchData = [];
    getData();

  }

  void getData () async{
    UID = getCurrentUserId();
    await  _initializeData();
  }

  int selectedCategory = 0;

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

Future<List<Map<String, dynamic>>> _initializeData() async {
  globalEventSnapshot = await _getEventComming(UID);

  List<Map<String, dynamic>> eventDataList = [];

  for (var doc in globalEventSnapshot!.docs) {
    int eventId = doc['event_id']; // Use the [] operator to access field values
    // Query 'events' collection based on 'event_id'
    try {
      QuerySnapshot<Map<String, dynamic>> querySnapshot = await FirebaseFirestore.instance
          .collection('events')
          .where('id', isEqualTo: eventId)
          .get();

      querySnapshot.docs.forEach((eventDoc) {
        Map<String, dynamic> eventData = {
          'id': eventDoc['id'],
          'name': eventDoc['name'],
          'date': eventDoc['date_event'],
          'time': eventDoc['time_event'],
          'subject': eventDoc['location_detail'],
          'about': eventDoc['description'],
          'location': eventDoc['location'],
          'capacity': eventDoc['capacity'],
          'image': eventDoc['images'],
        };

        // Add the Map to the list
        eventDataList.add(eventData);

        
      });

      // return querySnapshot; // Return the querySnapshot when data is found
    } catch (e) {
      // Handle errors, e.g., Firebase errors
      print('Error querying events collection: $e');
      // You can also throw the exception if you want to propagate it
    }
  }
  
  setState(() {
      fetchData = eventDataList;
    });
  return eventDataList;
  // return null; // Return null when no data is found
}

  
 Future<QuerySnapshot?> _getEventComming(String userId) async {
  try {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('event_aceppted')
        .where('user_id', isEqualTo: userId)
        .get();
    return querySnapshot;
    } catch (e) {
      // Handle errors more gracefully, for example, log the error
      print('Error checking event_aceppted: $e');
      
      // You might want to throw the exception or return null, depending on your needs
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      elevation: 0,
      centerTitle: true,
      automaticallyImplyLeading: false,
      title: MyText.titleMedium(
        "Upcoming",
        color: theme.colorScheme.onBackground,
        fontWeight: 600,
      ),
    ),
    body: fetchData.isEmpty
        ? Center(child: Text('Mengambil Data'))
        : ListView.builder(
            padding: MySpacing.zero,
            itemCount: fetchData.length,
            itemBuilder: (context, index) {
              Map<String, dynamic> eventData = fetchData[index];

              String date = eventData['date'] ?? "N/A";
              String imagePath = eventData['image'] ?? "assets/images/profile/avatar_2.jpg'";
              String time = eventData['time'] ?? "N/A";
              String name = eventData['name'] ?? "N/A";
              String subject = eventData['subject'] ?? "N/A";
              String about = eventData['about'] ?? "N/A";
              String location = eventData['location'] ?? "N/A";
              int id = eventData['id'] ?? 0;
              return Column(
                children: [
                  singleEvent(
                    image: 'assets/images/profile/avatar_2.jpg',
                    time: time,
                    date: date,
                    name: name,
                    subject: subject,
                    about: about,
                    locationDetail: location,
                    event_id: id,
                  ),
                  Container(
                    margin: MySpacing.fromLTRB(24, 0, 24, 0),
                    child: Divider(
                      height: 0,
                    ),
                  ),
                ],
              );
            },
          ),
  );
}

  Widget singleEvent(
      {required String image,
      required String name,
      required String date,
      required String time,
      required String subject,
      required String about,
      required String locationDetail,
      required  event_id,
      }) {
    return Container(
      margin: MySpacing.all(24),
      child: InkWell(
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) =>  EventTicketScreen(
                eventId: event_id,
                title: name,
                date: date,
                subject: subject,
                time: time,
                image: image,
                about: about,
                locationDetail: locationDetail,
              ),
            ));
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
                            // showDialog(
                            //     context: context,
                            //     builder: (BuildContext context) =>
                            //         // EventTicketDialog());
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
