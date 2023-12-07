import 'package:jambicraff/helpers/extensions/widgets_extension.dart';
import 'package:jambicraff/helpers/theme/app_theme.dart';
import 'package:jambicraff/helpers/widgets/my_spacing.dart';
import 'package:jambicraff/helpers/widgets/my_text.dart';
import 'package:jambicraff/widgets/material/carousel/animated_carousel.dart';
import 'package:jambicraff/widgets/material/carousel/hotel_carousel.dart';
import 'package:jambicraff/widgets/material/carousel/news_carousel.dart';
import 'package:jambicraff/widgets/material/carousel/simple_carousel.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';

class CarouselsScreen extends StatefulWidget {
  @override
  _CarouselsScreenState createState() => _CarouselsScreenState();
}

class _CarouselsScreenState extends State<CarouselsScreen> {
  late ThemeData theme;

  @override
  void initState() {
    super.initState();
    theme = AppTheme.theme;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: Icon(
            LucideIcons.chevronLeft,
            size: 20,
          ).autoDirection(),
        ),
        title: MyText.titleMedium(
          'Carousels',
          fontWeight: 600,
        ),
      ),
      body: DefaultTabController(
        length: 4,
        initialIndex: 0,
        child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            elevation: 1,
            toolbarHeight: 48,
            flexibleSpace: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                /*-------------- Build Tabs here ------------------*/
                TabBar(isScrollable: true, tabs: getTabs())
              ],
            ),
          ),

          /*--------------- Build Tab body here -------------------*/
          body: Container(
              padding: MySpacing.all(16),
              child: TabBarView(children: getTabContents())),
        ),
      ),
    );
  }

  List<Tab> getTabs() {
    List<String> tabNames = [
      'Simple',
      'Animated',
      'Hotel',
      'News',
    ];

    List<Tab> tabs = [];

    for (String tabName in tabNames) {
      tabs.add(Tab(
          child: MyText.labelMedium(
        tabName,
        fontWeight: 700,
      )));
    }

    return tabs;
  }

  List<Widget> getTabContents() {
    return [
      SimpleCarousel(),
      AnimatedCarousel(),
      HotelCarousel(),
      NewsCarousel(),
    ];
  }
}
