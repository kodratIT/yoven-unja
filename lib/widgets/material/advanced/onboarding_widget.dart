/*
* File : Custom Onboarding
* Version : 1.0.0
* */

import 'package:jambicraff/helpers/theme/app_theme.dart';
import 'package:jambicraff/helpers/widgets/my_pages.dart';
import 'package:jambicraff/helpers/widgets/my_on_boarding.dart';
import 'package:jambicraff/helpers/widgets/my_text.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';

class OnBoardingWidget extends StatefulWidget {
  @override
  _OnBoardingWidgetState createState() => _OnBoardingWidgetState();
}

class _OnBoardingWidgetState extends State<OnBoardingWidget> {
  late CustomTheme customTheme;
  late ThemeData theme;

  @override
  void initState() {
    super.initState();
    customTheme = AppTheme.customTheme;
    theme = AppTheme.theme;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: MyOnBoarding(
      pages: <PageViewModel>[
        PageViewModel(
          theme.colorScheme.background,
          Padding(
            padding: EdgeInsets.all(40.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Center(
                    child: Icon(
                  LucideIcons.packageSearch,
                  size: MediaQuery.of(context).size.height * 0.22,
                  color: theme.colorScheme.onBackground.withAlpha(200),
                )),
                SizedBox(height: 30.0),
                MyText.bodyLarge('Find Lots of product\naround the world',
                    color: theme.colorScheme.onBackground.withAlpha(200),
                    letterSpacing: 0.2,
                    fontWeight: 600),
                SizedBox(height: 15.0),
                MyText.bodyMedium(
                    'Lorem ipsum dolor sit amet, consect adipiscing elit, sed do eiusmod tempor incididunt ut labore et.',
                    color: theme.colorScheme.onBackground.withAlpha(200),
                    letterSpacing: 0.1,
                    fontWeight: 500),
              ],
            ),
          ),
        ),
        PageViewModel(
          theme.colorScheme.background,
          Padding(
            padding: EdgeInsets.all(40.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Center(
                    child: Icon(
                  LucideIcons.creditCard,
                  size: MediaQuery.of(context).size.height * 0.22,
                  color: theme.colorScheme.onBackground.withAlpha(190),
                )),
                SizedBox(height: 30.0),
                MyText.bodyLarge('Secure payment\nwith SSL ',
                    color: theme.colorScheme.onBackground.withAlpha(200),
                    letterSpacing: 0.2,
                    fontWeight: 600),
                SizedBox(height: 15.0),
                MyText.bodyMedium(
                    'Lorem ipsum dolor sit amet, consect adipiing elit, sed do eiusmod tempor incididunt ut labore et.',
                    color: theme.colorScheme.onBackground.withAlpha(200),
                    letterSpacing: 0.1,
                    fontWeight: 500),
              ],
            ),
          ),
        ),
        PageViewModel(
          theme.colorScheme.background,
          Padding(
            padding: EdgeInsets.all(40.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Center(
                    child: Icon(
                  LucideIcons.truck,
                  size: MediaQuery.of(context).size.height * 0.22,
                  color: theme.colorScheme.onBackground.withAlpha(200),
                )),
                SizedBox(height: 30.0),
                MyText.bodyLarge('Fast delivery\nat a snap',
                    color: theme.colorScheme.onBackground.withAlpha(200),
                    letterSpacing: 0.2,
                    fontWeight: 600),
                SizedBox(height: 15.0),
                MyText.bodyMedium(
                    'Lorem ipsum dolor sit amet, consect adicing elit, sed do eiusmod tempor incididunt ut labore et.',
                    color: theme.colorScheme.onBackground.withAlpha(200),
                    letterSpacing: 0.1,
                    fontWeight: 500),
              ],
            ),
          ),
        ),
      ],
      unSelectedIndicatorColor: theme.colorScheme.secondary,
      selectedIndicatorColor: theme.colorScheme.primary,
      doneWidget: InkWell(
        splashColor: theme.colorScheme.secondary,
        onTap: () {
          Navigator.of(context).pop();
        },
        child: Container(
          padding: EdgeInsets.all(8),
          child: MyText.titleSmall("DONE".toUpperCase(),
              color: theme.colorScheme.primary,
              fontWeight: 700,
              letterSpacing: 0.6),
        ),
      ),
      skipWidget: InkWell(
        splashColor: theme.colorScheme.secondary,
        onTap: () {
          Navigator.of(context).pop();
        },
        child: Container(
          padding: EdgeInsets.all(8),
          child: MyText.titleSmall("Skip".toUpperCase(),
              color: theme.colorScheme.secondary,
              fontWeight: 700,
              letterSpacing: 0.6),
        ),
      ),
    ));
  }
}
