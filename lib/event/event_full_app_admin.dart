/*
* File : Event
* Version : 1.0.0
* */

import 'package:firebase_auth/firebase_auth.dart';
import 'package:yoven/event/event_create_screen.dart';
import 'package:yoven/event/event_home_screen.dart';
import 'package:yoven/event/event_profile_screen.dart';
import 'package:yoven/event/event_upcoming_screen.dart';
import 'package:yoven/helpers/theme/app_notifier.dart';
import 'package:yoven/helpers/theme/app_theme.dart';
import 'package:yoven/helpers/utils/my_shadow.dart';
import 'package:yoven/helpers/widgets/my_card.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:provider/provider.dart';

class EventFullAppAdmin extends StatefulWidget {

  

  @override
  _EventFullAppState createState() => _EventFullAppState();
}

class _EventFullAppState extends State<EventFullAppAdmin>
    with SingleTickerProviderStateMixin {
  int _currentIndex = 0;

  late CustomTheme customTheme;
  late ThemeData theme;
  String? _name = null;

  TabController? _tabController;

  _handleTabSelection() {
    setState(() {
      _currentIndex = _tabController!.index;
    });
  }

  @override
  void initState() {
    customTheme = AppTheme.customTheme;
    theme = AppTheme.theme;
    _name = getCurrentUserId();
    _tabController = TabController(length: 4, vsync: this, initialIndex: 0);
    _tabController!.addListener(_handleTabSelection);
    _tabController!.animation!.addListener(() {
      final aniValue = _tabController!.animation!.value;
      if (aniValue - _currentIndex > 0.5) {
        setState(() {
          _currentIndex = _currentIndex + 1;
        });
      } else if (aniValue - _currentIndex < -0.5) {
        setState(() {
          _currentIndex = _currentIndex - 1;
        });
      }
    });
    super.initState();
  }

  onTapped(value) {
    setState(() {
      _currentIndex = value;
    });
  }

  @override
  dispose() {
    super.dispose();
    _tabController!.dispose();
  }

   String? getCurrentUserId() {
    User? user = FirebaseAuth.instance.currentUser;

    // Check if there is a currently signed-in user
    if (user != null) {
      String? userId = user.email;
      return userId;
    } else {
      // No user is signed in
        return null ;
      }
    }
  
  @override
 @override
Widget build(BuildContext context) {
  return Consumer<AppNotifier>(
    builder: (BuildContext context, AppNotifier value, Widget? child) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: theme,
        home: Scaffold(
          bottomNavigationBar: BottomAppBar(
            elevation: 0,
            shape: CircularNotchedRectangle(),
            child: MyCard(
              color: theme.colorScheme.background,
              shadow: MyShadow(
                position: MyShadowPosition.top,
                elevation: 2,
                alpha: 20,
              ),
              padding: EdgeInsets.only(top: 12, bottom: 12),
              child: TabBar(
                controller: _tabController,
                indicator: BoxDecoration(),
                indicatorSize: TabBarIndicatorSize.tab,
                indicatorColor: theme.colorScheme.primary,
                tabs: <Widget>[
                  Container(
                      child: (_currentIndex == 0)
                          ? Column(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                Icon(
                                  LucideIcons.home,
                                  color: theme.colorScheme.primary,
                                ),
                                Container(
                                  margin: EdgeInsets.only(top: 4),
                                  decoration: BoxDecoration(
                                    color: theme.primaryColor,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(2.5)),
                                  ),
                                  height: 5,
                                  width: 5,
                                )
                              ],
                            )
                          : Icon(
                              LucideIcons.home,
                              color: theme.colorScheme.onBackground,
                            ),
                    ),
                  Container(
                    child: (_currentIndex == 1)
                        ? Column(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              Icon(
                                LucideIcons.plus,
                                color: theme.colorScheme.primary,
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 4),
                                decoration: BoxDecoration(
                                  color: theme.primaryColor,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(2.5)),
                                ),
                                height: 5,
                                width: 5,
                              )
                            ],
                          )
                        : Icon(
                            LucideIcons.plus,
                            color: theme.colorScheme.onBackground,
                          ),
                  ),
                  Container(
                    child: (_currentIndex == 2)
                        ? Column(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              Icon(
                                LucideIcons.ticket,
                                color: theme.colorScheme.primary,
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 4),
                                decoration: BoxDecoration(
                                  color: theme.primaryColor,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(2.5)),
                                ),
                                height: 5,
                                width: 5,
                              )
                            ],
                          )
                        : Icon(
                            LucideIcons.ticket,
                            color: theme.colorScheme.onBackground,
                          ),
                  ),
                  Container(
                    child: (_currentIndex == 3)
                        ? Column(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              Icon(
                                LucideIcons.user,
                                color: theme.colorScheme.primary,
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 4),
                                decoration: BoxDecoration(
                                  color: theme.primaryColor,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(2.5)),
                                ),
                                height: 5,
                                width: 5,
                              )
                            ],
                          )
                        : Icon(
                            LucideIcons.user,
                            color: theme.colorScheme.onBackground,
                          ),
                  ),
                ],
              ),
            ),
          ),
          body: TabBarView(
          controller: _tabController,
          children: <Widget>[
              EventHomeScreen() ,
              EventCreateScreen(),
            EventUpcomingScreen(),
            EventProfileScreen(),
          ],
        ),
        ),
      );
    },
  );
}
}
