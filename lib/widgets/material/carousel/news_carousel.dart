/*
* File : News Carousel
* Version : 1.0.0
* */

import 'package:jambicraff/images.dart';
import 'package:jambicraff/helpers/theme/app_theme.dart';
import 'package:jambicraff/helpers/widgets/my_spacing.dart';
import 'package:jambicraff/helpers/widgets/my_text.dart';
import 'package:flutter/material.dart';

class NewsCarousel extends StatefulWidget {
  @override
  _NewsCarouselState createState() => _NewsCarouselState();
}

class _NewsCarouselState extends State<NewsCarousel> {
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
  final String _newsContent =
      "Lorem ipsum, or lipsum as it is sometimes known, is dummy text used in laying out print, graphic or web designs. The passage is attributed to an unknown typesetter in the 15th century who is thought to have scrambled parts of Cicero's De Finibus Bonorum et Malorum for use in a type specimen book.";

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
              _SingleNewsPage(
                image: Images.portraits[0],
                title: "What happened at MOUNTAIN?",
                date: "June 18, 2020",
                description: _newsContent,
                view: 290,
              ),
              _SingleNewsPage(
                image: Images.portraits[1],
                title: "What happened under SEA?",
                date: "April 12, 2020",
                description: _newsContent,
                view: 3481,
              ),
              _SingleNewsPage(
                image: Images.portraits[2],
                title: "What happened at CUBA?",
                date: "Feb 14, 2020",
                description: _newsContent,
                view: 4852,
              ),
            ],
          ),
        ),
        Container(
          padding: MySpacing.bottom(16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: _buildPageIndicatorStatic(),
          ),
        ),
      ],
    ));
  }
}

class _SingleNewsPage extends StatelessWidget {
  final String image, date, title, description;
  final int view;

  const _SingleNewsPage(
      {Key? key,
      required this.image,
      required this.date,
      required this.title,
      required this.description,
      required this.view})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    return Container(
      padding: MySpacing.fromLTRB(16, 0, 16, 16),
      child: Card(
        elevation: 2,
        margin: MySpacing.all(0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
              child: Image(
                image: AssetImage(image),
                width: MediaQuery.of(context).size.width,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              padding: MySpacing.fromLTRB(24, 24, 24, 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      MyText.bodyMedium(date, fontWeight: 700),
                      Container(
                        margin: MySpacing.only(top: 16),
                        child: MyText.titleLarge(title, fontWeight: 700),
                      ),
                      Container(
                        margin: MySpacing.top(16),
                        child: MyText.bodyMedium(description,
                            fontWeight: 500, height: 1.2),
                      ),
                      Container(
                        margin: MySpacing.top(8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            Container(
                                margin: MySpacing.left(16),
                                child: Icon(
                                  Icons.visibility_outlined,
                                  color: themeData.colorScheme.onBackground
                                      .withAlpha(200),
                                  size: 20,
                                )),
                            Container(
                              margin: MySpacing.only(left: 4),
                              child: MyText.bodySmall(view.toString(),
                                  fontWeight: 700),
                            ),
                          ],
                        ),
                      ),
                      Center(
                        child: ElevatedButton(
                            onPressed: () {},
                            child: MyText.bodyMedium("READ MORE",
                                fontWeight: 700,
                                color: themeData.colorScheme.onPrimary)),
                      )
                    ],
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
