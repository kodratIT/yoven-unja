/*
* File : Simple Carousel
* Version : 1.0.0
* */

import 'package:jambicraff/helpers/theme/app_theme.dart';
import 'package:jambicraff/helpers/widgets/my_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lucide_icons/lucide_icons.dart';

class SimpleCarouselWidget extends StatefulWidget {
  @override
  _SimpleCarouselWidgetState createState() => _SimpleCarouselWidgetState();
}

class _SimpleCarouselWidgetState extends State<SimpleCarouselWidget> {
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

  late CustomTheme customTheme;
  late ThemeData theme;

  @override
  void initState() {
    super.initState();
    customTheme = AppTheme.customTheme;
    theme = AppTheme.theme;
  }

  Widget _indicator(bool isActive) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      curve: Curves.easeInToLinear,
      margin: EdgeInsets.symmetric(horizontal: 4.0),
      height: 8.0,
      width: 8,
      decoration: BoxDecoration(
        color: isActive ? Colors.white : Colors.white.withAlpha(140),
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
    return GetBuilder(
      tag: 'simple_carousel_widget',
      builder: (controller) {
        return Scaffold(
            appBar: AppBar(
              elevation: 0,
              leading: InkWell(
                onTap: () => Navigator.of(context).pop(),
                child: Icon(
                  LucideIcons.chevronLeft,
                  size: 20,
                ),
              ),
              title: MyText.titleMedium("Simple Carousel", fontWeight: 600),
            ),
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Stack(
                  alignment: AlignmentDirectional.center,
                  children: <Widget>[
                    Container(
                      color: theme.primaryColor,
                      height: MediaQuery.of(context).size.height * 0.3,
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
                          Padding(
                            padding: const EdgeInsets.only(right: 0),
                            child: Image.asset(
                              './assets/images/apps/shopping/headphone.jpg',
                              height: 240.0,
                              fit: BoxFit.fill,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(0.0),
                            child: Image.asset(
                              './assets/images/apps/shopping/headphone-1.jpg',
                              height: 240.0,
                              fit: BoxFit.fill,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(0.0),
                            child: Image.asset(
                              './assets/images/apps/shopping/headphone.jpg',
                              height: 240.0,
                              fit: BoxFit.fill,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      bottom: 10,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: _buildPageIndicatorStatic(),
                      ),
                    ),
                  ],
                ),
                Expanded(
                  flex: 1,
                  child: Center(
                    child: MyText.titleMedium("Body content",
                        color: theme.colorScheme.onBackground,
                        letterSpacing: 0.3),
                  ),
                )
              ],
            ));
      },
    );
  }
}
