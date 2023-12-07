/*
* File : Beveled Card
* Version : 1.0.0
* */

import 'package:jambicraff/images.dart';
import 'package:jambicraff/helpers/theme/app_theme.dart';
import 'package:jambicraff/helpers/widgets/my_spacing.dart';
import 'package:jambicraff/helpers/widgets/my_text.dart';
import 'package:flutter/material.dart';

class BeveledCard extends StatefulWidget {
  @override
  _BeveledCardState createState() => _BeveledCardState();
}

class _BeveledCardState extends State<BeveledCard> {
  late ThemeData theme;
  late CustomTheme customTheme;

  @override
  void initState() {
    super.initState();
    theme = AppTheme.theme;
    customTheme = AppTheme.customTheme;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      padding: MySpacing.all(0),
      children: <Widget>[
        Container(
            padding: MySpacing.fromLTRB(24, 24, 24, 0),
            child: _OneSidedBeveledCard()),
        Container(
            padding: MySpacing.fromLTRB(24, 24, 24, 0),
            child: _TwoSidedBeveledCard()),
        Container(padding: MySpacing.all(24), child: _BeveledCard()),
      ],
    ));
  }
}

class _BeveledCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    return Card(
      margin: MySpacing.all(0),
      elevation: 4,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      shape: BeveledRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Image(
            image: AssetImage(Images.profileBanner),
            height: 180,
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.fill,
          ),
          Container(
            padding: EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    MyText.titleMedium("Beveled", fontWeight: 600),
                    MyText.bodyMedium(
                        "Lorem ipsum, or lipsum as it is sometimes known, is dummy text used in laying out print, graphic or web designs.",
                        height: 1.2,
                        fontWeight: 500),
                    Container(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                          onPressed: () {},
                          child: MyText.labelMedium("ACTION",
                              fontWeight: 600,
                              color: themeData.colorScheme.primary)),
                    )
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class _OneSidedBeveledCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    return Card(
      margin: MySpacing.all(0),
      elevation: 4,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      shape: BeveledRectangleBorder(
        borderRadius: BorderRadius.only(topLeft: Radius.circular(20)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Image(
            image: AssetImage(Images.profileBanner),
            height: 180,
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.fill,
          ),
          Container(
            padding: EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    MyText.titleMedium("One Sided", fontWeight: 600),
                    MyText.bodyMedium(
                        "Lorem ipsum, or lipsum as it is sometimes known, is dummy text used in laying out print, graphic or web designs.",
                        height: 1.2,
                        fontWeight: 500),
                    Container(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                          onPressed: () {},
                          child: MyText.labelMedium("ACTION",
                              fontWeight: 600,
                              color: themeData.colorScheme.primary)),
                    )
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class _TwoSidedBeveledCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    return Card(
      margin: MySpacing.all(0),
      elevation: 4,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      shape: BeveledRectangleBorder(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20), topRight: Radius.circular(20)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Image(
            image: AssetImage(Images.profileBanner),
            height: 180,
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.fill,
          ),
          Container(
            padding: MySpacing.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    MyText.titleMedium("Two Sided", fontWeight: 600),
                    MyText.bodyMedium(
                        "Lorem ipsum, or lipsum as it is sometimes known, is dummy text used in laying out print, graphic or web designs.",
                        height: 1.2,
                        fontWeight: 500),
                    Container(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                          onPressed: () {},
                          child: MyText.labelMedium("ACTION",
                              fontWeight: 600,
                              color: themeData.colorScheme.primary)),
                    )
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
