// import 'package:yoven/event/event_filter_dialog.dart';
import 'package:yoven/event/event_single_event_screen.dart';
import 'package:yoven/helpers/theme/app_theme.dart';
import 'package:yoven/helpers/widgets/my_container.dart';
import 'package:yoven/helpers/widgets/my_spacing.dart';
import 'package:yoven/helpers/widgets/my_text.dart';
// import 'package:yoven/helpers/widgets/my_text_style.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:yoven/model/ModelHome.dart';

class EventHomeScreen extends StatefulWidget {
  @override
  _EventHomeScreenState createState() => _EventHomeScreenState();
}

class _EventHomeScreenState extends State<EventHomeScreen> {
  // List<Map<String, dynamic>> ?eventsList;
  late CustomTheme customTheme;
  late ThemeData theme;
  late Future<List<ModelHome>> eventsList;
 

  @override
  void initState() {
    super.initState();
    customTheme = AppTheme.customTheme;
    theme = AppTheme.theme;
    // eventsList = fetchData();
  }

  int? selectedCategory = 0;

  Future<List<ModelHome>> fetchData() async {
  CollectionReference events = FirebaseFirestore.instance.collection('events');

    try {
      QuerySnapshot querySnapshot = await events.get();
      List<ModelHome> eventsList = querySnapshot.docs
          .map((DocumentSnapshot document) =>
              ModelHome.fromJson(document.data() as Map<String, dynamic>))
          .toList();

      return eventsList;
    } catch (e) {
      print('Error getting data: $e');
      return [];
    }
  }




  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: MySpacing.top(MySpacing.safeAreaTop(context) + 20),
      children: [
        Container(
          margin: MySpacing.fromLTRB(24, 0, 24, 0),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MyText.bodyMedium("Today 24 Aug, 2020",
                        fontWeight: 400,
                        letterSpacing: 0,
                        color: theme.colorScheme.onBackground),
                    MyText.headlineSmall("Discover Events",
                        fontSize: 24,
                        fontWeight: 700,
                        letterSpacing: -0.3,
                        color: theme.colorScheme.onBackground),
                  ],
                ),
              ),
              Stack(
                children: [
                  MyContainer(
                    padding: MySpacing.all(10),
                    borderRadiusAll: 4,
                    child: Icon(
                      LucideIcons.bell,
                      size: 18,
                      color: theme.colorScheme.onBackground.withAlpha(160),
                    ),
                  ),
                  Positioned(
                    right: 4,
                    top: 4,
                    child: Container(
                      width: 6,
                      height: 6,
                      decoration: BoxDecoration(
                          color: customTheme.colorError,
                          shape: BoxShape.circle),
                    ),
                  )
                ],
              ),
              MyContainer.none(
                margin: MySpacing.left(16),
                borderRadiusAll: 4,
                clipBehavior: Clip.antiAliasWithSaveLayer,
                child: Image(
                  image: AssetImage('assets/images/profile/avatar_2.jpg'),
                  width: 36,
                  height: 36,
                ),
              )
            ],
          ),
        ),
        Container(
          margin: MySpacing.top(8),
          padding: MySpacing.vertical(8),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                Container(
                  margin: MySpacing.left(12),
                  child: singleCategory(
                      title: "All", iconData: LucideIcons.layoutList, index: 0),
                ),
                // singleCategory(
                //     title: "Birthday", iconData: LucideIcons.cake, index: 1),
                // singleCategory(
                //     title: "Party",
                //     iconData: LucideIcons.partyPopper,
                //     index: 2),
                // singleCategory(
                //     title: "Talks",
                //     iconData: LucideIcons.messageCircle,
                //     index: 3),
                // Container(
                //   margin: MySpacing.right(24),
                //   child: singleCategory(
                //       title: "Food", iconData: LucideIcons.apple, index: 4),
                // ),
              ],
            ),
          ),
        ),
        Container(
          margin: MySpacing.fromLTRB(24, 4, 24, 0),
          child: Row(
            children: [
              Expanded(
                child: MyText.titleMedium("Popular",
                    fontWeight: 700, color: theme.colorScheme.onBackground),
              ),
              MyText.bodySmall("View All",
                  fontWeight: 600, color: theme.colorScheme.primary),
            ],
          ),
        ),
        Container(
          margin: MySpacing.top(16),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: FutureBuilder<List<ModelHome>>(
              future: fetchData(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return CircularProgressIndicator();
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  print('Tidak ada acara yang tersedia. Data: ${snapshot.data}');
                  return Text('Tidak ada acara yang tersedia');
                } else {
                  List<ModelHome> eventsList = snapshot.data!;
                  // Mengiterasi melalui List<ModelHome> dan membuat widget singleEvent
                  return Row(
                    children: eventsList.take(4).map((event) {
                      return Container(
                        margin: MySpacing.fromLTRB(24, 16, 0, 0),
                        child: singleEvent(
                          title: event.name,
                          image: './assets/images/apps/event/pattern-1.png',
                          date: event.dateEvent,
                          // month: 's',
                          subject: event.locationDetail,
                          time: event.timeEvent,
                          width: MediaQuery.of(context).size.width * 0.6,
                          event_id: event.id,
                          about: event.description,
                          locationDetail: event.location,

                        ),
                      );
                    }).toList(),
                  );
                }
              },
            ),
          ),
        ),
         Container(
          margin: MySpacing.fromLTRB(24, 16, 24, 0),
          child: MyText.titleMedium("This Weekend",
              fontWeight: 700, color: theme.colorScheme.onBackground),
        ),
        Container(
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: FutureBuilder<List<ModelHome>>(
              future: fetchData(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return CircularProgressIndicator();
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  print('Tidak ada acara yang tersedia. Data: ${snapshot.data}');
                  return Text('Tidak ada acara yang tersedia');
                } else {
                  List<ModelHome> eventsList = snapshot.data!;
                  // Mengiterasi melalui List<ModelHome> dan membuat widget singleEvent
                  return Column(
                    children: eventsList.take(4).map((event) {
                      return Container(
                        margin: MySpacing.fromLTRB(24, 16, 24, 16),
                        child: singleEvent(
                          title: event.name,
                          image: './assets/images/apps/event/pattern-2.png',
                          date: event.dateEvent,
                          // month: 's',
                          subject: event.locationDetail,
                          time: event.timeEvent,
                          width: MediaQuery.of(context).size.width - 48,
                          event_id: event.id,
                          about: event.description,
                          locationDetail: event.location,

                        ),
                      );
                    }).toList(),
                  );
                }
              },
            ),
          ),
        ),

      ],
    );
  }

  Widget singleCategory(
      {IconData? iconData, required String title, int? index}) {
    bool isSelected = (selectedCategory == index);
    return InkWell(
        onTap: () {
          if (!isSelected) {
            setState(() {
              selectedCategory = index;
            });
          }
        },
        child: MyContainer(
          margin: MySpacing.fromLTRB(12, 8, 0, 8),
          color: isSelected ? theme.colorScheme.primary : customTheme.card,
          bordered: !isSelected,
          border: Border.all(color: customTheme.border),
          borderRadiusAll: 4,
          padding: MySpacing.fromLTRB(16, 8, 16, 8),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                iconData,
                size: 20,
                color: isSelected
                    ? theme.colorScheme.onPrimary
                    : theme.colorScheme.onBackground,
              ),
              Container(
                margin: MySpacing.left(8),
                child: MyText.bodyMedium(title,
                    color: isSelected
                        ? theme.colorScheme.onPrimary
                        : theme.colorScheme.onBackground),
              )
            ],
          ),
        ));
  }

  Widget singleEvent(
      {required String image,
      required String date,
      // required String month,
      required String title,
      required String subject,
      required String time,
      required double width,required event_id,required String about,required String locationDetail}) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
           builder: (context) => EventSingleEventScreen(
            eventId: event_id,
            title: title,
            date: date,
            subject: subject,
            time: time,
            image: image,
            about: about,
            locationDetail: locationDetail,
          ),
          ),
        );
      },
      child: Container(
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
            color: customTheme.card,
            border: Border.all(color: customTheme.border, width: 0.8),
            borderRadius: BorderRadius.all(Radius.circular(4))),
        width: width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(2),
                      topRight: Radius.circular(2)),
                  child: Image(
                    image: AssetImage(image),
                    fit: BoxFit.cover,
                    width: width,
                    height: width * 0.55,
                  ),
                ),
                Positioned(
                  bottom: -16,
                  left: 16,
                  child: MyContainer.bordered(
                    padding: MySpacing.fromLTRB(8, 4, 8, 4),
                    borderRadiusAll: 4,
                    child: Column(
                      children: [
                        MyText.bodyMedium(
                          date,
                          color: theme.colorScheme.primary,
                          fontWeight: 600,
                          textAlign: TextAlign.center,
                        ),
                        // MyText.bodySmall(
                        //   month,
                        //   fontSize: 11,
                        //   color: theme.colorScheme.primary,
                        //   fontWeight: 600,
                        //   textAlign: TextAlign.center,
                        // ),
                      ],
                    ),
                  ),
                )
              ],
            ),
            Container(
              padding: MySpacing.fromLTRB(16, 24, 16, 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MyText.bodyMedium(title,
                      color: theme.colorScheme.onBackground, fontWeight: 600),
                  Container(
                    margin: MySpacing.top(8),
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              MyText.bodySmall(subject,
                                  fontSize: 12,
                                  color: theme.colorScheme.onBackground,
                                  fontWeight: 500,
                                  xMuted: true),
                              Container(
                                margin: MySpacing.top(2),
                                child: MyText.bodySmall(time,
                                    fontSize: 10,
                                    color: theme.colorScheme.onBackground,
                                    fontWeight: 500,
                                    xMuted: true),
                              ),
                            ],
                          ),
                        ),
                        Icon(
                          LucideIcons.heart,
                          color: theme.colorScheme.primary,
                        )
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
