/*
* File : Hotel Carousel
* Version : 1.0.0
* */

import 'package:jambicraff/images.dart';
import 'package:jambicraff/helpers/theme/app_theme.dart';
import 'package:jambicraff/helpers/widgets/my_button.dart';
import 'package:jambicraff/helpers/widgets/my_spacing.dart';
import 'package:jambicraff/helpers/widgets/my_text.dart';
import 'package:flutter/material.dart';

class HotelCarousel extends StatefulWidget {
  @override
  _HotelCarouselState createState() => _HotelCarouselState();
}

class _HotelCarouselState extends State<HotelCarousel> {
  late ThemeData theme;
  late CustomTheme customTheme;

  @override
  void initState() {
    super.initState();
    theme = AppTheme.theme;
    customTheme = AppTheme.customTheme;
  }

  final int _numPages = 3;
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;

  List<Widget> _buildPageIndicatorStatic() {
    List<Widget> list = [];
    for (int i = 0; i < _numPages; i++) {
      list.add(i == _currentPage ? _indicator(true) : _indicator(false));
    }
    return list;
  }

  Widget _indicator(bool isActive) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      curve: Curves.easeInToLinear,
      margin: MySpacing.symmetric(horizontal: 4.0),
      height: 8.0,
      width: 8,
      decoration: BoxDecoration(
        color: isActive
            ? theme.colorScheme.primary
            : theme.colorScheme.primary.withAlpha(120),
        borderRadius: BorderRadius.all(Radius.circular(4)),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: <Widget>[
        Expanded(
          child: PageView(
            pageSnapping: true,
            physics: ClampingScrollPhysics(),
            controller: _pageController,
            onPageChanged: (int page) {
              setState(() {
                _currentPage = page;
              });
            },
            children: <Widget>[
              _SingleHotelPage(
                image: Images.places[0],
                name: 'Cuba',
              ),
              _SingleHotelPage(
                name: 'London',
                image: Images.places[1],
              ),
              _SingleHotelPage(
                image: Images.places[2],
                name: 'Paris',
              ),
            ],
          ),
        ),
        Container(
          padding: MySpacing.all(16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: _buildPageIndicatorStatic(),
          ),
        ),
      ],
    ));
  }
}

class _SingleHotelPage extends StatelessWidget {
  final String image, name;

  const _SingleHotelPage({Key? key, required this.image, required this.name})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    return Container(
      padding: MySpacing.fromLTRB(16, 0, 16, 8),
      child: Card(
        elevation: 2,
        clipBehavior: Clip.hardEdge,
        margin: MySpacing.all(0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
              child: Image(image: AssetImage(image), fit: BoxFit.fill),
            ),
            Container(
              padding: MySpacing.fromLTRB(24, 24, 16, 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  MyText.headlineSmall(
                    name.toUpperCase(),
                    fontWeight: 700,
                  ),
                  MySpacing.height(16),
                  MyText.bodyLarge('St. James\'s Club Morgan Bay',
                      fontWeight: 500),
                  MyText.titleSmall('Hotel Nacional de Cuba', fontWeight: 500),
                  MyText.titleSmall('Memories Trinidad Del Mar',
                      fontWeight: 500),
                  MySpacing.height(24),
                  Center(
                    child: MyButton(
                        elevation: 0,
                        borderRadiusAll: 4,
                        onPressed: () {},
                        child: MyText.bodyMedium(("Book at $name"),
                            color: themeData.colorScheme.onSecondary,
                            letterSpacing: 0.2)),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
