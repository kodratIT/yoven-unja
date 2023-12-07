/*
* File : Animated Carousel
* Version : 1.0.0
* */

import 'dart:async';

import 'package:jambicraff/helpers/theme/app_theme.dart';
import 'package:jambicraff/helpers/widgets/my_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:lucide_icons/lucide_icons.dart';

class AnimatedCarouselWidget extends StatefulWidget {
  @override
  _AnimatedCarouselWidgetState createState() => _AnimatedCarouselWidgetState();
}

class _AnimatedCarouselWidgetState extends State<AnimatedCarouselWidget>
    with SingleTickerProviderStateMixin {
  late CustomTheme customTheme;
  late ThemeData theme;

  final int _numPages = 3;

  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;
  late Timer timerAnimation;

  List<Widget> _buildPageIndicatorAnimated() {
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
  void initState() {
    super.initState();
    customTheme = AppTheme.customTheme;
    theme = AppTheme.theme;
    timerAnimation = Timer.periodic(Duration(seconds: 5), (Timer timer) {
      if (_currentPage < _numPages - 1) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }

      _pageController.animateToPage(
        _currentPage,
        duration: Duration(milliseconds: 600),
        curve: Curves.ease,
      );
    });
  }

  @override
  void dispose() {
    super.dispose();
    timerAnimation.cancel();
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      tag: 'animated_carousel_widget',
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
              title: MyText.titleMedium("Animated Carousel", fontWeight: 600),
            ),
            body: Container(
                color: theme.colorScheme.background,
                child: Column(
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
                            children: _buildPageIndicatorAnimated(),
                          ),
                        ),
                      ],
                    ),
                    Expanded(
                      child: Center(
                        child: MyText.titleMedium("Body content",
                            color: theme.colorScheme.onBackground,
                            letterSpacing: 0.3),
                      ),
                    )
                  ],
                )));
      },
    );
  }
}
